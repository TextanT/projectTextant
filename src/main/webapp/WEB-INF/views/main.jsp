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
	/* 	background-image: url(/textant/resources/background_img/back2.png); */
	background: #EFEEEE;
	background-position: center center;
	background-size: cover;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-position: center center;
	/* 	overflow: hidden; */
}

.logo_a {
	
}

.header {
	background-image: url(/textant/resources/background_img/back2.png);
	background-position: center center;
	background-size: cover;
	background-attachment: fixed;
	background-repeat: no-repeat;
	height: 150px;
}

.header_logo {
	padding-left: 500px;
}

@media screen and (max-width:1920px) {
	.header_logo {
		padding-left: 300px;
	}
}

@media screen and (max-width:1440px) {
	.header_logo {
		padding-left: 150px;
	}
}

@media screen and (max-width:1024px) {
	.header_logo {
		padding-left: 80px;
	}
}

.swiper-container {
	margin-top: 15px;
	width: 60%;
	height: 400px;
	border: 1px solid #D8D8D8;
	background: white;
}

@media screen and (max-width:1920px) {
	.swiper-container {
		width: 70%;
		height: 400px;
	}
}

@media screen and (max-width:1440px) {
	.swiper-container {
		width: 80%;
		height: 400px;
	}
}

@media screen and (max-width:1024px) {
	.swiper-container {
		width: 100%;
		height: 400px;
	}
}

.menu_dd {
	padding-left: 20%;
}

@media screen and (max-width:1920px) {
	.menu_dd {
		padding-left: 15%;
	}
}

@media screen and (max-width:1440px) {
	.menu_dd {
		padding-left: 5%;
	}
}

@media screen and (max-width:1024px) {
	.menu_dd {
		padding-left: 0%;
	}
}

.menu_box {
	float: right;
	padding-right: 21%;
	margin-top: -40px;
}

@media screen and (max-width:1920px) {
	.menu_box {
		float: right;
		padding-right: 16%;
		margin-top: -40px;
	}
}

@media screen and (max-width:1440px) {
	.menu_box {
		float: right;
		padding-right: 11%;
		margin-top: -40px;
	}
}

@media screen and (max-width:1024px) {
	.menu_box {
		float: right;
		padding-right: 5%;
		margin-top: -40px;
	}
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	background-color: transparent;
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
	display: -webkit-box
}

.slide_img {
	height: 350px;
	padding-left: 10px;
	padding-right: 10px;
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
	/* 	margin-top: 50px; */
}

.sub_header:hover {
	background-color: rgba(84, 84, 84, 1);
}

.sub_header_menu1 {
	color: white;
	font-size: 15px;
	padding: 21px 30px;
	margin-left: 80px;
}

.sub_header_menu2 {
	color: white;
	font-size: 15px;
	padding: 21px 30px;
	/* 	margin-left: 90px; */
}

.sub_header_menu3 {
	color: white;
	font-size: 15px;
	padding: 21px 30px;
	/* 	margin-left: 90px; */
}

.sub_header_menu1:hover {
	color: highlight;
}

.sub_sub1 {
	float: left;
	padding-top: 3px;
	margin-top: 10px;
	margin-left: 30px;
	height: 30px;
}

.sub_sub2 {
	float: left;
	padding-top: 3px;
	margin-top: 10px;
	height: 38px;
}

.sub_sub3 {
	float: left;
	padding-top: 3px;
	margin-top: 10px;
}

.sub_header_menu2:hover {
	color: highlight;;
}

.sub_header_menu3:hover {
	color: highlight;;
}

a {
	text-decoration: none;
}

.bookimg:hover {
	opacity: 0.7;
}

.bookname {
	text-align: center;
	/* 	float:right; */
	font-size: 15px;
	color: gray;
}

.swiper-wrapper {
	width: 250px;
}

.over_sub_sub {
	padding-top: 8px;
	/* 	margin-top: 10px; */
}

.over_sub_sub1 {
	padding-top: 8px;

	/* 	margin-top: 10px; */
}

.over1_menu1 {
	/* 	float: left; */
	/* 	padding-top: 3px; */
	text-decoration: none;
	font-size: 15px;
	color: highlight;
	margin-left: 300px;
}

