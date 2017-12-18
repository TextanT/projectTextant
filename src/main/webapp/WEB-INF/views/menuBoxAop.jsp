<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TEXTANT</title>
</head>
<body>
<div class="menu_box">
			<c:if test="${id!=null}">
				<c:out
					value="
			<a href='#' class='menu_title'><span class='menu1' >${nickname}</span></a>
			
			<a href='mypage.text' class='menu_title'><span class='menu2'>내정보</span></a> 

			<a href='logout.text' class='menu_title'><span class='menu3'id='menu3'>로그아웃</span></a> 
			
			<a href='first.text' class='menu_title'><span class='menu4'id='menu4'>처음으로</span></a>
			 "
					escapeXml="false" />
			</c:if>

			<c:if test="${id==null}">
				<c:out
					value="
			<a href='#' class='menu_title'><span class='menu1' id='menu1'>로그인</span></a>
			
			<a href='#' class='menu_title'><span class='menu2'id='menu2'>회원가입</span></a> 

			<a href='find.text' class='menu_title'><span class='menu3'id='menu3'>ID/PW찾기</span></a> 
			
			<a href='first.text' class='menu_title'><span class='menu4'id='menu4'>처음으로</span></a>
			 "
					escapeXml="false" />
			</c:if>
       


		</div>
	</div>
	
</body>
</html>