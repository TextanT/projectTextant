<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/slick-1.8.0/slick/slick.css">
<link rel="stylesheet" type="text/css"
	href="resources/slick-1.8.0//slick/slick-theme.css">
<title>Insert title here</title>
<style>
body {
	background-image: url(resources/background_img/book-2572101_1920.jpg);
	/*            background-image: url(slick-1.8.0/slick-1.8.0/slick/1300.png);*/
	background-position: 50% 0%;
	background-size: 100%;
	background-repeat: no-repeat;
	position: fixed;
	overflow: hidden;
}

.main_logo {
	padding-left: 280px;
	padding-top: 20px;
}

.login_box {
	position: absolute;
	top: 200%;
	left: 52%;
	width: 20%;
}

.guest_box {
	position: absolute;
	top: 300%;
	left: 52%;
	width: 20%;
}

.sign_box {
	position: absolute;
	top: 60%;
	left: 4.5%;
	width: 50%;
}
/*
        .login_box:hover {
            background: none;
            border: 1px solid white;
        }
*/
a {
	text-decoration: none;
	color: white;
	text-align: center;
}

.guestt {
	width: 200px;
	height: 40px;
	background-color: #9f793e;
	padding: 13px 100px;
	border: 1px solid #9f793e;
}

.guestt:hover {
	background: none;
	transition: 0.5s;
	border: 1px solid white;
}

.loginn {
	width: 200px;
	height: 40px;
	background-color: #9f793e;
	padding: 13px 100px;
	border: 1px solid #9f793e;
}

.loginn:hover {
	background: none;
	transition: 0.5s;
	border: 1px solid white;
}

.signn {
	text-align: center;
	width: 200px;
	height: 40px;
	background-color: #9f793e;
	padding: 13px 100px;
	border: 1px solid #9f793e;
}

.signn:hover {
	background: none;
	transition: 0.5s;
	border: 1px solid white;
}

.loginDiv {
	/*
            margin-top: 200px;
            margin-left: 465px;
            width: 300px;
            height: 320px;
            */
	/*            border: 1.5px solid #BDBDBD;*/
	position: absolute;
	top: 180%;
	left: 56%;
	width: 270px;
	height: 350px;
	margin: -50px 0 0 -50px;
	/*            display: none;*/
}

a {
	text-decoration: none
}

ul li {
	list-style-type: none;
}

ul li label {
	width: 70px;
	float: left;
}
/*        id Div*/
/*
        .idDivc:first-child {
            border-bottom: none;
        }
*/
.idDivc {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 11px 11px 11px 13px;
	background: #fff;
}

.id_sp.int_id {
	background-position: 100% -57px;
}

