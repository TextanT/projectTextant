/* Documentation sample */

function loadPage(page) {

	var img = $('<img />');
	img.load(function() {
		var container = $('.sample-docs .p'+page);
		img.css({width: container.width(), height: container.height()});
		img.appendTo($('.sample-docs .p'+page));
		container.find('.loader').remove();
	});

	img.attr('src', 'pages/' +  (page-2) + '.png');

}

function addPage(page, book) {

	var id, pages = book.turn('pages');

	var element = $('<div />', {});

	if (book.turn('addPage', element, page)) {
		if (page<28) {
			element.html('<div class="gradient"></div><div class="loader"></div>');
			loadPage(page);
		}
	}
}

function updateTabs() {
	
	var tabs = {7: 'Clases', 12:'Constructor', 14:'Properties', 16:'Methods', 23:'Events'},
		left = [],
		right = [],
		book = $('.sample-docs'),
		actualPage = book.turn('page'),
		view = book.turn('view');

	for (var page in tabs) {
		var isHere = $.inArray(parseInt(page, 10), view)!=-1;

		if (page>actualPage && !isHere)
			right.push('<a href="#page/' + page + '">' + tabs[page] + '</a>');
		else if (isHere) {
			
			if (page%2===0)
				left.push('<a href="#page/' + page + '" class="on">' + tabs[page] + '</a>');
			else
				right.push('<a href="#page/' + page + '" class="on">' + tabs[page] + '</a>');
		} else
			left.push('<a href="#page/' + page + '">' + tabs[page] + '</a>');

	}

	$('.sample-docs .tabs .left').html(left.join(''));
	$('.sample-docs .tabs .right').html(right.join(''));

}


function numberOfViews(book) {
	return book.turn('pages') / 2 + 1;
}


function getViewNumber(book, page) {
	return parseInt((page || book.turn('page'))/2 + 1, 10);
}


function moveBar(yes) {
	if (Modernizr && Modernizr.csstransforms) {
		$('#slider .ui-slider-handle').css({zIndex: yes ? -1 : 10000});
	}
}

function setPreview(view) {

	var previewWidth = 115,
		previewHeight = 73,
		previewSrc = 'pics/preview.jpg',
		preview = $(_thumbPreview.children(':first')),
		numPages = (view==1 || view==$('#slider').slider('option', 'max')) ? 1 : 2,
		width = (numPages==1) ? previewWidth/2 : previewWidth;

	_thumbPreview.
		addClass('no-transition').
		css({width: width + 15,
			height: previewHeight + 15,
			top: -previewHeight - 30,
			left: ($($('#slider').children(':first')).width() - width - 15)/2
		});

	preview.css({
		width: width,
		height: previewHeight
	});

	if (preview.css('background-image')==='' ||
		preview.css('background-image')=='none') {

		preview.css({backgroundImage: 'url(' + previewSrc + ')'});

		setTimeout(function(){
			_thumbPreview.removeClass('no-transition');
		}, 0);

	}

	preview.css({backgroundPosition:
		'0px -'+((view-1)*previewHeight)+'px'
	});
}

// Set the width and height for the viewport

function resizeViewport() {

	var width = $(window).width(),
		height = $(window).height(),
		options = $('.sample-docs').turn('options');

	$('.sample-docs').removeClass('animated');

	$('.canvas').css({
		width: width,
		height: height
	}).
	zoom('resize');


	if ($('.sample-docs').turn('zoom')==1) {
		var bound = calculateBound({
			width: options.width,
			height: options.height,
			boundWidth: Math.min(options.width, width),
			boundHeight: Math.min(options.height, height)
		});

		if (bound.width%2!==0)
			bound.width-=1;

			
		if (bound.width!=$('.sample-docs').width() || bound.height!=$('.sample-docs').height()) {

			$('.sample-docs').turn('size', bound.width, bound.height);

			if ($('.sample-docs').turn('page')==1)
				$('.sample-docs').turn('peel', 'br');

			$('.next-button').css({height: bound.height, backgroundPosition: '-38px '+(bound.height/2-32/2)+'px'});
			$('.previous-button').css({height: bound.height, backgroundPosition: '-4px '+(bound.height/2-32/2)+'px'});
		}

		$('.sample-docs').css({top: -bound.height/2, left: -bound.width/2});
	}

	var magazineOffset = $('.sample-docs').offset(),
		boundH = height - magazineOffset.top - $('.sample-docs').height(),
		marginTop = (boundH - $('.thumbnails > div').height()) / 2;

	if (marginTop<0) {
		$('.thumbnails').css({height:1});
	} else {
		$('.thumbnails').css({height: boundH});
		$('.thumbnails > div').css({marginTop: marginTop});
	}

	if (magazineOffset.top<$('.made').height())
		$('.made').hide();
	else
		$('.made').show();

	$('.sample-docs').addClass('animated');
	
}

//Load large page

function loadLargePage(page, pageElement) {
	
	var img = $('<img />');

	img.load(function() {

		var prevImg = pageElement.find('img');
		$(this).css({width: '100%', height: '100%'});
		$(this).appendTo(pageElement);
		prevImg.remove();
		
	});

	// Loadnew page
	
	img.attr('src', 'pages/' +  page + '.jpg');
}

// Load small page

function loadSmallPage(page, pageElement) {
	
	var img = pageElement.find('img');

	img.css({width: '100%', height: '100%'});

	img.unbind('load');
	// Loadnew page

	img.attr('src', 'pages/' +  page + '.jpg');
}



