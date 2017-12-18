
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!--DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>『${bookName}』</title>

<link rel="stylesheet" type="text/css" href="/textant/resources/css/viewer_base.css" />
<link rel="stylesheet" type="text/css" href="/textant/resources/css/viewer_bottom.css" />
<link rel="stylesheet" type="text/css" href="/textant/resources/css/viewer_comment.css" />

<!-- <script type="text/javascript" src="/textant/resources/js/jquery-1.11.1.min.js"></script> -->
<!-- <script type="text/javascript" src="/textant/resources/js/jquery.min.1.7.js"></script> -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<script type="text/javascript" src="/textant/resources/js/jquery-ui-1.8.20.custom.min.js"></script>
<script type="text/javascript" src="/textant/resources/js/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="/textant/resources/js/modernizr.2.5.3.min.js"></script>
<script type="text/javascript" src="/textant/resources/js/hash.js"></script>

<!-- <script type="text/javascript" src="/textant/resources/js/viewer_filpbook.js"></script> -->
<script type="text/javascript" src="/textant/resources/js/viewer_sideFunction.js"></script>

</head>

<body>
<input type="hidden" value="${bookArticleNum}" id="bookArticleId">
<input id="page" type="hidden" name="page" value="1">


<!-- BOOK VIEWER -->
<section id="canvas">
	<div id="viewer-top">
		<div id="slider-bar" class="turnjs-slider">
			<div id="slider"></div>
		</div>
	</div><!--viewer-top-->
	<div id="book-zoom">
		<div class="sample-docs">
			
			<div class="hard page1">
				<img src="displayFile.text?fileName=${fileName}/OriginImg&pageNum=1&fileType=jpg"
						width="100%" height="100%"/>
			</div>

			<div ignore="1" class="next-button"></div>
			<div ignore="1" class="previous-button"></div>
		</div>
	</div>	
	<div id="viewer-bottom">
		<div id="page-counter">
			 <p>
			 	 <a href="#" class="firstPage"><img src="/textant/resources/img/icon_arrow_01.png" alt="제일 첫 장 가기"></a>
				 <a href="#" class="previousPage"><img src="/textant/resources/img/icon_arrow_02.png" alt="앞 장 가기"></a>    
				 <input type="number" id="pageGo" placeholder="thisPage"> / ${totalPageNum+1}&nbsp;&nbsp;&nbsp;
				 <a href="#" class="pageGoEnter"><i>Go</i>&nbsp;&nbsp;&nbsp;</a> 
				 <a href="#" class="nextPage"><img src="/textant/resources/img/icon_arrow_04.png" alt="뒷장 가기"></a>  
				 <a href="#" class="maxPage"><img src="/textant/resources/img/icon_arrow_05.png" alt="제일 마지막 장 가기"></a>
			 </p>
		</div>
	</div><!--viewer-bottom-->
</section> <!--canvas-->



