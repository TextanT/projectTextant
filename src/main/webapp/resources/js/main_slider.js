var swiper = new Swiper('.swiper-container', {
			slidesPerView : 3,
			centeredSlides : true,
			spaceBetween : 30,
			grabCursor : true,
			preloadImages : false,
			lazy : true,
			autoplay : {
				delay : 1500,
			},
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
		      },

			
		});
		function slidestop() {
			swiper.autoplay.stop();
		};
		function slidestart() {
			swiper.autoplay.start();
		};