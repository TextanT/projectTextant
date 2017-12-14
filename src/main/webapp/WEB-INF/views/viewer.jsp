<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!--DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${bookName}</title>

<style>
*{margin:0; padding:0; text-decoration:none;}
.font7 {font-size:0.7em;}
.gray {color:#eee;}
.textEllipsis {white-space:pre-line; overflow:hidden; text-overflow:ellipsis;}
.margin10 {margin:10px;}
.padding10 {padding:10px 0;}
.ellipsis100{width:270px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}

/* BOOK VIEWER */
#viewer-top {width:600px; margin:0 auto;}
#viewer-bottom {width:400px; margin:0 auto;}
#page-counter {margin: 20px;}
#pageGo {width: 50px;}

/* NAV */ 
nav {width:170px; height:100%; background:white; 
	position:fixed; top:0; right:0; z-index:101;
	font-size:0.8em;}
nav img {width:20px; height:20x;}
nav a{text-decoration:none;}

#look-comment a{background:#69F;  z-index:101;}

#nav-pop {position: absolute; bottom:30px; padding:10px; background:#fff; display:none; z-index:101;}
#nav-pop ul {list-style-type: none;}
#nav-pop ul li {float:right;}
#nav-config {position: absolute; bottom:0px; right:0px; z-index:101;}

.coOpen {display:block; width:50px; height:30px; line-height:30px;}
.open1 {position:absolute; top:100px; left:0px;}
.open2 {position:absolute; top:100px; left:50px;}
.open3 {width:100px; position:absolute; top:130px; left:0px;}


/* COMMENT */
.coClose {display:block; width:30px; height:30px; 
		line-height:30px; font-size:18px; font-weight:bold; text-align:center; text-decoration:none;}
.closeR {position:absolute; top:15px; right:15px;}
.close2 {position:absolute; top:15px; left:15px;}

.comment{width:35%; height:95%; background:#ccc; font-size:0.9em;}
.RightWrap{position:fixed; top:5%; right:-500px; z-index:100;}
.LeftWrap{position:fixed; top:0; left:0px; display:none; z-index:100;}
.commentL{margin-top:50px; padding:3%;}

#coWrite{margin:50px 0;}
#coWrite a {display:bolck; width:100px; height:25px; line-height: 25px; text-align:center; 
	background-color:yellow; margin-top:10px;}
#coWrite table{width:100%; }
.coWriteBtn{line-height:80px; width: 100%; height:92px;}
.coWriteBtn_widthL{width:70%;}
.coPlace{width:100%; height:100%;}
.coWriteBtn_widthR{width:30%;}
#coShow{margin-top:3%;}
#coShow table{width:100%; border-top:1px white dashed; margin-top:20px; }
#reCoWriteForm{display:none;}

#modalBg {position: absolute;
    top: 0; right: 0; bottom: 0; left: 0;
    background: rgba(0, 0, 0, 0.8);
    display:none; z-index: 500;}
.totalCom {display:none; z-index: 501;
	background-color:white;
	position: absolute; top: 5%; left: 15%;
	width: 70%; height: 80%; padding: 16px;}
.totalCom > h3 {display:inline; width:100px; }	
#totalComCount {display:inline-block; width:100px; }	
	

/* BOOKMARK*/	
.Bookmark{display:none; z-index: 501;
	background-color:white;
	position: absolute; top: 2%; left: 0%;
	width: 40%; height: 90%;
	padding: 16px;}


</style>

<!-- <script type="text/javascript" src="/textant/resources/js/jquery-1.11.1.min.js"></script> -->
<!-- <script type="text/javascript" src="/textant/resources/js/jquery.min.1.7.js"></script> -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<script type="text/javascript" src="/textant/resources/js/jquery-ui-1.8.20.custom.min.js"></script>
<script type="text/javascript" src="/textant/resources/js/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="/textant/resources/js/modernizr.2.5.3.min.js"></script>
<script type="text/javascript" src="/textant/resources/js/hash.js"></script>


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
			<div id=""> 
			 <p>
			 <a href="#" class="firstPage">ㅣ◀ </a>
			 <a href="#" class="previousPage">◀</a>    
			 <input type="number" id="pageGo" placeholder="thisPage"> / ${totalPageNum+1}  
			 <a href="#" class="pageGoEnter"><b><i>Go</i></b></a> 
			 <a href="#" class="nextPage">▶</a>  
			 <a href="#" class="maxPage">▶ㅣ</a>
			 </p>
			</div>
		</div>
	</div><!--viewer-bottom-->
</section> <!--canvas-->