.id_sp {
	position: relative;
	display: block;
	height: 27px;
	background: #fff
		url(https://static.nid.naver.com/images/ui/join/t_ico_join3_2x_20170906.png)
		100% 0 no-repeat;
	-webkit-background-size: 97px 900px;
	background-size: 97px 900px;
}

.idDivc .int {
	font-size: 15px;
	position: relative;
	z-index: 10;
	width: 100%;
	height: 16px;
	padding: 6px 0;
	border: none;
	background: #fff;
	apperance: none;
	-webkit-apperance: none;
}

.PassDivc:first-child {
	border-bottom: none;
}

.PassDivc {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 11px 11px 11px 13px;
	background: #fff;
}

.pass_sp.int_pass {
	background-position: 100% -57px;
}

.pass_sp {
	position: relative;
	display: block;
	height: 27px;
	background: #fff
		url(https://static.nid.naver.com/images/ui/join/t_ico_join3_2x_20170906.png)
		100% 0 no-repeat;
	-webkit-background-size: 97px 900px;
	background-size: 97px 900px;
}

.PassDivc .int {
	font-size: 15px;
	position: relative;
	z-index: 10;
	width: 100%;
	height: 16px;
	padding: 6px 0;
	border: none;
	background: #fff;
	apperance: none;
	-webkit-apperance: none;
}

input {
	font-family: '돋움', Dotum, Helvetica, sans-serif;
	font-size: 12px;
	-webkit-text-size-adjust: none;
}
/*        border line*/
.idDivc {
	/*            border-top: none;*/
	border: 1px solid #D8D8D8;
	padding: 10px;
}

.PassDivc {
	/*            border-top: none;*/
	border: 1px solid #D8D8D8;
}

.PasscDivc {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 11px 11px 11px 13px;
	background: #fff;
}

.header_icon {
	/*            padding-top: 10px;*/
	float: left;
	padding-left: 3.8em;
	padding-top: 14px;
}

.header_icon {
	opacity: 1;
}

#myDIV1 {
	display: none;
}
.aass{
	display: none;
}
</style>
</head>
<body>
	<div class="main_logo">
		<img src="resources/icon_img/fristLogo2.png" class="logo">
	</div>
	<form action="/ccc/login.bbs" method="post" id="loginForm" name="log">
	
	<button type="submit" class="aass" id="sasd"></button>
	
	<div id="myDIV1">
		<div class="loginDiv" id="aaa">
			<div id="idDiv" class="idDivc">
				<span class="id_sp int_id"> <input type="text" id="id"
					class="int" value maxlength="20" autocomplete="off"
					placeholder="아이디" name="id">
				</span>
			</div>
			<div style="height: 15px;"></div>
			<div id="PassDiv" class="PassDivc">
				<span class="pass_sp int_pass"> <input type="password"
					id="pass" class="int" value maxlength="20" autocomplete="off"
					placeholder="비밀번호" name="pass">
				</span>
			</div>
			<div class="sign_box">
				<a href="login.bbs" class="signn" style="width: 100%;" onclick="log()"> LOGIN </a>
			</div>

			<div class="header_icon">
				<a href="#" class="header_tr_td_a"> <img
					src="resources/icon_img/facebook.png">
				</a> <a href="#" class="header_tr_td_a"> <img
					src="resources/icon_img/naver.jpg">
				</a> <a href="#" class="header_tr_td_a"> <img
					src="resources/icon_img/kakao.jpg">
				</a> <a href="#" class="header_tr_td_a"> <img
					src="resources/icon_img/google.jpg">
				</a>
			</div>
		</div>
	</div>

	<div class="btnbox">
		<div class="login_box" onclick="login()">
			<a href="#" class="loginn" style="width: 100%;" id="btn1"> <span
				class="btn1_text">LOGIN</span>
			</a>
		</div>

		<div class="guest_box" onclick="back()">
			<a href="#" class="guestt" style="width: 100%;" id="btn2"> <span
				class="btn2_text">GUEST</span>
			</a>
		</div>

	</div>
</form>
	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		function login() {

			var x = document.getElementById("myDIV1");
			//        로그인화면 들어가기
			if (x.style.display === "block") {
				$('#btn1').attr("href", "sign.bbs");
			} else {
				document.getElementById("btn1").style.padding = "13px 106px";
				document.getElementById("btn2").style.padding = "13px 105px";
				$('.btn1_text').text("SIGN");

				$('.btn2_text').text("BACK");

				$('#btn1').attr("href", "##");
				$('#btn2').attr("href", "#");

				$('.login_box').animate({
					top : 550
				});
				$('.guest_box').animate({
					top : 650
				});
				$('#myDIV1').show(400);
			}

		}

		//        로그인화면나가기
		function back() {
			var x = document.getElementById("myDIV1");

			if (x.style.display === "block") {
				document.getElementById("btn1").style.padding = "13px 100px";
				document.getElementById("btn2").style.padding = "13px 100px";
				$('.btn1_text').text("LOGIN");
				$('.btn2_text').text("GUEST");
				$('#btn1').attr("href", "#");
				$('#btn2').attr("href", "##");

				//            document.getElementById("btn1").style.paddingRight = "105px";

				$('.login_box').animate({
					top : 332
				});
				$('.guest_box').animate({
					top : 498
				});
				$('#myDIV1').hide(300);
			} else {
			}
		}
		function log(){
			document.log.submit();
		}
	</script>
</body>
</html>