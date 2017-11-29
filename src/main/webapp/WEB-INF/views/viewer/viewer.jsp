<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>메뉴바 예제</title>

<style>
body{
/* background-color: #699; */}
*{margin:0; padding:0;}
.RightWrap{width:300px; height:100%; background:#69F; position:fixed; top:0; right:-300px; z-index:100;}
.close1{display:block; width:30px; height:30px; line-height:30px; font-size:13px; font-weight:bold; background:#fff; color:#69F; border-radius:15px; text-align:center; text-decoration:none; position:absolute; top:15px; right:15px;}
.open1{display:block; width:80px; height:50px; line-height:50px; background:#69F; position:absolute; top:30px; right:0px;}
.open1 span{display:block; width:30px; height:4px; background:#555; margin-bottom:2px;}
#canvas{
	float: left;
}

#comment{margin:80px 30px 50px 30px;}
#coShow{margin-top:30px;}

#comment table{width:100%; border:1px white dashed; }
.convert:hover{
	cursor: pointer;
}
</style>


<script src="/textant/resources/viewer/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/textant/resources/viewer/js/jquery.min.1.7.js"></script>
<script type="text/javascript" src="/textant/resources/viewer/js/jquery-ui-1.8.20.custom.min.js"></script>
<script type="text/javascript" src="/textant/resources/viewer/js/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="/textant/resources/viewer/js/modernizr.2.5.3.min.js"></script>
<script type="text/javascript" src="/textant/resources/viewer/js/hash.js"></script>






</head>

<body>
${fileName}
<br/>

	<a href="/textant/main.text" style="float: left;">뒤로</a>
	<br/>
	<c:if test="${bookType=='txt'}">
	<p class="convertToJpg convert" onclick="onclick1()">jpg로</p>
	</c:if>
	<c:if test="${bookType=='jpg'}">
	<p class="convertToTxt convert" onclick="onclick2()">text로</p>
	</c:if>
<div id="canvas">
	<div id="book-zoom">
		<div class="sample-docs">
			<div ignore="1" class="tabs"><div class="left">  </div> <div class="right"> </div></div>
			<div class="hard page1"></div>
				
			
		</div>
	</div>


	<div id="slider-bar" class="turnjs-slider">
		<div id="slider"></div>
	</div>
</div> <!--canvas-->

<a href="#" class="open1">답글 보기</a>
<div class="RightWrap">

	<div>답글보기 영역</div>
	<a href="#" class="close1">X</a>

	<div id="comment">

		<div id="coWrite">
			<table>
				<tr><td>"아이디"님</td></tr>
				<tr>
				   <td><input> </input></td>
				   <td><button>답글쓰기 </button></td>
				</tr>
			</table>
		</div>

		<div id="coShow">
			<table>
				<tr>
					<td> 아이디 </td>
					<td> 날짜</td>
				</tr>
				<tr>
					<td colspan="2">
					답글내역
					</td>
				</tr>
				<tr><td>------</td><td></td></tr>
				<tr>
					<td> 아이디 </td>
					<td> 날짜</td>
				</tr>
				<tr>
					<td colspan="2">
					답글내역
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" height="40px"> 페이지넘버 1 2 3 </td>
				</tr>
			</table>
			</div> <!--#coShow  -->
		</div> <!--//#comment -->
	</div> <!--//.RightWrap -->
<%-- <c:out value="displayFile.text?fileName=${fileName}&pageNum=1&fileType=jpg"> --%>
<%-- </c:out> --%>

<%-- <c:import url="displayFile.text?fileName=${fileName}&pageNum=1&fileType=txt"></c:import> --%>
<%-- <iframe style="float:right;" src = "displayFile.text?fileName=${fileName}&pageNum=1&fileType=txt" width='400' height='300' allowfullscreen webkitallowfullscreen></iframe> --%>

		


<script type="text/javascript">
let bookType = "txt";
bookType = '${bookType}';
 
let pageNum =3;
let maxPage = 9999;


maxPage = '${totalPageNum}';
// alert(maxPage);
let startFunction = function(){
	
};
$(document).ready(function(){
	if(bookType=="txt"){
		for(let i = 1; i <= maxPage; i++){
	        
//		      $(".sample-docs").append('<img class="leftPage" alt="" src="displayFile.text?fileName=${fileName}&pageNum='+ i +'&fileType=jpg'+'"/>');


		     $(".sample-docs").append('<iframe style="float:right;" src = "displayFile.text?fileName=${fileName}&pageNum='+i+'&fileType='+bookType+'" width="400" height="300" allowfullscreen webkitallowfullscreen></iframe>');
//		      $(".sample-docs").append('<input type="text" value="displayFile.text?fileName=${fileName}&pageNum='+ i +'&fileType=txt'+'"/>');
			}
	}else if(bookType=="jpg"){
		for(let i = 1; i <= maxPage; i++){
	        
		     $(".sample-docs").append('<img class="leftPage" alt="" src="displayFile.text?fileName=${fileName}&pageNum='+ i +'&fileType='+bookType+'"/>');


//		      $(".sample-docs").append('<iframe style="float:right;" src = "displayFile.text?fileName=${fileName}&pageNum='+i+'&fileType='+bookType+'" width="400" height="300" allowfullscreen webkitallowfullscreen></iframe>');
//		      $(".sample-docs").append('<input type="text" value="displayFile.text?fileName=${fileName}&pageNum='+ i +'&fileType=txt'+'"/>');
			}		
	}		
});
function onclick1(){
	location.href="read.text?fileName=${fileName}&bookType=jpg";
};

function onclick2(){
	location.href="read.text?fileName=${fileName}&bookType=txt";
};
/*
$(document).ready(function(){
// 	let pageNum = 1;
	$(".leftPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+pageNum);
	$(".rightPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+(pageNum+1));
//     pageNum = pageNum+2;
	$(".leftPage").on("click",function(event){
		pageNum -= 2;
		if(pageNum<=0){
			alert("처음 페이지 입니다");
			pageNum +=2;
		} else {
			event.preventDefault();
            $(".leftPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+pageNum);
            $(".rightPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+(pageNum+1));	
		}
        
    });
	
	$(".rightPage").on("click",function(event){
		pageNum += 2;	
        event.preventDefault();
        if(pageNum>maxPage){
			alert("마지막 페이지 입니다");
			pageNum -=2;
		} else{
			event.preventDefault();
            $(".leftPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+pageNum);
            $(".rightPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+(pageNum+1));	
		}
        
    });
});
 */


function loadApp() {
	
	var flipbook = $('.sample-docs');

	// Check if the CSS was already loaded
	
	if (flipbook.width()==0 || flipbook.height()==0) {
		setTimeout(loadApp, 10);
		return;
	}

	// Mousewheel

	$('#book-zoom').mousewheel(function(event, delta, deltaX, deltaY) {

		var data = $(this).data(),
			step = 30,
			flipbook = $('.sample-docs'),
			actualPos = $('#slider').slider('value')*step;

		if (typeof(data.scrollX)==='undefined') {
			data.scrollX = actualPos;
			data.scrollPage = flipbook.turn('page');
		}

		data.scrollX = Math.min($( "#slider" ).slider('option', 'max')*step,
			Math.max(0, data.scrollX + deltaX));

		var actualView = Math.round(data.scrollX/step),
			page = Math.min(flipbook.turn('pages'), Math.max(1, actualView*2 - 2));

		if ($.inArray(data.scrollPage, flipbook.turn('view', page))==-1) {
			data.scrollPage = page;
			flipbook.turn('page', page);
		}

		if (data.scrollTimer)
			clearInterval(data.scrollTimer);
		
		data.scrollTimer = setTimeout(function(){
			data.scrollX = undefined;
			data.scrollPage = undefined;
			data.scrollTimer = undefined;
		}, 1000);

	});

	// Slider

	$( "#slider" ).slider({
		min: 1,
		max: 100,

		start: function(event, ui) {
			if (!window._thumbPreview) {
				_thumbPreview = $('<div />', {'class': 'thumbnail'}).html('<div></div>');
				setPreview(ui.value);
				_thumbPreview.appendTo($(ui.handle));
			} else
				setPreview(ui.value);

			moveBar(false);
		},

		slide: function(event, ui) {
			setPreview(ui.value);
		},

		stop: function() {
			if (window._thumbPreview)
				_thumbPreview.removeClass('show');
			
			$('.sample-docs').turn('page', Math.max(1, $(this).slider('value')*2 - 2));
		}
	});


	// URIs
	
	Hash.on('^page\/([0-9]*)$', {
		yep: function(path, parts) {
			var page = parts[1];

			if (page!==undefined) {
				if ($('.sample-docs').turn('is'))
					$('.sample-docs').turn('page', page);
			}

		},
		nop: function(path) {

			if ($('.sample-docs').turn('is'))
				$('.sample-docs').turn('page', 1);
		}
	});

	// Arrows

	$(document).keydown(function(e){

		var previous = 37, next = 39;

		switch (e.keyCode) {
			case previous:

				$('.sample-docs').turn('previous');

			break;
			case next:
				
				$('.sample-docs').turn('next');

			break;
		}

	});

	// Create the flipbook

	flipbook.turn({
		elevation: 50,
		acceleration: false,
		gradients: true,
		autoCenter: true,
		duration: 1000,
		pages: 30,
		when: {

		turning: function(e, page, view) {
			
			var book = $(this),
			currentPage = book.turn('page'),
			pages = book.turn('pages');
				
			if (currentPage>3 && currentPage<pages-3) {
				if (page==1) {
					book.turn('page', 2).turn('stop').turn('page', page);
					e.preventDefault();
					return;
				} else if (page==pages) {
					book.turn('page', pages-1).turn('stop').turn('page', page);
					e.preventDefault();
					return;
				}
			} else if (page>3 && page<pages-3) {
				if (currentPage==1) {
					book.turn('page', 2).turn('stop').turn('page', page);
					e.preventDefault();
					return;
				} else if (currentPage==pages) {
					book.turn('page', pages-1).turn('stop').turn('page', page);
					e.preventDefault();
					return;
				}
			}

			Hash.go('page/'+page).update();

			if (page==1 || page==pages)
				$('.sample-docs .tabs').hide();

				event.stopImmediatePropagation();
			

		},

		turned: function(e, page, view) {

			var book = $(this);

			$('#slider').slider('value', getViewNumber(book, page));

			if (page!=1 && page!=book.turn('pages'))
				$('.sample-docs .tabs').fadeIn(500);
			else
				$('.sample-docs .tabs').hide();

			book.turn('center');
			updateTabs();

		},

		start: function(e, pageObj) {
	
			moveBar(true);

		},

		end: function(e, pageObj) {
		
			var book = $(this);

			setTimeout(function() {
				$('#slider').slider('value', getViewNumber(book));
			}, 1);

			moveBar(false);

		},

		missing: function (e, pages) {

			for (var i = 0; i < pages.length; i++)
				addPage(pages[i], $(this));

		}
	}
	}). turn('page', 2);


	$('#slider').slider('option', 'max', numberOfViews(flipbook));

	flipbook.addClass('animated');


	// Show canvas

	$('#canvas').css({visibility: 'visible'});

	

	
}

// Hide canvas

$('#canvas').css({visibility: 'hidden'});

yepnope({
	test: Modernizr.csstransforms,
	yep: ['/textant/resources/viewer/js/turn.min.js', '/textant/resources/viewer/css/jquery.ui.css'],
	nope: ['/textant/resources/viewer/js/turn.html4.min.js', '/textant/resources/viewer/css/jquery.ui.html4.css'],
	both: ['/textant/resources/viewer/css/docs.css', '/textant/resources/viewer/js/docs.js'],
	complete: loadApp
});
//*******************

//*******************오른쪽 슬라이드 
$(function(){

	$(".open1").click(function(){

		$(".RightWrap").animate({right:0},500,"swing") 
		event.stopImmediatePropagation();
	});

	$(".close1").click(function(){
		$(".RightWrap").animate({right:-300},500,"swing")
		event.stopImmediatePropagation();
	});

	event.stopImmediatePropagation();

}); //실행문끝

</script>



</body>
</html>