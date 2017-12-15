<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/textant/resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/footer.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/myStudy-theme.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/myStudy.css" rel="stylesheet"
	type="text/css">
	

<title>Insert title here</title>
<style>
.bookname{
	 margin-left: 35%;
}
.clear {
	clear: both;
}

.managing {
	border: 1px solid black;
}
</style>

</head>
<body>
	<div class="header">
		<input type="hidden" id="pageNum" name="pageNum" value="1">
		<div class="header_logo" style="padding-top: 20px;">
		<div style="float:left;">
			<a href="/textant/main.text" class="logo_a" style="height:55px;"> <img
				src="/textant/resources/icon_img/logo_mini.png" class="logo">
			</a>
			</div><div style="float:left;"><span style="margin-top: auto; margin-bottom: auto;font-size: 33px; color: white;"> &nbsp | 내 서재</span></div>
		</div>
		<div class="menu_box">
			<c:if test="${id!=null}">
				<c:out
					value="
			<a href='#' class='menu_title'><span class='menu1' id='menu1'>${id}</span></a>
			
			<a href='mypage.text' class='menu_title'><span class='menu2'id='menu2'>내정보</span></a> 

			<a href='logout.text' class='menu_title'><span class='menu3'id='menu3'>로그아웃</span></a> 
			
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
	<br />
	<div id="managingDistrict">
		<div
			style="margin-top: 10px; margin-left: 80px; width: 40%; float: left;">
			<h3 style="text-align: center">나의 덧글</h3>
		</div>
		<div
			style="margin-top: 10px; margin-right: 80px; width: 40%; float: right;">
			<h3 style="text-align: center">내가 쓴 책</h3>
		</div>
		
		<div class="clear"></div>
		
				

		<div style="margin-right: 80px; width: 450px; float: right;'">
			<div style="text-align: right;"><a href="/textant/myBookWriteView.text?pageNum=1">더 보기</a></div>
			<div class="managing" id="reportComment" style="height: 230px;">
				<div class="swiper-slide" style="margin: auto;"> 
					<c:forEach var="bookWrite" items="${bookWriteList}">
						<div style="; margin-left: 1%; display: inline-block; margin-top: 1px">
							<a href="/textant/read.text?fileName=${bookWrite.fileLocation}">
						<div style="height: 200px; width: 140px; overflow: hidden;">

								<img src="displayFile.text?fileName=${bookWrite.fileLocation}/OriginImg&pageNum=1&fileType=jpg"
									 style="display: block; height: 100%; width: auto;"
									class="bookimg" />

							</div> 
							<span class="bookname">${bookWrite.bookName}</span>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div style="margin-top: 50px;">
			<h3 style="text-align: center">내가 읽은 책</h3>
		</div>
		<div style="margin-left: 80px; margin-right: 80px; width: auto;">
			<div style="text-align: right;"><a href="/textant/myBookReadView.text?pageNum=1">더 보기</a></div>
			<div class="managing" id="reportComment"
				style="height: 230px; ">
				<div class="swiper-slide"> 
					<div class="swiper-slide">
						<c:forEach var="bookWrite" items="${bookReadList}">
							<div style="text-align: center; margin-left: 2%">
								<a href="/textant/read.text?fileName=${bookRead.fileLocation}">
									<div style="height: 200px; width: 140px; overflow: hidden;">

										<img
											src="displayFile.text?fileName=${bookRead.fileLocation}/OriginImg&pageNum=1&fileType=jpg"
											style="display: block; height: 100%; width: auto;"
											class="bookimg" />

									</div> <span class="bookname">${bookRead.bookName}</span>
								</a>
							</div>
						</c:forEach>
					</div>
					</div>
				</div>
			</div>
		<div style="margin-top: 50px;">
			<h3 style="text-align: center">내가 찜한책</h3>
		</div>
		<div style="margin-left: 80px; margin-right: 80px; width: auto;">
			<div style="text-align: right;"><a href="/textant/myWishView.text?pageNum=1">더 보기</a></div>
			<div class="managing" id="reportComment"
				style="height: 200px; ">
						<div class="swiper-slide">
						<c:forEach var="bookWrite" items="${wishList}">
							<div style="text-align: center; margin-left: 2%">
								<a href="/textant/read.text?fileName=${wish.fileLocation}">
									<div style="height: 200px; width: 140px; overflow: hidden;">

										<img
											src="displayFile.text?fileName=${wish.fileLocation}/OriginImg&pageNum=1&fileType=jpg"
											style="display: block; height: 100%; width: auto;"
											class="bookimg" />

									</div> <span class="bookname">${wish.bookName}</span>
								</a>
							</div>
						</c:forEach>
					</div>
			</div>
		</div>
		<div style="margin-top: 50px;">
			<h3 style="text-align: center">북마크</h3>
		</div>
		<div style="margin-left: 80px; margin-right: 80px;margin-bottom:50px; width: auto;">
			<div style="text-align: right;"><a href="/textant/myBookMarkView.text?pageNum=1">더 보기</a></div>
			<div class="managing" id="reportComment"
				style="height: 200px; ">
						<div class="swiper-slide">
						<c:forEach var="bookWrite" items="${bookMarkList}">
							<div style="text-align: center; margin-left: 2%">
								<a href="/textant/read.text?fileName=${bookMark.fileLocation}">
									<div style="height: 200px; width: 140px; overflow: hidden;">
										<img src="displayFile.text?fileName=${bookMark.fileLocation}/OriginImg&pageNum=1&fileType=jpg"
											style="display: block; height: 100%; width: auto;"
											class="bookimg" />

									</div> 
									<span class="bookname">${bookMark.bookName}</span>
								</a>
							</div>
						</c:forEach>
					</div>
			</div>
		</div>
	</div>
		<%@include file="../footer.jsp" %>

		<div style="position: fixed; bottom: 15px; right: 30px;">
			<a href="#" id="MOVE_TOP_BTN"><img
				src="/textant/resources/icon_img/top.jpg"></a>
		</div>
<!-- src="https://code.jquery.com/jquery-3.2.1.min.js" -->
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
	<script src="/textant/resources/js/myStudy.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
    $(document).on('ready', function() {
      $(".vertical-center-4").slick({
        dots: true,
        vertical: true,
        centerMode: true,
        slidesToShow: 4,
        slidesToScroll: 2
      });
      $(".vertical-center-3").slick({
        dots: true,
        vertical: true,
        centerMode: true,
        slidesToShow: 3,
        slidesToScroll: 3
      });
      $(".vertical-center-2").slick({
        dots: true,
        vertical: true,
        centerMode: true,
        slidesToShow: 2,
        slidesToScroll: 2
      });
      $(".vertical-center").slick({
        dots: true,
        vertical: true,
        centerMode: true,
      });
      $(".vertical").slick({
        dots: true,
        vertical: true,
        slidesToShow: 3,
        slidesToScroll: 3
      });
      $(".regular").slick({
        dots: true,
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 3
      });
      $(".center").slick({
        dots: true,
        infinite: true,
        centerMode: true,
        slidesToShow: 5,
        slidesToScroll: 3
      });
      $(".variable").slick({
        dots: true,
        infinite: true,
        variableWidth: true
      });
      $(".lazy").slick({
        lazyLoad: 'ondemand',
        infinite: true
      });
    });
</script>
	
</body>
</html>