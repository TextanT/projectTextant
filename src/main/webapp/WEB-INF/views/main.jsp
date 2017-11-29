<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="/textant/resources/Swiper-master/dist/css/swiper.min.css">
<link href="/textant/resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/footer.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/main_slider.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/main_slider2.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/book_list.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/notice.css" rel="stylesheet"
	type="text/css">
<title>Document</title>
<style>
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
					<a href="/textant/read.text?fileName=${files}"><img
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
			<span> <img src="/textant/resources/icon_img/footer_logo.png"
				style="padding-left: 10%; padding-top: 20px;">
			</span>
		</div>
		<div class="footer2"></div>
	</footer>

	<div style="position: fixed; bottom: 15px; right: 30px;">
		<a href="#" id="MOVE_TOP_BTN"><img
			src="/textant/resources/icon_img/top.jpg"></a>
	</div>

	<script src="/textant/resources/Swiper-master/dist/js/swiper.min.js"></script>

	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>

	<!-- Initialize Swiper -->
	<script src="/textant/resources/js/main_slider.js"></script>

	<script src="/textant/resources/js/header_over.js"></script>

	<script src="/textant/resources/js/top_move.js"></script>

	<script src="/textant/resources/js/notice.js"></script>

	<script src="/textant/resources/js/main_slider2.js"></script>

</body>

</html>
