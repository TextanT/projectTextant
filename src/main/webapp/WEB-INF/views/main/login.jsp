<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body {
	background-image:
		url(/textant/resources/background_img/book-2572101_1920.jpg);
	/*            background-image: url(slick-1.8.0/slick-1.8.0/slick/1300.png);*/
	background-position: center center;
	background-size: cover;
	background-attachment: fixed;
	background-repeat: no-repeat;
	/*            position: fixed;*/
	overflow: hidden;
	word-break: break-word;
}

.container {
	width: 55%;
	height: 55%;
	margin: 40px auto;
	/*            background-color: red;*/
}

.outer {
	display: table;
	width: 100%;
	height: 100%;
}

.inner {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	width: 100%;
}

.centered {
	position: relative;
	display: inline-block;
	width: 50%;
	padding: 1em;
	/*            background: orange;*/
	color: white;
}

.idDivc {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 11px 11px 11px 13px;
	background: #fff;
	/*            width: 340px;*/
	/*            margin-left: 25%;*/
	position: absolute;
	top: 30%;
	left: 38%;
	width: 24%;
}

.id_sp.int_id {
	/*            background-position: 100% -57px;*/
	
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
	border: none;
	background: #fff;
	apperance: none;
	-webkit-apperance: none;
}

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

.PassDivc:first-child {
	border-bottom: none;
}

.PassDivc {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 11px 11px 11px 13px;
	background: #fff;
	position: absolute;
	top: 40%;
	left: 38%;
	width: 24%;
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

.header_icon {
	position: absolute;
	top: 48%;
	left: 37.5%;
	width: 25%;
}

.header_icon {
	opacity: 1;
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

.signn {
	width: 200px;
	height: 40px;
	background-color: #9f793e;
	padding: 13px 106px;
	border: 1px solid #9f793e;
}

.signn:hover {
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

.login_box {
	position: absolute;
	top: 55%;
	left: 40%;
	width: 20%;
}

.sign_box {
	position: absolute;
	top: 65%;
	left: 40%;
	width: 20%;
}

a {
	text-decoration: none;
	color: white;
	text-align: center;
}

#facebook:hover {
	opacity: 0.5;
}

#naver:hover {
	opacity: 0.5;
}

#kakao:hover {
	opacity: 0.5;
}

#google:hover {
	opacity: 0.5;
}
.aass{
	display:none;
}
</style>
</head>

<body>
	<div class="container">
		<img src="/textant/resources/icon_img/fristLogo2.png" class="outer">
		<div class="outer">
			<form action="login.text" method="post" id="loginForm">
			<button type="submit" class="aass" id="sasd"></button>
				<div class="inner">

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

					<div class="header_icon">
						<a href="#" class="header_tr_td_a" id="facebook"> <img
							src="/textant/resources/icon_img/facebook.png">
						</a> <a href="#" class="header_tr_td_a" id="naver"> <img
							src="/textant/resources/icon_img/naver.jpg">
						</a> <a href="#" class="header_tr_td_a" id="kakao"> <img
							src="/textant/resources/icon_img/kakao.jpg">
						</a> <a href="#" class="header_tr_td_a" id="google"> <img
							src="/textant/resources/icon_img/google.jpg">
						</a>
					</div>
					<div class="login_box" onclick="login()">
						<a href="#" class="loginn" style="width: 100%;" id="btn1"> <span
							class="btn1_text">LOGIN</span>
						</a>
					</div>

					<div class="sign_box" onclick="back()">
						<a href="sign.text" class="signn" style="width: 100%;" id="btn2"> <span
							class="btn2_text">SIGN</span>
						</a>
					</div>

					<div class="centered"></div>

				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		window.onload = function() {
			document.getElementById('btn1').onclick = function() {
				document.getElementById('loginForm').submit();
				return false;
			};
		};
	</script>
</body>
</html>