<!-- NAVIGATION-->
<nav>
	<div id="look-comment">
		<br><br><br> 답글보기
		<a href="#" class="coOpen open1"><img src="" alt="">왼쪽</a>
		<a href="#" class="coOpen open2"><img src="" alt="">오른쪽</a>
		<a href="#" class="coOpen open3"><img src="" alt="">전체보기</a>
	</div>
	
	<div id="nav-pop" class="margin10">
		<ul>
			<li><a href="#" class="openBookmark">북마크 보기 <img src="/textant/resources/img/if_office-01_809597.png" alt="북마크보기"></a></li>
			<li>
				<c:if test="${bookmark==0}">
					<a href="#">북마크 하기 <img src="/textant/resources/img/if_bookmark-outline_326548.png" alt="북마크 하기"></a>
				</c:if>
				<c:if test="${bookmark==1}">
					<a href="#">북마크 없애기 <img src="/textant/resources/img/if_bookmark-outline_326548.png" alt="북마크  없애기"></a>
				</c:if>
			</li>
			<li>
				<c:if test="${addShelf==0}">
					<a href="#">책장에 추가 <img src="/textant/resources/img/if_book_sans_add_103401.png" alt="책장에 추가"></a>
				</c:if>
				<c:if test="${addShelf==1}">
					<a href="#">책장에서 빼기 <img src="/textant/resources/img/if_book_sans_add_103401.png" alt="책장에서 빼기"></a>
				</c:if>
			</li>
			<li><a href="#">별점주기 <img src="/textant/resources/img/if_star_103714.png" alt="별점주기"></a></li>
			<li>
				<a href="/reportComment.comment">신고하기 <img src="/textant/resources/img/if_office-01_809597.png" alt="신고하기"></a>
			</li>
			<c:if test="${isText != 'isText'}">
				<c:if test="${bookType=='jpg'}">
					<li><a href="#" id="goText" class="convertToTxt convert">전자책으로 보기 <img src="/textant/resources/img/if_office-01_809597.png" alt="전자책으로 보기"></a></li>
				</c:if>
				<c:if test="${bookType=='txt'}">
					<li><a href="#"  id="goJpg" class="convertToJpg convert">이미지로 보기 <img src="/textant/resources/img/if_office-01_809597.png" alt="이미지로 보기"></a></li>
				</c:if>

			</c:if>
		</ul>
	</div>
	<div id="nav-config" class="margin10">
		<a href="#" class="navPopBtn"><img src="/textant/resources/img/if_settings_103345.png" alt=""></a>
	</div>
</nav>


<div class="RightWrap comment">

	<a href="#" class="coClose closeR close1">X</a>
	
	<div class=" ">
				<%@include file="commentPartR.jsp" %>
	</div> <!--//#comment -->
</div> <!--//.RightWrap -->



<div class="LeftWrap comment">
		<a href="#" class="coClose closeR close2">X</a>
		
		<div class="commentL">
		
				<%@include file="commentPartL.jsp" %>
		</div> <!--//#comment -->
</div> <!--//.LeftWrap -->



<div id="modalBg"></div>
<div class="totalCom">
	<div>
		<h3>『 ${bookName} 』<span id="totalComCount"></span></h3>
		<a href="#" class="coClose closeR close3">X</a>
		
	</div>
</div> <!--totalCom-->

<div class="Bookmark">
		<div>
		<h3>${id}<small>님의</small> 북마크</h3>
		<a href="#" class="coClose closeR close4">X</a>
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



// Hide canvas

$('#canvas').css({visibility: 'hidden'});

yepnope({
	test: Modernizr.csstransforms,
	yep: ['/textant/resources/js/turn.min.js', '/textant/resources/css/jquery.ui.css'],
	nope: ['/textant/resources/js/turn.html4.min.js', '/textant/resources/css/jquery.ui.html4.css'],
	both: ['/textant/resources/css/docs1.css', '/textant/resources/js/docs.js'],
	complete: loadApp
});
//*******************







//*******************오른쪽 슬라이드 
// $(document).ready(function(){
// 	alert("commentCount()ready");
// 	commentCount();
// 	});
	$(".sample-docs").bind('turning',function(){
				setTimeout(function() {
					let currPage = $(".sample-docs").turn("page");
					$("#pageGo").attr('placeholder',(Math.floor(currPage/2))*2);
					$("#pageR").attr('value',(Math.floor(currPage/2))*2);
					$("#pageL").attr('value',(Math.floor(currPage/2))*2);
				},50);
			});
