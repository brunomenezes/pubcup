/**
 *
 * Recarrega o elemento para ocupar toda tela
 *
**/
function resizeElementToFullScreen( element ) {
	var header = $("#header").height();
	var footer = $("#footer").height();
	var total  = $(window).height() - (header + footer);  

	$(element).height(total);
}

jQuery(function($) {
    var helpContent = $('.helper-page');

    window.onresize = function(event) {
        resizeElementToFullScreen( $(".helper") );
        resizeElementToFullScreen(helpContent);
        if( $(".map").length )
        	resizeElementToFullScreen( $(".map") );
    }

    $('.help').click(function() {
        resizeElementToFullScreen(helpContent);
    	helpContent.fadeIn('slow');
    });

    $('#close-helper').click(function() {
        $('.helper-page').fadeOut('slow'); 
    });
});