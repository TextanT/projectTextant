<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="/textant/resources/Swiper-master/dist/css/swiper.min.css">
<title>Document</title>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-image: url(/textant/resources/background_img/back2.png);
	background-position: center center;
	background-size: cover;
    background-attachment: fixed;
	background-repeat: no-repeat;
/* 	overflow: hidden; */
}

.logo_a {
	
}

.header_logo {
	padding-left: 100px;
}

.swiper-container {
	width: 100%;
	height: 400px;
	top: 50px;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	background-color: rgba(255, 255, 255, 0.1);
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.slide_img {
	height: 350px;
	padding-left: 10px;
	padding-right: 10px;
}

.menu_box {
	float: right;
	padding-right: 70px;
	margin-top: -40px;
}

.menu_title {
	color: white;
	text-decoration: none;
	padding-right: 10px;
	font-size: 14px;
}

.menu_title:hover {
	color: highlight;
}

.sub_header {
	/*            background: #964206;*/
	background-color: rgba(84, 84, 84, 0.7);
	width: 100%;
	height: 50px;
	margin-top: 50px;
}

.sub_header:hover {
	background-color: rgba(84, 84, 84, 1);
}
</style>
</head>

<body>
	<div class="header">
		<div class="header_logo" style="padding-top: 20px;">
			<a href="/textant/main.text" class="logo_a"> <img
				src="/textant/resources/icon_img/logo_mini.png" class="logo">
			</a>
		</div>
		<div class="menu_box">
			<a href="#" class="menu_title">MENU</a> <a href="#"
				class="menu_title">MENU</a> <a href="#" class="menu_title">MENU</a>
			<a href="/textant/write.text" class="menu_title">창작마당</a>
		</div>
	</div>
	<div class="sub_header"></div>

	<div class="swiper-container">
		<div class="swiper-wrapper">
			<c:forEach var="files" items="${fileList}">
				<div class="swiper-slide">
					<a href="/textant/read.text?fileName=${files}"><img
						src="displayFile.text?fileName=${files}/OriginImg&pageNum=1"
						height="400px" />${files}</a>
				</div>
			</c:forEach>
			<!--             <div class="swiper-slide"> -->
			<!--                 <img src="/textant/resources/book_img/%EB%84%88%EC%9D%98%EC%B7%8C%EC%9E%A5%EC%9D%84%EB%A8%B9%EA%B3%A0%EC%8B%B6%EC%96%B4.jpg" class="slide_img"> -->
			<!--                 <img src="/textant/resources/book_img/%EB%86%93%EC%95%84%EB%B2%84%EB%A6%BC.jpg" class="slide_img"> -->
			<!--                 <img src="/textant/resources/book_img/%EC%9E%90%EC%A1%B4%EA%B0%90%EC%88%98%EC%97%85.jpg" class="slide_img"> -->
			<!--             </div> -->

			<!--             <div class="swiper-slide"><img src="/textant/resources/book_img/%EB%86%93%EC%95%84%EB%B2%84%EB%A6%BC.jpg" class="slide_img"></div> -->

			<!--             <div class="swiper-slide"><img src="/textant/resources/book_img/%EC%9E%90%EC%A1%B4%EA%B0%90%EC%88%98%EC%97%85.jpg" class="slide_img"></div> -->

			<!--             <div class="swiper-slide">Slide 4</div> -->
			<!--             <div class="swiper-slide">Slide 5</div> -->
			<!--             <div class="swiper-slide">Slide 6</div> -->
			<!--             <div class="swiper-slide">Slide 7</div> -->
			<!--             <div class="swiper-slide">Slide 8</div> -->
			<!--             <div class="swiper-slide">Slide 9</div> -->
			<!--             <div class="swiper-slide">Slide 10</div> -->
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<!-- Add Arrows -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<%-- <c:forEach var="files" items="${fileList}">
	<li><a href="/textant/read.text?fileName=${files}"><c:out value="${files}"/></a></li>
</c:forEach> --%>
	
	<br />
	<!-- 
	<a href="/textant/viewer.text">viewer</a>
 -->

	<script src="/textant/resources/Swiper-master/dist/js/swiper.min.js"></script>


	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper('.swiper-container', {
			spaceBetween : 30,
			centeredSlides : true,
			autoplay : true,
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			autoplayDisableOnInteraction : true,

		});
	</script>
</body>

</html>
