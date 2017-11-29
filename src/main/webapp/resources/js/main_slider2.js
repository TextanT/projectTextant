var KNBUI = KNBUI || {};

		KNBUI.keyVisual = (function($) {

			// start visual
			function visual() {
				if (!$('.visual').length) {
					return;
				}

				var visual = $('.visual'), ctrlBtn = $('.visual-controller a'), visualList = $('.visual-list li'), btnStop = $('.btn-stop'), btnPlay = $('.btn-play'), max = visualList
						.size() - 1, current = 0, auto, autoPlay = true, // 자동재생
				start = 2, // 시작설정 0부터 시작
				playSpeed = 4000; // 단위 1000/1초

				function show(num) {
					ctrlBtn.eq(num).addClass('active');
					visualList.eq(num).fadeIn().addClass('active');
				}

				function next() {
					var n = current;
					if (n < max) {
						n++;
					} else {
						n = 0;
					}
					return n;
				}

				function clear(num) {
					ctrlBtn.eq(num).removeClass('active');
					visualList.eq(num).fadeOut().removeClass('active');
				}

				function play() {
					ctrlBtn.eq(next()).trigger('click');
				}

				ctrlBtn.eq(start).addClass('active');
				show(start);

				ctrlBtn.each(function(index) {
					$(this).data('number', index);
				});

				current = start;

				if (autoPlay) {
					auto = setInterval(play, playSpeed);
					btnStop.addClass('active');
				}

				ctrlBtn.on('click', function(e) {
					e.preventDefault();
					var idx = $(this).data('number');
					clear(current);
					show(idx);
					current = idx;
				});

				ctrlBtn.hover(function() {
					if (autoPlay) {
						clearInterval(auto);
					}
				}, function() {
					if (autoPlay) {
						auto = setInterval(play, playSpeed);
					}
				});

				btnStop.on('click', function(e) {
					e.preventDefault();
					clearInterval(auto);

					btnStop.removeClass('active');
					btnPlay.addClass('active');
					autoPlay = false;

				});

				btnPlay.on('click', function(e) {
					e.preventDefault();
					auto = setInterval(play, playSpeed);

					btnPlay.removeClass('active');
					btnStop.addClass('active');
					autoPlay = true;
				});

			}
			// end visual

			return {
				visual : visual,
			// gallery : gallery
			}

		}(jQuery));

		$(document).ready(function() {
			KNBUI.keyVisual.visual();
		});