<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body {
/* 	background-color: #ffffff; */
    background-image: url(/textant/resources/background_img/book-2572101_1920.jpg);
    background-size: cover;
    background-position: center center;
    background-attachment: fixed;
/*     overflow: hidden; */
    background-repeat: no-repeat;
    background-color: black;
	
}

.btn.block, .btn-two.block, .btn-gradient.block, .btn-effect.block {
	display: block;
	width: 40%;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.btn.cyan, .btn-two.cyan {
	background-color: #7fccde;
}

.rounded {
	border-radius: 10px;
}
/* default button style */
.btn {
	position: relative;
	border: 0;
	padding: 15px 25px;
	display: inline-block;
	text-align: center;
	color: white;
}

.btn:active {
	top: 4px;
}
/* color classes for .btn */
.btn.cyan {
	box-shadow: 0px 4px 0px #73B9C9;
}

.btn.cyan:active {
	box-shadow: 0 0 #73B9C9;
	background-color: #70B4C4;
}

.button_container1 {
	position: absolute;
	top: 30%;
	left: 25%;
	width: 50%;
}

.button_container2 {
	position: absolute;
	top: 50%;
	left: 25%;
	width: 50%;
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

.login_button1 {
	position: absolute;
	top: 50%;
	left: 12%;
	width: 70%;
}

.btn cyan block1 {
	position: absolute;
	top: 50%;
	left: 15%;
	width: 70%;
}

.login_button2 {
	position: absolute;
	top: 65%;
	left: 12%;
	width: 70%;
}

.back_button1 {
	position: absolute;
	top: 80%;
	left: 12%;
	width: 70%;
}

.sign_button1 {
	position: absolute;
	top: 60%;
	left: 12%;
	width: 70%;
}

.back_button2 {
	position: absolute;
	top: 75%;
	left: 12%;
	width: 70%;
}

.sns_login1 {
	position: absolute;
	top: 61%;
	left: 7%;
}

.naver_logo {
	width: 50%;
	height: 50%;
}

.loginDiv {
	background: rgba(255, 255, 255, 0.9);
	/*
            margin-top: 200px;
            margin-left: 465px;
            width: 300px;
            height: 320px;
            */
	/*            border: 1.5px solid #BDBDBD;*/
	border-radius: 1em;
	border-top-left-radius: 0.1em;
	border-top-right-radius: 0.1em;
	border-bottom-left-radius: 0.1em;
	border-bottom-right-radius: 0.1em;
	position: absolute;
	top: 35%;
	left: 42%;
	width: 300px;
	height: 350px;
	margin: -50px 0 0 -50px;
	background-color: transparent;
}

.das {
	display: none;
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

.passc_sp.int_passc {
	background-position: 100% -57px;
}

.passc_sp {
	position: relative;
	display: block;
	height: 27px;
	background: #fff
		url(https://static.nid.naver.com/images/ui/join/t_ico_join3_2x_20170906.png)
		100% 0 no-repeat;
	-webkit-background-size: 97px 900px;
	background-size: 97px 900px;
}

.PasscDivc .int {
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

.header_icon {
	/*            padding-top: 10px;*/
	float: left;
	padding-left: 3.5em;
	padding-top: 14px;
}

.header_icon {
	opacity: 1;
}

.header_tr_td_a {
	margin: 5px 5px 5px 5px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="myDIV1">

		<form action="login.text" method="post" id="loginForm">
			<input type="submit" class="das">

			<div class="loginDiv">
				<div id="idDiv" class="idDivc">
					<span class="id_sp int_id"> 
					<input type="text" id="id"class="int" value maxlength="20" autocomplete="off"
						name="id"placeholder="아이디">
					</span>
				</div>
				<div style="height: 15px;"></div>
				<div id="PassDiv" class="PassDivc">
					<span class="pass_sp int_pass"> 
					<input type="password"id="pass" class="int" value maxlength="20" autocomplete="off"
						name="pass" placeholder="비밀번호">
					</span>
				</div>

				<div class="login_button1" id="login_button1">
					<a href="#" class="btn cyan block1" id="login_button1"
						style="width: 100%; padding: 5px 10px;">Login</a>
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
				<div class="login_button2" onclick="login()">
					<a href="sign.bbs" class="btn cyan block1"
						style="width: 100%; padding: 5px 10px;">Sign up</a>
				</div>

				<div class="back_button1" onclick="back1()">
					<a href="main.bbs" class="btn cyan block1"
						style="width: 100%; padding: 5px 10px;">BACK</a>
				</div>

			</div>
		</form>
	</div>
	<script type="text/javascript">
	window.onload = function() {
	    document.getElementById('login_button1').onclick = function() {
	        document.getElementById('loginForm').submit();
	        return false;
	    };
	};
	</script>
</body>
</html>