function commentCount(){
	alert("commentCount()");
	$.ajax({
		url:"/textant/commentCount.comment",
		type:"POST",
		async:true,
		dataType:"json",
		data:{
			page:$("#pageR").val(),
			bookArticleNum:$("#bookArticleNum").val()
		},
		error : function(xhr){
			alert("error html = " + xhr.statusText);
		},
		success: function(json){

			
			setTimeout(function() {
				let currPage = $(".sample-docs").turn("page");
				let nowPage = (Math.floor(currPage/2))*2;
				
				let html="<span id='nowP'>"+json.pageCountBlock+"p ~ "+nowPage+"p ┃   현재페이지 : "+nowPage+"p ┃   댓글 "+json.pageListCount+"개</span>";
				$("#nowP").remove();
				$("#infoOne").append(html);
				
				$("#pageListCount").val(json.pageListCount);
				$("#pageCountBlock").val(json.pageCountBlock);
				$("#pageCut").val(json.pageCut);
				$("#pageSize").val(json.pageSize);
				
				
			}, 10);
			
			
			commentRead(json);
			
		},
	});
}
//전체 댓글 읽어오기
function commentRead(read){
	let html= "";
	$.ajax({
		url:"/textant/commentRead.comment",
		type:"POST",
		async:true,
		dataType:"json",
		data:{
			page:$("#pageR").val(),
			nextPage:$("#nextPageR").val(),
			pageListCount:read.pageListCount,
			pageCountBlock:read.pageCountBlock,
			pageCut:read.pageCut,
			bookArticleNum:read.bookArticleNum,
			commentNum:0,
			commentDelete:0
		},
		error : function(xhr){
			alert("error html = " + xhr.statusText);
		},
		complete: function(){	
			commentDelete($("#pageR").val(),$("#nextPageR").val(),read.pageListCount,read.pageCountBlock,read.pageCut,read.bookArticleNum,0,1)
			
			var num=$("#nextPageR").val();
			 num++;
			 var nextPageNum = $("#nextPageR").val(); 
			 var pageCutNum = $("#pageCut").val();
			 
			 if(nextPageNum==pageCutNum){
				 $("#moreSee").attr("type", "hidden");
			 }else{
				 $("#moreSee").attr("type", "button");
			 }
			 
			 $("#nextPageR").val(num);

		},
		success: function(data){
			 $.each(data, function(index,item) {
				 let commentNum=item.commentNum;
				 let commentCount=item.commentCount;
				 let commentGroup=item.commentGroup;
				 
				 html +='<div class="commentDelete'+commentNum+'">'+
				 '<table border="1" class="padding10">'+
					'<tr>'+
					'<td rowspan="4" width="30px">+ profilePicture+</td>'+
					'<td colspan="2" ><i class="font7">'+item.commentNum+'</i><br><p class="ellipsis100">'+item.conet+'</p></td>'+
				'</tr>'+
				'<tr>'+
					'<td class="font7" colspan="2" align="right"><a href="#" id="ellipsisView" onClick="ellipsisView">더보기 ▼</a></td>'+
				'</tr>'+
				'<tr>'+
					'<td class="font7" colspan="2">'+item.nickName+'님 ┃'+item.writeDate+'┃'+' ♥ (<span class="comGoodCount'+commentNum+'">'+item.commentGood+'</span>) ┃  (☞'+item.commentBad+') ┃ '+
					'<a href="#" id="showReCo'+commentNum+'" class="comment'+commentNum+'" name="chk" onClick="commentReply('+commentNum+','+commentCount+')">댓글보기('+data[index].commentCount+')</a></td>'+
				'</tr>'+
				
				'<tr>'+
					'<td class="font7" colspan="2" align="right">'+
						'<input id="commentDeleteButton'+commentNum+'" type="hidden" onclick="commentDeleteOk('+commentNum+','+commentGroup+')" value="삭제"> ┃'+
						'<a href="#" class="commentGood'+commentNum+'" onclick="commentGoodOrBad('+commentNum+','+commentGood+')">좋아요</a> ┃'+ 
						'<a href="#" class="commentBad'+commentNum+'" onclick="commentGoodOrBad('+commentNum+','+commentBad+')">싫어요</a> ┃'+
						'<a href="#" class="reportComment" id="reportComment'+commentNum+'" onclick="reportComment('+commentNum+')">신고하기</a> ┃'+
// 						'<a href="#" id="reCoWrite'+commentNum+'" class="toggle2" onclick="commentReplyWrite('+commentNum+')">댓글쓰기</a>'+
						"<input type='checkbox' id='c"+commentNum+"' class='comment"+commentNum+"' name='chk' onClick='commentReply("+commentNum+","+commentCount+")' value='"+commentNum+"'><label for='c"+commentNum+"' class='commentCount"+commentNum+"'><span></span>답글달기: "+data[index].commentCount+"</label>"+
						'<input id="nextToPage'+commentNum+'" type="hidden" name="nextToPage'+commentNum+'" value="1">'+	
						'<input id="commentGroup'+commentNum+'" type="hidden" name="commentGroup" value="0">'+
					'</td>'+
				'</tr></table><div class="innerReply'+commentNum+'"></div></div>'
			 });
			$("#coShowBox").append(html);
		}
	});
	
};
$(function(){
// 	$(".open1").click(function(){
// 		$(".RightWrap").animate({right:170},500,"swing") 
// 		if(".open1") event.stopImmediatePropagation();
// 	});

	$(".close1").click(function(){
		$(".RightWrap").animate({right:-500},500,"swing")
		if(".close1") event.stopImmediatePropagation();
	});

	//event.stopImmediatePropagation();
}); 