.over1_menu2 {
	/* 	float: left; */
	/* 	padding-top: 3px; */
	text-decoration: none;
	font-size: 15px;
	color: highlight;
	margin-left: 300px;
}

li {
	padding-top: 8px;
	list-style: none;
}

li {
	list-style: none;
}

.menu_box1 {
	height: 100px;
	width: 100%;
	background-color: white;
	border: 1px solid gray;
	border-top: none;
	border-right: none;
	border-left: none;
	padding-top: 5px;
	display: none;
	position: absolute;
	z-index: 1000;
}

.list_box1 {
	float: left;
	padding-left: 30px;
	margin-left: 280px;
	padding-right: 35px;
	text-align: center;
	border-left: 1px solid #D8D8D8;
}

.list_box1 a {
	color: gray;
	font-size: 13px;
}

.list_box2 {
	border-left: 1px solid #D8D8D8;
	float: left;
	padding-left: 30px;
	padding-right: 35px;
	text-align: center;
}

.list_box2 a {
	color: gray;
	font-size: 13px;
}

.list_box3 {
	border-left: 1px solid #D8D8D8;
	float: left;
	padding-left: 30px;
	padding-right: 35px;
	text-align: center;
}

.list_box3 a {
	color: gray;
	font-size: 13px;
}

.list_box4 {
	border-left: 1px solid #D8D8D8;
	float: left;
	padding-left: 30px;
	padding-right: 35px;
	text-align: center;
}

.list_box4 a {
	color: gray;
	font-size: 13px;
}

.list_box5 {
	border-left: 1px solid #D8D8D8;
	float: left;
	padding-left: 30px;
	padding-right: 35px;
	text-align: center;
}

.list_box5 a {
	color: gray;
	font-size: 13px;
}

.list_box6 {
	border-left: 1px solid #D8D8D8;
	float: left;
	padding-left: 30px;
	padding-right: 35px;
	text-align: center;
}

.list_box6 a {
	color: gray;
	font-size: 13px;
}

.menu_top {
	width: 100%;
	/* 	height: 100px; */
}

.book_list_box {
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 10%;
	padding-top: 1%;
	padding-bottom: 1%;
	border: 1px solid #D8D8D8;
	width: 1012px;
	height: 820px;
	background: white;
	margin-top: 20px;
}

.book_list1 {
	padding-left: 2%;
	padding-bottom: 2%;
	float: left;
}

.book_list2 {
	padding-left: 2%;
	padding-bottom: 2%;
	float: left;
}

.book_list3 {
	padding-left: 2%;
	float: left;
	padding-bottom: 2%;
}

.book_list4 {
	padding-left: 2%;
	float: left;
	padding-bottom: 2%;
}

.book_list5 {
	padding-left: 2%;
	float: left;
	padding-bottom: 2%;
}

.book_list6 {
	padding-left: 2%;
	float: left;
	padding-bottom: 2%;
}

.book_list7 {
	padding-left: 2%;
	float: left;
	padding-bottom: 2%;
}

.book_list8 {
	padding-left: 2%;
	float: left;
	padding-bottom: 2%;
}

.book_list9 {
	padding-left: 2%;
	float: left;
	padding-bottom: 2%;
}

.book_list10 {
	padding-left: 2%;
	float: left;
	padding-bottom: 2%;
}

.book_list11 {
	padding-left: 2%;
	float: left;
	padding-bottom: 2%;
}

.book_list12 {
	padding-left: 2%;
	float: left;
	padding-bottom: 2%;
}

.book_list13 {
	padding-left: 2%;
	float: left;
	padding-bottom: 2%;
}

.book_list14 {
	padding-left: 2%;
	float: left;
	padding-bottom: 2%;
}

.book_list15 {
	padding-left: 2%;
	float: left;
	padding-bottom: 2%;
}

.book_img_size {
	height: 257px;
}

.data_box {
	display: block;
	margin-left: auto;
	margin-right: auto;
	/* 	margin-top: 10%; */
	/* 	padding-top: 1%; */
	padding-bottom: 1%;
	/* 	border: 1px solid #D8D8D8; */
	border-left: none;
	border-top: none;
	width: 1012px;
	height: 160px;
	/* 	background: white; */
	margin-top: 20px;
	width: 1012px;
}

ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #eee;
	border-left: 1px solid #d8d8d8;
	/*            width: 350px;*/
	font-family: "dotum";
	font-size: 12px;
}

