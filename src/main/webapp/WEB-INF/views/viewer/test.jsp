<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width = 1050, user-scalable = no" />
<script type="text/javascript" src="/textant/resources/viewer/js/jquery.min.1.7.js"></script>
<script type="text/javascript" src="/textant/resources/viewer/js/modernizr.2.5.3.min.js"></script>
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

<div class="flipbook-viewport">
	<div class="container">
		<div class="flipbook">
			<div class="hard page1"><img
						src="displayFile.text?fileName=${fileName}/OriginImg&pageNum=1&fileType=jpg"
						width="100%" height="100%"/></div>
		</div>
	</div>
	<div id="slider-bar" class="turnjs-slider">
		<div id="slider"></div>
	</div>
</div>


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

<script type="text/javascript">
let bookType = "txt";
bookType = '${bookType}';
 
let pageNum =3;
let maxPage = 9999;
maxPage = '${totalPageNum}'
// 		$(".flipbook").append('<img class="leftPage" alt="" src="displayFile.text?fileName=gameOfThrone.pdf&pageNum='+ '5' +'&fileType='+'jpg'+'"/>');
// 		$(".flipbook").append('<img class="leftPage" alt="" src="http://localhost:808/textant/displayFile.text?fileName=gameOfThrone.pdf&pageNum=1&fileType=jpg"/>');
// 		$(".flipbook").append('<img class="leftPage" alt="" src="http://localhost:808/textant/displayFile.text?fileName=gameOfThrone.pdf&pageNum=2&fileType=jpg"/>');
// 		$(".flipbook").append('<img class="leftPage" alt="" src="http://localhost:808/textant/displayFile.text?fileName=gameOfThrone.pdf&pageNum=3&fileType=jpg"/>');
		
		$(document).ready(function(){
			if(bookType=="txt"){
				for(let i = 1; i <= maxPage; i++){
					$(".flipbook").append('<div style="width:100%;height:100%;text-align: center;"><embed width="95%" height="100%" type="text/html" src="displayFile.text?fileName=${fileName}&pageNum='+i+'&fileType='+bookType+'"></embed></div>');
				}
			}else if(bookType=="jpg"){
				for(let i = 1; i <= maxPage; i++){
			        
				$(".flipbook").append('<img class="leftPage" alt="" src="displayFile.text?fileName=${fileName}&pageNum='+ i +'&fileType='+bookType+'"/>');
				}		
			}		
		});
function loadApp() {

	// Create the flipbook

	$('.flipbook').turn({
			// Width

			width:922,
			
			// Height

			height:600,

			// Elevation

			elevation: 50,
			
			// Enable gradients

			gradients: true,
			
			// Auto center this flipbook

			autoCenter: true

	});
}

// Load the HTML4 version if there's not CSS transform

yepnope({
	test : Modernizr.csstransforms,
	yep: ['/textant/resources/viewer/lib/turn.js'],
	nope: ['/textant/resources/viewer/lib/turn.html4.min.js'],
	both: ['/textant/resources/viewer/css/basic.css'],
	complete: loadApp
});

// Arrows

$(document).keydown(function(e){

	var previous = 37, next = 39;

	switch (e.keyCode) {
		case previous:

			$('.flipbook').turn('previous');

		break;
		case next:
			
			$('.flipbook').turn('next');

		break;
	}

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
		
		$('.flipbook').turn('page', Math.max(1, $(this).slider('value')*2 - 2));
	}
});

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
function onclick1(){
	location.href="test.text?fileName=${fileName}&bookType=jpg";
};

function onclick2(){
	location.href="test.text?fileName=${fileName}&bookType=txt";
};

</script>

</body>
</html>