//*******************왼쪽 슬라이드 
$(function() {
	$(".open2").click(function(){
		$(".LeftWrap").animate({width:'toggle'},500,"swing")
	});
	if(".open2")event.stopImmediatePropagation();
});

//////// 토글, 스윙 부딛힘
//$(function(){
//	$(".close2").click(function(){
//		$(".LeftWrap").animate({left:-500},500,"swing")
		//event.stopImmediatePropagation();
//	});
	//event.stopImmediatePropagation();
//}); 


//**********************전체 댓글 보기
	function wrapWindowByMask(){
		var bgHeight = $(document).height();  
		var bgWidth = $(window).width();  

		$('#modalBg').css({'width':bgWidth,'height':bgHeight});  

		$('#modalBg').fadeIn(1000);      
		$('#modalBg').fadeTo("slow",0.5);    

		$('.totalCom').show();
	}

	$(document).ready(function(){
		$('.open3').click(function(e){
			e.preventDefault();
			wrapWindowByMask();
		});
		
		$('.totalCom .close3').click(function (e) {  
		    //링크 기본동작은 작동하지 않도록 한다.
		    e.preventDefault();  
		    $('#modalBg, .totalCom').hide();  
		});      
		
		$('#modalBg').click(function () {  
		    $(this).hide();  
		    $('.totalCom').hide();  
		});      
	});
	
	
	$(document).ready(function(){
		$.ajax({
				url: "/textant/commentTotalCount.comment",
				type: "GET",
				dataType: "json",
				data:{
					page:$("#page").val(),
					bookArticleNum:$("#bookArticleId").val()
				},
				success: function(json){
					$("#totalComCount").append("<small> &nbsp;&nbsp;&nbsp;답글&nbsp;" +json.totalCount+"&nbsp;개</small>");
				}
		});
	}); 
	
	
	$(document).ready(function(){
		$.ajax({
				url: "/textant/read.text",
				type: "GET",
				dataType: "jsp",
				data:{
					page:$("#page").val(),
					bookArticleNum:$("#bookArticleId").val()
				},
				success: function(html){
					$(document).load(function(){
						let bbb= $(".page-wrapper").attr(".page");	
						alert(Math.floor(bbb/2)*2);
						});
				}
		});
	}); 

	
//******************* 댓글쓰기 폼 보이기
$(function() {
	$(".toggle").click(function(){
		$("#coWriteForm").toggleClass("disNone");
		
		if($("#coShow").hasClass('height80')){
			$("#coShow").removeClass('height80').addClass('height70');
		}else{
			$("#coShow").removeClass('height70').addClass('height80');
		}
		
	});
	if(".toggle") event.stopImmediatePropagation();
});
$(function() {
	$(".toggle2").click(function(){
		$(".toggleChild2").toggle();
	});
	if(".toggle2")event.stopImmediatePropagation();
});


//******************* nav pop-up toggle
$(function() {
	$(".navPopBtn").click(function(){
		$("#nav-pop").toggle();
	});
	if(this)event.stopImmediatePropagation();
});


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


//**********************북마크 내용 보기
	function wrapWindowByMask1(){
		var bgHeight = $(document).height();  
		var bgWidth = $(window).width();  

		$('#modalBg').css({'width':bgWidth,'height':bgHeight});  
		$('#modalBg').fadeIn(1000);      
		$('#modalBg').fadeTo("slow",0.5);    

		$('.Bookmark').show();
	}

	$(document).ready(function(){
		$('.openBookmark').click(function(e){
			e.preventDefault();
			wrapWindowByMask1();
		});
		$('.Bookmark .close4').click(function (e) {  
		    e.preventDefault();  
		    $('#modalBg, .Bookmark').hide();  
		});       

		$('#modalBg').click(function () {  
		    $(this).hide();  
		    $('.Bookmark').hide();  
		});      
	});




</script>



</body>
</html>