<!-- NAVIGATION-->
<nav>
	<div id="look-comment">
		<div class="blueBg"><span class="white"> 답글보기</span></div>
		<a href="#" class="coOpen open1"><img src="/textant/resources/img/side_bookMark_left.png" alt="왼쪽"></a>
		<a href="#" class="coOpen open2"><img src="/textant/resources/img/side_bookMark_right.png" alt="오른쪽"></a>
		<a href="#" class="coOpen open3"><img src="/textant/resources/img/side_bookMark_all.png" alt="전체보기"></a>		
	</div>
	
	<div id="nav-pop" class="margin10">
		<ul>
			<li><a href="#" class="openBookmark">북마크 보기   <img src="/textant/resources/img/icon_01.png" alt="북마크 보기"></a></li>
			<li>
				<c:if test="${bookmark==0}">
					<a href="#">북마크 하기   <img src="/textant/resources/img/icon_02png" alt="북마크 하기"></a>
				</c:if>
				<c:if test="${bookmark==1}">
					<a href="#">북마크 없애기   <img src="/textant/resources/img/icon_03" alt="북마크 없애기"></a>
				</c:if>
			</li>
			<li>
				<c:if test="${addShelf==0}">
					<a href="#">책장에 추가   <img src="/textant/resources/img/icon_04.png" alt="책장에 추가"></a>
				</c:if>
				<c:if test="${addShelf==1}">
					<a href="#">책장에서 빼기   <img src="/textant/resources/img/icon_05.png" alt="책장에서 빼기"></a>
				</c:if>
			</li>
			<li><a href="#" id="starClick">별점주기   <img src="/textant/resources/img/icon_06.png" alt="별점주기"></a></li>
			<li>
				<a href="reportBook.comment">책 신고하기   <img src="/textant/resources/img/icon_08.png" alt="신고하기"></a>
			</li>
			<c:if test="${isText != 'isText'}">
				<c:if test="${bookType=='jpg'}">
					<li><a href="#" id="goText" class="convertToTxt convert">전자책으로 보기   <img src="/textant/resources/img/icon_10.png" alt="전자책으로 보기"></a></li>
				</c:if>
				<c:if test="${bookType=='txt'}">
					<li><a href="#"  id="goJpg" class="convertToJpg convert">이미지로 보기   <img src="/textant/resources/img/icon_11.png" alt="이미지로 보기"></a></li>
				</c:if>

			</c:if>
		</ul>
		
		<div id="starCounting">
			<ul>
				<li><a href=""><img src="/textant/resources/img/icon_07.png" alt="별점주기"></a></li>
				<li><a href=""><img src="/textant/resources/img/icon_07.png" alt="별점주기"></a></li>
				<li><a href=""><img src="/textant/resources/img/icon_07.png" alt="별점주기"></a></li>
				<li><a href=""><img src="/textant/resources/img/icon_07.png" alt="별점주기"></a></li>
				<li><a href=""><img src="/textant/resources/img/icon_07.png" alt="별점주기"></a></li>
				<li><a href="" id="statComp">별점주기</a></li>
			</ul>
		</div>
	</div>
	<div id="nav-config" class="margin10">
		<a href="#" class="navPopBtn"><img src="/textant/resources/img/if_settings_103345.png" alt="메뉴 열기" class="xBtn"></a>
	</div>
</nav>





<div class="RightWrap comment">
	<div id="RightWrapShadow" class="RightWrapShadow"></div>

	<a href="#" class="coClose closeR close1"><img src="/textant/resources/img/icon_x.png" alt"X" class="xBtn"></a>
	
	<div class="commentR">
				<%@include file="commentPartR.jsp" %>
	</div> <!--//#comment -->
</div> <!--//.RightWrap -->



<div class="LeftWrap comment">



<div id="RightWrapShadow" class="RightWrapShadow"></div>
		<a href="#" class="coClose closeR close2"><img src="/textant/resources/img/icon_x.png" alt"X" class="xBtn"></a>
		
		<div class="commentL">		
 				<%@include file="commentPartL.jsp" %> 
 		</div> //#comment
 </div> <!--//.LeftWrap  -->



<div id="modalBg"></div>
<div class="totalCom">
	<div>
		<h3>『 ${bookName} 』<span id="totalComCount"></span></h3>
		<a href="#" class="coClose closeR close3"><img src="/textant/resources/img/icon_x.png" alt"X" class="xBtn"></a>
		
<!-- 		<div class="commentAll">		 -->
<%--  				<%@include file="commentView.jsp" %>  --%>
<!--  		</div>  -->
	</div>
</div> <!--totalCom-->



<div class="Bookmark">
		<div>
		<h3>${id}<small>님의</small> 북마크</h3>
		<a href="#" class="coClose closeR close4"><img src="/textant/resources/img/icon_x.png" alt"X" class="xBtn"></a>
		<%@include file="BookMarkInViewer.jsp" %>
		<div>
</div> <!--Bookmark-->
			








