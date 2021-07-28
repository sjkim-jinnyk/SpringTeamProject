$(document).ready(function() { 
	$(window).scroll(function() { 
		if ($(this).scrollTop() > 200) { 
			$('.up-arrow').fadeIn(); 
			} else { $('.up-arrow').fadeOut(); 
			} 
		} 
	); 
});