ul.tabs li {
	float: left;
	text-align: center;
	cursor: pointer;
	width: 244.5px;
	height: 31px;
	line-height: 26px;
	border: 1px solid #d8d8d8;
	border-left: none;
	font-weight: bold;
	background: #fafafa;
	overflow: hidden;
	position: relative;
}

ul.tabs li.active {
	background: #FFFFFF;
	border-bottom: 1px solid #FFFFFF;
}

.tab_container {
	border: 1px solid #d8d8d8;
	border-top: none;
	clear: both;
	float: left;
	width: 490px;
	background: #FFFFFF;
}

.tab_content {
	padding: 5px;
	font-size: 13px;
	display: none;
}

.tab_container .tab_content ul {
	width: 100%;
	margin: 0px;
	padding: 0px;
}

.tab_container .tab_content ul li {
	padding: 5px;
	list-style: none;
}

.tab_container .tab_content ul li:before {
	content: ">";
	padding: 5px;
	list-style: none;
}

.tab_container .tab_content ul li a {
	color: black;
}

.tab_container .tab_content ul li a:hover {
	color: red;
}

#container {
	width: 249px;
	margin: 0 auto;
}

a {
	text-decoration: none;
}

.tab_menu {
	
}
/*두번째 슬라이드*/
.hidden {
	border: 0;
	clip: rect(0, 0, 0, 0);
	height: 1px;
	width: 1px;
	margin: -1px;
	overflow: hidden;
	padding: 0;
	position: absolute;
}

.visual {
	position: relative;
	width: 490px;
	z-index: 0;
	float: right;
	bottom: 41px;
}

.simg {
	border: 1px solid #d8d8d8;
}

.visual-list {
	overflow: hidden;
	padding-bottom: 235px;
}

.visual-list ul {
	width: 100%;
	position: relative;
}

.visual-list ul li {
	width: 100%;
	position: absolute;
	left: 50%;
	margin-left: -50%;
	display: block;
	z-index: 0;
}

.visual-list ul li.active {
	z-index: 1;
}

.visual-list .img {
	text-align: center;
	height: 151px;
	overflow: hidden;
}

.visual-list .disc {
	position: absolute;
	bottom: 50px;
	min-width: 60px;
	min-height: 50px;
	padding: 10px;
	/* right: 50%;  margin-right: -100px;*/
	background: #000;
	opacity: 0.5;
	left: 120px;
}

.visual-list .disc .tit {
	/*            color: #cbcbcb;*/
	font-size: 14px;
	letter-spacing: .05em;
}

.visual-list .disc .date {
	color: #a2a2a2;
	font-size: 12px;
	letter-spacing: .03em;
	margin-top: 10px;
}

.visual-list .disc p {
	position: relative;
}

.visual-list .disc .btn-more {
	position: absolute;
	bottom: 10px;
	right: 15px;
	width: 100px;
	height: 20px;
	line-height: 18px;
	color: #fff;
	font-size: 11px;
	border: 1px solid #fff;
	border-radius: 5px;
	text-decoration: none;
	text-align: center;
}

.visual .visual-controller {
	position: absolute;
	bottom: 95px;
	width: 100%;
	left: 100px;
	text-align: center;
	z-index: 9000;
}

/* .visual .visual-controller + .visual-list {padding-bottom: 240px;} */
.visual .visual-controller a {
	width: 8px;
	height: 8px;
	display: inline-block;
	text-indent: -999em;
	/*            vertical-align: middle;*/
	/*            border: 1px solid #ccc;*/
	border-radius: 8px;
	background-color: #ccc;
}

.visual .visual-controller a.active {
	background-color: black;
}

.visual .visual-controller [class*="btn-"] {
	display: none;
}

.visual .visual-controller .btn-play.active, .visual .visual-controller .btn-stop.active
	{
	display: inline-block;
}

.visual .visual-controller .btn-play, .visual .visual-controller .btn-stop
	{
	padding-left: 180px;
}

