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

<title>관리자 페이지</title>
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
		<%@include file="../menuBox.jsp" %>
	</div>
<%@include file="../topMenu.jsp" %>
	<br />
	<div id="managingDistrict">
		<div style="margin-top: 50px;">
			<h3 style="text-align: center">책 상세 설명</h3>
		</div>
		<div
			style="margin-left: 80px; margin-right: 80px; margin-bottom: 50px; width: auto;">

			<div class="managing" id="recommendBook">

				<table class="table table-bordered"
					style="margin-left: auto; margin-right: auto; text-align: center;">
					<tr>
						<td>번호</td>
						<td><c:out value="${bookInfoList.bookArticleNum}" /></td>
						<td>유저이름</td>
						<td><c:out value="${managingList.userName}" /></td>
					</tr>
					<tr>
						<td>총 페이지 : <c:out value="${bookInfoList.totalPage}" /></td>
						<td>타입 : <c:out value="${bookInfoList.bookType}" /></td>
						<td>장르</td>
						<td><c:out value="${bookInfoList.genre}" /></td>
					</tr>
					
					
					<tr>
						<td>별점</td>
						<td><c:out value="${(bookInfoList.totalScore+0.0)/(bookInfoList.scoreNum+0.0)}" /></td>
						<td>조회수</td>
						<td><c:out value="${bookInfoList.hit}" /></td>
					</tr>
					<tr>
						<td>작성날짜</td>
						<td colspan="3"><c:out value="${bookInfoList.writeDate}" /></td>
					</tr>
					<tr>
						<td>책이름</td>
						<td colspan="3"><c:out value="${bookInfoList.bookName}" /></td>
					</tr>
					<tr>
						<td>책 설명</td>
					
						<td colspan="3" style="text-align: left;"><textarea
								readonly="readonly" class="form-control" rows="10"
								style="background-color: white;"><c:out value="${bookInfoList.bookDesc}"/></textarea>
								</td>
					</tr>
					<tr><td>파일위치</td><td colspan="3"><a href="/textant/read.text?fileName=${bookInfoList.fileLocation}" target="_blank"><c:out value="${bookInfoList.fileLocation}"></c:out></a></td></tr>
					
					<tr>
						<td colspan="4"><input type="button" value="삭제하기"
							onclick="delete_event()"> <input type="button"
							value="목록으로" onclick="history.back()"></td>
					</tr>
				</table>
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
		function delete_event() {
			if (confirm("정말 삭제하시겠습니까??") == true) { //확인
				document.location.href = 'bookInfoDelete.text?bookArticleNum=${bookInfoList.bookArticleNum}&referer=${referer}';
				setTimeout(function() {
					history.back();
				}, 500);
			} else { //취소
				return;
			}
		}
	</script>

</body>
</html>