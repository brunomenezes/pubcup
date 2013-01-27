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

    resizeElementToFullScreen( $(".helper") );
    resizeElementToFullScreen(helpContent);

    $('.help').click(function() {
    	$('.helper-page').fadeIn('slow');
    });

    $('span.close-helper').click(function() {
        $('.helper-page').slideUp('slow'); 
    });
});