<script type="text/javascript">



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
				_thumbPreview = $('<div />');//현재페이지 프리뷰 제거 , {'class': 'thumbnail'}).html('<div></div>');
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

		var previous = 37, next = 39, enter = 13;

		switch (e.keyCode) {
			case previous:

				$('.sample-docs').turn('previous');

			break;
			case next:
				
				$('.sample-docs').turn('next');

			break;
			case enter:
				
				let pageNum = $('#pageGo').val();
				$('.sample-docs').turn('page',pageNum);

		}

	});
	// Events for the next button

	$('.next-button').bind($.mouseEvents.over, function() {		
		$(this).addClass('next-button-hover');

	}).bind($.mouseEvents.out, function() {		
		$(this).removeClass('next-button-hover');

	}).bind($.mouseEvents.down, function() {		
		$(this).addClass('next-button-down');

	}).bind($.mouseEvents.up, function() {		
		$(this).removeClass('next-button-down');

	}).click(function() {		
		$('.sample-docs').turn('next');

	});

	// Events for the next button
	
	$('.previous-button').bind($.mouseEvents.over, function() {		
		$(this).addClass('previous-button-hover');

	}).bind($.mouseEvents.out, function() {		
		$(this).removeClass('previous-button-hover');

	}).bind($.mouseEvents.down, function() {		
		$(this).addClass('previous-button-down');

	}).bind($.mouseEvents.up, function() {		
		$(this).removeClass('previous-button-down');

	}).click(function() {		
		$('.sample-docs').turn('previous');

	});



	// Create the flipbook

	flipbook.turn({
		elevation: 50,
		acceleration: false,
		gradients: true,
		autoCenter: true,
		duration: 1000,
		pages: "${totalPageNum+1}",
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

// 하단 페이지 카운팅
$(".pageGoEnter").on("click",function(){
	let pageNum = $('#pageGo').val();
	$('.sample-docs').turn('page',pageNum);
});
$(".firstPage").on("click",function(){
	$('.sample-docs').turn('page', 1);
});
$(".previousPage").on("click",function(){
	$('.sample-docs').turn('previous');
});
$(".nextPage").on("click",function(){
	$('.sample-docs').turn('next');
});
$(".maxPage").on("click",function(){
	$('.sample-docs').turn('page', '${totalPageNum+1}');
});

$(".sample-docs").bind('turning',function(){
			setTimeout(function() {
				let currPage = $(".sample-docs").turn("page");
				$("#pageGo").attr('placeholder',(Math.floor(currPage/2))*2);
				$("#pageR").attr('value',(Math.floor(currPage/2))*2);
				$("#pageL").attr('value',(Math.floor(currPage/2))*2);
			},50);
		});


// Hide canvas

$('#canvas').css({visibility: 'hidden'});

yepnope({
	test: Modernizr.csstransforms,
	yep: ['/textant/resources/js/turn.min.js', '/textant/resources/css/jquery.ui.css'],
	nope: ['/textant/resources/js/turn.html4.min.js', '/textant/resources/css/jquery.ui.html4.css'],
	both: ['/textant/resources/css/docs1.css', '/textant/resources/js/docs.js'],
	complete: loadApp
});



// $(function(){
// // 	$(".open1").click(function(){
// // 		$(".RightWrap").animate({right:170},500,"swing") 
// // 		if(".open1") event.stopImmediatePropagation();
// // 	});

// 	$(".close1").click(function(){
// 		$(".RightWrap").animate({right:-500},500,"swing")
// 		if(".close1") event.stopImmediatePropagation();
// 	});

// 	//event.stopImmediatePropagation();
// }); 


// //*******************왼쪽 슬라이드 
// $(function() {
// 	$(".open2").click(function(){
// 		$(".LeftWrap").animate({width:'toggle'},500,"swing")
// 	});
// 	if(".open2")event.stopImmediatePropagation();
// });

//////// 토글, 스윙 부딛힘
//$(function(){
//	$(".close2").click(function(){
//		$(".LeftWrap").animate({left:-500},500,"swing")
		//event.stopImmediatePropagation();
//	});
	//event.stopImmediatePropagation();
//}); 

// //********************** '전체 댓글' 보기
// 	function wrapWindowByMask(){
// 		var bgHeight = $(document).height();  
// 		var bgWidth = $(window).width();  

// 		$('#modalBg').css({'width':bgWidth,'height':bgHeight});  

// 		$('#modalBg').fadeIn(1000);      
// 		$('#modalBg').fadeTo("slow",0.5);    

// 		$('.totalCom').show();
// 	}

// 	$(document).ready(function(){
// 		$('.open3').click(function(e){
// 			e.preventDefault();
// 			wrapWindowByMask();
// 		});
		
// 		$('.totalCom .close3').click(function (e) {  
// 		    //링크 기본동작은 작동하지 않도록 한다.
// 		    e.preventDefault();  
// 		    $('#modalBg, .totalCom').hide();  
// 		});      
		
// 		$('#modalBg').click(function () {  
// 		    $(this).hide();  
// 		    $('.totalCom').hide();  
// 		});      
		
		
// 		$.ajax({
// 			url: "/textant/commentTotalCount.comment",
// 			type: "GET",
// 			dataType: "json",
// 			data:{
// 				page:$("#page").val(),
// 				bookArticleNum:$("#bookArticleId").val()
// 			},
// 			success: function(json){
// 				$("#totalComCount").append("<small> &nbsp;&nbsp;&nbsp;답글&nbsp;" +json.totalCount+"&nbsp;개</small>");
// 			}
// 		});
// 	});

	
// //******************* 댓글쓰기 폼 보이기/숨기기에 따른, 댓글 내용 영역 사이즈 조절
// $(function() {
// 	$(".toggle").click(function(){
// 		$("#coWriteForm").toggleClass("disNone");
		
// 		if($("#coShow").hasClass('height80')){
// 			$("#coShow").removeClass('height80').addClass('height70');
// 		}else{
// 			$("#coShow").removeClass('height70').addClass('height80');
// 		}
		
// 	});
// 	if(".toggle") event.stopImmediatePropagation();
// });
// $(function() {
// 	$(".toggle2").click(function(){
// 		$(".toggleChild2").toggle();
// 	});
// 	if(".toggle2")event.stopImmediatePropagation();
// });


// //******************* nav pop-up toggle
// $(function() {
// 	$(".navPopBtn").click(function(){
// 		$("#nav-pop").toggle();
// 	});
// 	if(this)event.stopImmediatePropagation();
// });


// //**********************북마크 내용 보기
// 	function wrapWindowByMask1(){
// 		var bgHeight = $(document).height();  
// 		var bgWidth = $(window).width();  

// 		$('#modalBg').css({'width':bgWidth,'height':bgHeight});  
// 		$('#modalBg').fadeIn(1000);      
// 		$('#modalBg').fadeTo("slow",0.5);    

// 		$('.Bookmark').show();
// 	}

// 	$(document).ready(function(){
// 		$('.openBookmark').click(function(e){
// 			e.preventDefault();
// 			wrapWindowByMask1();
// 		});
// 		$('.Bookmark .close4').click(function (e) {  
// 		    e.preventDefault();  
// 		    $('#modalBg, .Bookmark').hide();  
// 		});       

// 		$('#modalBg').click(function () {  
// 		    $(this).hide();  
// 		    $('.Bookmark').hide();  
// 		});      
// 	});
	
	
// 	//**********************별점주기 보기
// 	$(document).ready(function(){
// 		$('#starClick').click(function(e){
// 			e.preventDefault();
// 			$('#starCounting').show();
// 		});
// 		$('#statComp').click(function (e) {  
// 		    e.preventDefault();  
// 		    $('#starCounting').hide();  
// 		});       
// 	});	


	//******************* 책 내용 이미지로 보기- 텍스트로 보기 전환
	let bookType = "txt";
	bookType = '${bookType}';
	 
	let pageNum =3;
	let maxPage = 9999;
	maxPage = '${totalPageNum}';

	$(document).ready(function(){
				if(bookType=="txt"){
					for(let i = 1; i <= maxPage; i++){
						$(".sample-docs").append('<div style="width:100%;height:100%;text-align: center;"><embed width="95%" height="100%" type="text/html" src="displayFile.text?fileName=${fileName}&pageNum='+i+'&fileType='+bookType+'"></embed></div>');
					}
				}else if(bookType=="jpg"){
					for(let i = 1; i <= maxPage; i++){
				        
					$(".sample-docs").append('<img class="leftPage" alt="" src="displayFile.text?fileName=${fileName}&pageNum='+ i +'&fileType='+bookType+'"/>');
					}		
				}		
			});

	$('#goText').click(function(){
		location.href="read.text?fileName=${fileName}&bookType=txt";
	});

	$('#goJpg').click(function(){
		location.href="read.text?fileName=${fileName}&bookType=jpg";
	});




		




</script>



</body>
</html>