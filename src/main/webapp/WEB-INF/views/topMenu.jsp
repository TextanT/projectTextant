<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="sub_header">
		<div class="menu_dd">
			<div class="sub_sub1">
				<a href='myStudy.text' class='sub_header_menu1'>내서재</a>
			</div>
			<div class="sub_sub2">
				<a href='creative.text' class='sub_header_menu2' id="sub_menu2">창작카페</a>
			</div>
			<div class="sub_sub3">
				<a href='serchpage.genre' class='sub_header_menu3' id="sub_menu3">장르별검색</a>
			</div>
			<div class="sub_sub3">
				<a href='/textant/write.text' class='sub_header_menu3'
					id="sub_menu3">책쓰기</a>
			</div>
		</div>
	</div>
	<div class="menu_top">
		<div class="menu_box1">
			<div class="list_box1">
				<ul>
					<li><a href="#">카페</a></li>
					<li><a href="/textant/writeAmateur.text">작품쓰기</a></li>
					<li style="cursor: default;">&nbsp</li>

				</ul>
			</div>
			<div class="list_box2">
				<ul>
					<li><a href="/textant/creativeSerch.genre">창작도서</a></li>
					<li><a href="serchpage.genre">일반도서</a></li>
					<li style="cursor: default;">&nbsp</li>

				</ul>
			</div>

		</div>
	</div>
</body>
</html>