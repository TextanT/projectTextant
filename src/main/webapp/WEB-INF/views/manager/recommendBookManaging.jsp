<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/textant/resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/footer.css" rel="stylesheet"
	type="text/css">

<title>Insert title here</title>
<style>
body {
	
}

.clear {
	clear: both;
}

.managing {
	border: 1px solid black;
	background-color: white;
}
</style>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
body {
	background-color: #EFEEEE;
}
/* .managing table tr:hover{ */
/* background-color: gray; */
/* font: white; */
/* } */
</style>
</head>
<body>
	<div class="header">
		<div class="header_logo" style="padding-top: 20px;">
			<div style="float: left;">
				<a href="/textant/main.text" class="logo_a" style="height: 55px;">
					<img src="/textant/resources/icon_img/logo_mini.png" class="logo">
				</a>
			</div>
			<div style="float: left;">
				<a href="/textant/managerMain.text" style="text-decoration: none;"><span
					style="margin-top: auto; margin-bottom: auto; font-size: 33px; color: white;">
						&nbsp | 관리자 메뉴</span></a>
			</div>
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

	<%@include file="../topMenu.jsp" %>
	<br />
	<div id="managingDistrict">
		<div style="margin-top: 50px;">
			<h3 style="text-align: center">추천 책 관리</h3>
		</div>
		<div
			style="margin-left: 80px; margin-right: 80px; margin-bottom: 50px; width: auto;">
			<div style="text-align: right;">
				<a href="/textant/recommendBookWrite.text?userNum=${userNum}">추천책
					쓰기</a>
			</div>
			<div class="managing" id="recommendBook">
				<table class="table"
					style="margin-left: auto; margin-right: auto; text-align: center;">
					<tr>
						<td>번호</td>
						<td>책이름</td>
						<td>유저이름</td>
						<td>추천코멘트</td>
						<td>작성날짜</td>
					</tr>
					<c:forEach var="managingList" items="${managingList}">

						<tr style="cursor: pointer;"
							onClick="window.open('/textant/managingRecommendContent.text?num=${managingList.num}','_self');">
							<td><c:out value="${managingList.num}" /></td>
							<td><c:out value="${managingList.bookName}" /></td>
							<td><c:out value="${managingList.userName}" /></td>
							<td><c:out value="${managingList.comment}" /></td>
							<td><c:out value="${managingList.writeDate.substring(0,10)}" /></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" align="center" height="40">${pageCode}</td>
					</tr>
				</table>
			</div>
			<div style="text-align: right;">
				<a href="/textant/managerMain.text">관리자 메인</a>
			</div>
		</div>
	</div>

	<%@include file="../footer.jsp" %>

	<div style="position: fixed; bottom: 15px; right: 30px;">
		<a href="#" id="MOVE_TOP_BTN"><img
			src="/textant/resources/icon_img/top.jpg"></a>
	</div>

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

</body>
</html>