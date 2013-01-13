jQuery(function($) {
    $( ".datepicker" ).datetimepicker({ 
    	dateFormat: 'dd/mm/yy',
    	onSelect: function(selectedDateTime) {
    		var splitedDateTime 	= selectedDateTime.split(" ");
    		var arrDate 			= splitedDateTime[0];
    		var arrHour 			= splitedDateTime[1];
    		var splitedDate 		= arrDate.split("/");
    		var splitedHour 		= arrHour.split(":");

    		$('#date_day').val(splitedDate[0]);
    		$('#date_month').val(splitedDate[1]);
    		$('#date_year').val(splitedDate[2]);
    		$('#date_hour').val(splitedHour[0]);
    		$('#date_minute').val(splitedHour[1]);
    	}
	});
    if( $('.teams-check :checkbox').length > 0 ) {
    	$('form').submit(function() {
    		if( $('.teams-check :checkbox:checked').length != 2 ) {
    			alert('Um jogo deve obrigatoriamente ter dois times.');
    			$(this).attr('checked', false);
    			return false;
    		}
    	});
    }
  });
