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
<title>Insert title here</title>
</head>
<style>
.find_pos {
	width: 80%;
	border: 1px solid #e8e8e8;
	height: 700px;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
	background: white;
}

.idfind {
	width: 60%;
	height: 200px;
	/*            border: 1px solid #e8e8e8;*/
	margin: auto;
	margin-top: 10%;
}

.passfind {
	width: 60%;
	height: 200px;
	border-top: 1px solid #e8e8e8;
	margin: auto;
	margin-top: 10px;
	padding-top: 50px;
}

.findidName {
	box-sizing: border-box;
	padding: 5px 11px 5px 8px;
	background: #fff;
	top: 10%;
	left: 15%;
	width: 40%;
	line-height: -10px;
	font-size: 15px;
	margin-top: 25px;
	margin-left: 20px;
}

.findidEmail {
	box-sizing: border-box;
	padding: 5px 11px 5px 8px;
	background: #fff;
	top: 10%;
	left: 15%;
	width: 40%;
	line-height: -10px;
	font-size: 15px;
	margin-top: 15px;
	margin-left: 20px;
}

.findpassName {
	box-sizing: border-box;
	padding: 5px 11px 5px 8px;
	background: #fff;
	top: 10%;
	left: 15%;
	width: 40%;
	line-height: -10px;
	font-size: 15px;
	margin-top: 25px;
	margin-left: 20px;
}

.findpassId {
	box-sizing: border-box;
	padding: 5px 11px 5px 8px;
	background: #fff;
	top: 10%;
	left: 15%;
	width: 40%;
	line-height: -10px;
	font-size: 15px;
	margin-top: 15px;
	margin-left: 20px;
}

.idFinding {
	background-color: #ededed;
	border: 1px solid #dcdcdc;
	display: inline-block;
	color: #777777;
	font-family: arial;
	font-size: 15px;
	font-weight: bold;
	font-style: normal;
	height: 40px;
	line-height: 40px;
	width: 120px;
	text-decoration: none;
	text-align: center;
	margin-left: 8%;
}

.idFinding:hover {
	background-color: #dfdfdf;
}

.idFinding:active {
	position: relative;
	top: 1px;
}

.passFinding {
	background-color: #ededed;
	border: 1px solid #dcdcdc;
	display: inline-block;
	color: #777777;
	font-family: arial;
	font-size: 15px;
	font-weight: bold;
	font-style: normal;
	height: 40px;
	line-height: 40px;
	width: 120px;
	text-decoration: none;
	text-align: center;
	margin-left: 8%;
}

.passFinding:hover {
	background-color: #dfdfdf;
}

.passFinding:active {
	position: relative;
	top: 1px;
}
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
				<span
					style="margin-top: auto; margin-bottom: auto; font-size: 33px; color: white;">
					&nbsp | 아이디/비밀번호찾기</span>
			</div>
		</div>
		<div class="menu_box">
			<c:if test="${id!=null}">
				<c:out
					value="
			<a href='#' class='menu_title'><span class='menu1' id='menu1'>${nickname}</span></a>
			
			<a href='mypage.text' class='menu_title'><span class='menu2'id='menu2'>내정보</span></a> 

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
				<a href='' class='sub_header_menu3' id="sub_menu3"
					style="color: highlight">장르별검색</a>
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
					<li><a href="#">베스트</a></li>
					<li><a href="/textant/write.text">작품쓰기</a></li>

				</ul>
			</div>
			<div class="list_box2">
				<ul>
					<li><a href="#">창작도서</a></li>
					<li><a href="#">일반도서</a></li>
					<li style="cursor: default;">&nbsp</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="find_pos">
		<form action="findid.text" method="post" id="findidForm">
			<div class="idfind">
				<h3>아이디찾기</h3>
				<input type="text" class="findidEmail" name="email"
					placeholder="이메일을 입력해주세요"> <div class="idFinding" id="findidmit">아이디찾기</div>
			</div>
		</form>
		
		<form>
			<div class="passfind">
				<h3>비밀번호찾기</h3>
				<input type="text" class="findpassName" placeholder="이름을 입력해주세요"><br>
				<input type="text" class="findpassId" placeholder="아이디을 입력해주세요">
				<a href="#" class="passFinding">비밀번호찾기</a>
			</div>
		</form>
	</div>

	<footer>
	<div>
		<img height="50px" src="icon_img/footer_logo.png" class="footer_img">
	</div>
	<address>
		Tel. 010-1234-1234<br> Fax. 051)555-555<br> E-Mail.
		cwj1102@naver.com<br> 주소. 부산광역시 남구 신선로 365 부경대학교<br> <br>
		<br> <a href="#" class="foo_a">회사소개</a> <a href="#" class="foo_a">광고문의</a>
		<a href="#" class="foo_a">제휴문의</a> <a href="#" class="foo_a">인재채용</a>
		<a href="#" class="foo_a">서비스약관</a> <a href="#" class="foo_a">고객센터</a>
		<a href="#" class="foo_a">Q&A게시판</a>
	</address>
	</footer>

	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script src="/textant/resources/js/header_over.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			document.getElementById('findidmit').onclick = function() {
				window.open("findid.text?email="+$(".findidEmail").val(),"new","width=700,height=500,top=100,left=100"); 
// 				document.getElementById('findidForm').submit();
				return false;
			}
		};

	</script>
</body>
</html>