.footer {
	height: 300px;
	border-top: 1px solid #d8d8d8;
	background: white;
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
			<c:if test="${id!=null}">
				<c:out
					value="
			<a href='#' class='menu_title'><span class='menu1' id='menu1'>${id}</span></a>
			
			<a href='#' class='menu_title'><span class='menu2'id='menu2'>마이페이지</span></a> 

			<a href='logout.text' class='menu_title'><span class='menu3'id='menu3'>로그아웃</span></a> 
			
			<a href='first.text' class='menu_title'><span class='menu4'id='menu4'>처음으로</span></a>
			 "
					escapeXml="false" />
			</c:if>

			<c:if test="${id==null}">
				<c:out
					value="
			<a href='login.text' class='menu_title'><span class='menu1' id='menu1'>로그인</span></a>
			
			<a href='sign.text' class='menu_title'><span class='menu2'id='menu2'>회원가입</span></a> 

			<a href='#' class='menu_title'><span class='menu3'id='menu3'>meme</span></a> 
			
			<a href='first.text' class='menu_title'><span class='menu4'id='menu4'>처음으로</span></a>
			 "
					escapeXml="false" />
			</c:if>



		</div>
	</div>

	<div class="sub_header">
		<div class="menu_dd">
			<div class="sub_sub1">
				<a href='' class='sub_header_menu1'>내서재</a>
			</div>
			<div class="sub_sub2">
				<a href='/textant/write.text' class='sub_header_menu2'
					id="sub_menu2">창작카페</a>
			</div>
			<div class="sub_sub3">
				<a href='' class='sub_header_menu3' id="sub_menu3">장르별</a>
			</div>
		</div>
	</div>
	<div class="menu_top">
		<div class="menu_box1">
			<div class="list_box1">
				<ul>
					<li><a href="#">카페</a></li>
					<li><a href="#">베스트</a></li>
					<li><a href="#">작품쓰기</a></li>

				</ul>
			</div>
			<div class="list_box2">
				<ul>
					<li><a href="#">역사</a></li>
					<li><a href="#">스포츠</a></li>
					<li><a href="#">SF</a></li>

				</ul>
			</div>
			<div class="list_box3">
				<ul>
					<li><a href="#">추리</a></li>
					<li><a href="#">공포</a></li>
					<li><a href="#">게임</a></li>

				</ul>
			</div>
			<div class="list_box4">
				<ul>
					<li><a href="#">판타지</a></li>
					<li><a href="#">무협</a></li>
					<li><a href="#">미스테리</a></li>

				</ul>
			</div>
			<div class="list_box5">
				<ul>
					<li><a href="#">로맨스</a></li>
					<li><a href="#">전쟁</a></li>
					<li><a href="#">성장</a></li>

				</ul>
			</div>
			<div class="list_box6">
				<ul>
					<li><a href="#">시</a></li>
					<li><a href="#">수필</a></li>
					<li><a href="#">유머</a></li>

				</ul>
			</div>

		</div>
	</div>


	<div class="swiper-container" onmouseover="slidestop()"
		onmouseout="slidestart()">
		<div class="swiper-wrapper">
			<c:forEach var="files" items="${fileList}">

				<div class="swiper-slide">
					<a href="/textant/read.text?fileName=${files}&bookType=txt"><img
						src="displayFile.text?fileName=${files}/OriginImg&pageNum=1&fileType=jpg"
						height="300px" style="display: block;" class="bookimg" /> <span
						class="bookname">${files}</span></br> <span class="bookname">기시미
							이치로작가</span> </a>


				</div>
			</c:forEach>
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<!-- Add Arrows -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>

	</div>
	<div class="book_list_box">
		<div class="book_list1">
			<a href="#"><img src="/textant/resources/book_img/너의췌장을먹고싶어.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list2">
			<a href="#"><img src="/textant/resources/book_img/자존감수업.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list3">
			<a href="#"><img src="/textant/resources/book_img/신경끄기의 기술.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list4">
			<a href="#"><img src="/textant/resources/book_img/세도나메서드.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list5">
			<a href="#"><img src="/textant/resources/book_img/언어의온도.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list6">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list7">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list8">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list9">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list10">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list11">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list12">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list13">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list14">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>
		<div class="book_list15">
			<a href="#"><img src="/textant/resources/book_img/남아있는나날.jpg"
				style="border: 1px solid #D8D8D8;" class="book_img_size"> </a>
		</div>

		<div class="book_list4"></div>
		<div class="book_list5"></div>
	</div>


	<div class="data_box">
		<div class="tab_menu">
			<div class="tab_box">
				<ul class="tabs">
					<li class="active" rel="tab1">공지사항</li>
					<li rel="tab2">업데이트</li>
				</ul>
				<div class="tab_container">
					<div id="tab1" class="tab_content">
						<ul>
							<li><a href="#">17/11/24 공지사항 입니다.</a></li>
							<li><a href="#">17/11/25 공지사항 입니다.</a></li>
							<li><a href="#">17/11/26 공지사항 입니다.</a></li>
							<li><a href="#">17/11/27 공지사항 입니다.</a></li>
						</ul>
					</div>
					<div id="tab2" class="tab_content">
						<ul>
							<li><a href="#">17/11/24 업데이트 입니다.</a></li>
							<li><a href="#">17/11/24 업데이트 입니다.</a></li>
							<li><a href="#">17/11/24 업데이트 입니다.</a></li>
							<li><a href="#">17/11/24 업데이트 입니다.</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="visual">

			<div class="visual-controller">
				<a href="#visual-01">1번보기</a> <a href="#visual-01">2번보기</a> <a
					href="#visual-01">3번보기</a> <a href="#visual-01">4번보기</a>
				<div type="button" class="btn-stop">
					<img src="/textant/resources/slide_img/start.jpg">
				</div>
				<div type="button" class="btn-play">
					<img src="/textant/resources/slide_img/stop.jpg">
				</div>
			</div>


			<div class="visual-list">
				<ul>
					<li id="visual-01">
						<div class="img">
							<img src="/textant/resources/slide_img/event1.jpg" alt=""
								class="simg" />
						</div>
					</li>
					<li id="visual-02">
						<div class="img">
							<img src="/textant/resources/slide_img/event2.jpg" alt=""
								class="simg" />
						</div>
					</li>
					<li id="visual-03">
						<div class="img">
							<img src="/textant/resources/slide_img/event3.jpg" alt=""
								class="simg" />
						</div>
					</li>
					<li id="visual-04">
						<div class="img">
							<img src="/textant/resources/slide_img/event4.jpg" alt=""
								class="simg" />
						</div>
					</li>

				</ul>
			</div>
		</div>

	</div>




	<footer class="footer">
		<div class="footer1">
			<span>
			<img src="/textant/resources/icon_img/footer_logo.png"
			style="padding-left:10%; padding-top:20px;">
			</span>
		</div>
		<div class="footer2">
		
		</div>
	</footer>

	<div style="position: fixed; bottom: 15px; right: 30px;">
		<a href="#" id="MOVE_TOP_BTN"><img
			src="/textant/resources/icon_img/top.jpg"></a>
	</div>


	<script src="/textant/resources/Swiper-master/dist/js/swiper.min.js"></script>


	<!-- Initialize Swiper -->
	<script>
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
		});
		function slidestop() {
			swiper.autoplay.stop();
		};
		function slidestart() {
			swiper.autoplay.start();
		};
	</script>
	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript">
		
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#sub_menu2').mouseover(function() {
				$('.menu_box1').css("display", "block");
			})
			$('#sub_menu2').mouseout(function() {
				$('.menu_box1').css("display", "none");
			})
			$('#sub_menu3').mouseover(function() {
				$('.menu_box1').css("display", "block");
			})
			$('#sub_menu3').mouseout(function() {
				$('.menu_box1').css("display", "none");
			})
			$('.menu_box1').mouseover(function() {
				$('.menu_box1').css("display", "block");
			})
			$('.menu_box1').mouseout(function() {
				$('.menu_box1').css("display", "none");
			})
		})
	</script>
	<script>
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
	</script>
	<script type="text/javascript">
		$(function() {

			$(".tab_content").hide();
			$(".tab_content:first").show();

			$("ul.tabs li").click(function() {
				$("ul.tabs li").removeClass("active").css("color", "#333");
				//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
				$(this).addClass("active").css("color", "darkred");
				$(".tab_content").hide()
				var activeTab = $(this).attr("rel");
				$("#" + activeTab).fadeIn()
			});
		});
	</script>
	<script type="text/javascript">
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
	</script>
</body>

</html>
