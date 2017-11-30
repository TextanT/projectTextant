<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/textant/resources/css/header.css" rel="stylesheet"
	type="text/css">
<title>Insert title here</title>
<style>
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
	<div class="book_list_box">
	 	이름 <input type="text" class="user_name">
	 	별명<input type="text" class="nickname">
	 	아이디<input type="text" class="user_id">
	 	비밀번호<input type="text" class="user_pass">
	 	비밀번호확인<input type="text" class="user_passch">
	 	메일<input type="text" class="user_mail">
	 	성별<input type="text" class="user_jender">
	 	나이<input type="text" class="user_age">
	 	소개<input type="text" class="user_comment">
	 	<tr>
	 		<td></td>
	 		<td></td>
	 		<td></td>
	 	</tr>
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