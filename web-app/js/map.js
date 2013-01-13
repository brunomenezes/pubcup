var map;
var animation = false;
var plotMapControl = {};

function center( map ){
	if( navigator.geolocation ){
		navigator.geolocation.getCurrentPosition(function(position) {
            var pos = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
            map.setCenter(pos);
            map.setZoom(18);
		});
	}
}

function initialize() {
	var mapOptions = {
		center : new google.maps.LatLng(-22.909079507, -43.1770692),
		zoom : 18,
		mapTypeId : google.maps.MapTypeId.ROADMAP,
		disableDefaultUI : true
	};

  map = new google.maps.Map(document.getElementById("map_canvas"),mapOptions);
 
  $('#center').click(function(){
		center(map);
	});
	 

window.setInterval(function() {
  	 	var bound = map.getBounds();
		var lat1 = bound.ca.f;
		var long1 = bound.ca.b;
		var lat2 = bound.ea.f;
		var long2 = bound.ea.b;
		ajax({
		  	 url : config.contextPath + "/home/near/",
		  	 data : {lat1:lat1 , long1:long1 , lat2:lat2, long2:long2},
		  	 traditional : true,
		  	 success : plotLocations
		 });	
}, 5000);
}

function plotLocations(locations){
	var marker;
	for(i=0 ; i<locations.length ;i++) {
		createMarker(locations[i]);
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
      	google.maps.event.addListener(marker,'click', function(){
          $("#toasterPlace").html($('#spinner').html());
          if(obj.id){
            $("#toasterPlace").load(config.contextPath + '/home/showLocationToaster', {locationId: obj.id}, function(){
              reloadCountDown();
            });  
          }
    	});
    	plotMapControl[hash]=marker;
  	}
  	return marker;
}

function getKey(obj){
	return obj.lat+" "+obj.lng+" "+obj.name;
}


function ajax(options){
	$.ajax(options);
}

initialize();
