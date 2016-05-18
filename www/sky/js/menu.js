/* 
Simple JQuery menu.
Copyright 2007-2010 by Marco van Hylckama Vlieg
Free to use any way you like.
*/
jQuery.fn.initMenu = function() {  
    return this.each(function(){
        $('.acitem', this).hide();
        // $('li.expand > .acitem', this).show();
        // $('li.expand > .acitem', this).prev().addClass('active');
		$('.expand a').addClass('active');
        $('li a', this).click(
            function(e) {
                //e.stopImmediatePropagation();
                // var theElement = $(this).next();
                // var parent = this.parentNode.parentNode;
				// if(theElement.hasClass('acitem') && !theElement.is(':visible')) {         
					// $('.acitem:visible', parent).first().slideUp(550, function() {
						// $(this).prev().removeClass('active');
					// });
					// theElement.slideDown(550, function() {
						// $(this).prev().addClass('active');
					// });
					// return false;
				// }
				if(!$(this).hasClass('active')){
					if( $(this).parent().parent().hasClass('acitem') )
						return;
					var next = $(this).next();
					var parent = this.parentNode.parentNode;
					$('.active').removeClass('active');
					$(this).addClass('active');
					$('.acitem:visible', parent).first().slideUp(550);
					if(next.hasClass('acitem') && !next.is(':visible') ) {
						next.slideDown(550);
					}
				}
			}
		);
	});
};