$(function() {

			$('#MOVE_TOP_BTN').fadeOut();
			$(window).scroll(function() {
				if ($(this).scrollTop() < 1) {
					$('#MOVE_TOP_BTN').fadeOut();
				} else {
					$('#MOVE_TOP_BTN').fadeIn();
				}
			});

			$("#MOVE_TOP_BTN").click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});