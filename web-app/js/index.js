var geocoder;
var map;
var marker;
var plotMapControl = {};
var holdNearSearch = false;
 
function initialize() {
	
    var latlng = new google.maps.LatLng(-18.8800397, -47.05878999999999);
    var options = {
        zoom: 5,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        scaleControl: false,
        streetViewControl: false,
        overviewMapControl: false,
        mapTypeControl: false,
        panControl: false,
        zoomControl: false
    };
 
    map = new google.maps.Map(document.getElementById("map_canvas"), options);
 
    geocoder = new google.maps.Geocoder();
 
    google.maps.event.addListener(map,'center_changed', function(){
        holdNearSearch = false;
    });

    google.maps.event.addListener(map,'bounds_changed', function(){
         
    });
    window.setInterval(function() {
	   if(!holdNearSearch) {
            var bound = map.getBounds();
            var lat1 = bound.getNorthEast().lat();
            var long1 = bound.getNorthEast().lng();
            var lat2 = bound.getSouthWest().lat();
            var long2 = bound.getSouthWest().lng();
            $.ajax({
                url : config.contextPath + "/home/near/",
                data : {lat1:lat1 , long1:long1 , lat2:lat2, long2:long2},
                traditional : true,
                success : plotLocations
            });
        }   
    }, 5000);
}

function plotLocations(locations){
	for(i=0 ; i<locations.length ;i++) {
		createMarker(locations[i]);
	}	
}

function loadToasterCreate(args){
    var template = $("#new-location-template");
    template.find(".address").text(args.name);
    template.find(".btn-create").attr('href', config.contextPath + "/location/create?lat=" + args.lat + "&lng=" + args.lng + "&address=" + args.name);
    $("#toasterPlace").html(template.html());
    $(".infobar").show();
}

function loadToaster(obj){
	$("#toasterPlace").load(config.contextPath + '/home/showLocationToaster', {locationId: obj.id}, function(){
        reloadCountDown();
    });
    var infobar = $(".infobar");
    if(!(infobar.css("display") == "block")) {
        infobar.toggle("drop");
    }
}

function recolorOthersPins() {
    var pinColor = "FE7569";
    var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
        new google.maps.Size(21, 34),
        new google.maps.Point(0,0),
        new google.maps.Point(10, 34)
    );
    for(var m in plotMapControl){
        plotMapControl[m].setIcon(pinImage);
    }
}

function createMarker(obj){
	var hash = getKey(obj);
	var marker = plotMapControl[hash]; 
	if(!marker){
		marker = new google.maps.Marker({
    		position: new google.maps.LatLng(obj.lat,obj.lng),
    		map: map,
    		title: obj.name,
    		animation : google.maps.Animation.DROP
  		});
        var pinColor = "00AEFF";
        var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
            new google.maps.Size(21, 34),
            new google.maps.Point(0,0),
            new google.maps.Point(10, 34)
        );
      	google.maps.event.addListener(marker,'click', function(){
            recolorOthersPins();
            marker.setIcon(pinImage);
            if(obj.id){
                loadToaster(obj);
            }else{
                loadToasterCreate(obj);
            }
    	});
    	plotMapControl[hash]=marker;
  	}
  	return marker;
}

function getKey(obj){
	return obj.lat+" "+obj.lng+" "+obj.name;
}

function center( map ){
	if( navigator.geolocation ){
		navigator.geolocation.getCurrentPosition(function(position) {
            var pos = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
            map.setCenter(pos);
            map.setZoom(18);
		});
	}
}

jQuery( function($) {
	$("body").addClass("home");
	
	initialize();
	
	function loadOnMap(address) {
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
 
                    $('#searchKey').val(results[0].formatted_address);
                    $('#txtLatitude').val(latitude);
                    $('#txtLongitude').val(longitude);
                }
            }
        });
    }
 
    $("#searchKey").blur(function() {
        if($(this).val() != "")
        	loadOnMap($(this).val());
    });

    //reescrevendo  parte do render menu para ficar separado por categoria de busca.
    $.widget( "custom.autocomplete", $.ui.autocomplete, {
        _renderMenu: function( ul, items ) {
          var that = this,
            currentCategory = "";
          $.each( items, function( index, item ) {
            if ( item.category != currentCategory ) {
              ul.append( "<li class='search-category-"+item.origin+"'>" + item.category + "</li>" );
              currentCategory = item.category;
            }

            that._renderItemData( ul, item.label );
          });
        }
     });
	
	$("#searchKey").autocomplete({
        source: function (request, response) {
            var googleRs, pubcupRs;
            geocoder.geocode({ 'address': request.term }, function (results, status) {
                googleRs = $.map(results, function (item) {
                    return {label:{
                        label: item.formatted_address,
                        value: item.formatted_address,
                        latitude: item.geometry.location.lat(),
                        longitude: item.geometry.location.lng()
                    }, category: "Google Results", origin: "google"}
                });
                if(pubcupRs && googleRs) response(pubcupRs.concat(googleRs));
            });
            
        	$.ajax({
        		url: config.contextPath + '/home/find',
        		traditional: true,
        		data: {q : request.term},
        		success : function(data) {
                    pubcupRs = $.map(data, function(item){
                        return {label:{
                            id: item.id,
                            label: item.name,
                            value: item.name,
                            latitude: item.lat,
                            longitude: item.lng
                        }, category : "Pubcup Results", origin: "pubcup"}
                    });
                    if(pubcupRs && googleRs) response(pubcupRs.concat(googleRs));
        		}
        	});
        },
        select: function (event, ui) {
            $("#txtLatitude").val(ui.item.latitude);
            $("#txtLongitude").val(ui.item.longitude);
            var locationData = {
            	id: ui.item.id,
                lat: ui.item.latitude,
                lng: ui.item.longitude,
                name: ui.item.label
            };
            createMarker(locationData);
            var location = new google.maps.LatLng(ui.item.latitude, ui.item.longitude);
            map.setCenter(location);
            map.setZoom(16);
            if(locationData.id){
            	loadToaster(locationData);
            }else{
            	loadToasterCreate(locationData);
            }
        }
    });

    $(".infobar").on('click', '#close' , function() {
        $(".infobar").toggle("drop");
    });
	
	$('#center').click(function(){
		center(map);
	}).trigger('click');
	
    function clearMarkers(){
        for(m in plotMapControl){
            plotMapControl[m].setMap(null);
            delete plotMapControl[m];
        }
    }

	$('#bt_show_game_list').click(function(e) {
        $('#games-list').fadeIn('slow');
    });

    $('#close-game-list').click(function(e) {
        $('#games-list').fadeOut('slow'); 
    });

    $('#games-list a').click(function(e) {
        clearMarkers(); holdNearSearch=true;
        var id      = this.id.replace(/[a-z_]+/,'');
        var data    = {};

        if( id != null && id != "" ) {
        	data = { id : id };
        }

        $.ajax({
            type: "GET",
            url : config.contextPath + "/location/findAllByGameId",
            data : data,
            dataType: 'json',
            success: function(data) {
                plotLocations(data);
            }
        });

        e.preventDefault();
    });
    
    $(window).resize( resizeElementToFullScreen( $(".map") ) );

    resizeElementToFullScreen( $(".map") );
});

