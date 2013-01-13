function turnEditable(obj) {
	var content = $(obj).html();
	
	var textArea = jQuery('<textarea />');
	$(textArea).attr('name','locationDescription');
	$(textArea).attr('id','locationDescription');
	$(textArea).val(content);

	var submitButton = jQuery('<a />');
	$(submitButton).attr( 'href','javascript:updateLocationDescription();' );
	$(submitButton).attr( 'name','updateButton' );
	$(submitButton).attr( 'id','updateButton' );
	$(submitButton).html( 'Atualizar descrição' );

	var cancelButton = jQuery('<a />');
	$(cancelButton).attr( 'href', 'javascript:revertUpdate()');
	$(cancelButton).attr( 'name', 'revertUpdate');
	$(cancelButton).attr( 'id', 'revertUpdate');
	$(cancelButton).html( 'Cancelar atualização' );
	
	$(cancelButton).insertAfter( $(obj) );
	$(submitButton).insertAfter( $(obj) );
	$(textArea).insertAfter( $(obj) );
	$(obj).hide();
	$("#editMessage").hide();
}

function revertUpdate() {
	$("#locationDescription").remove();
	$("#revertUpdate").remove();
	$("#updateButton").remove();
	
	$("#originalDescription").show();
	$("#editMessage").show();
}

function updateLocationDescription() {
	var locationDescription = $("#locationDescription").val();

	$.ajax({
	  	 url : config.contextPath + "/location/updateDescription/",
	  	 data : {locationId: $("#locationId").val(), description: locationDescription},
	  	 traditional : true,
	  	 success : populateResult
	 });
}

function populateResult(result) {
	if(result == "true") {
		var textArea = $("#locationDescription");
		var newDescription = $(textArea).val();
	
		var p = $("#originalDescription");
		$(p).html( newDescription );
		$(p).show();
		$("#editMessage").show();
		
		$(textArea).remove();
		$('#revertUpdate').remove();
		$('#updateButton').remove();
	}
}

$(document).ready(function() {
	$("body").addClass("show-location");
});