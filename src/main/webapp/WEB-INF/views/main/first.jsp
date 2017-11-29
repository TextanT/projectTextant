<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/textant/resources/css/login.css" type="text/css"
	rel="stylesheet">
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
	height: 600px;
}

.inner {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

.centered {
	position: relative;
	display: inline-block;
	width: 50%;
	padding: 1em;
	/*            background: orange;*/
	color: white;
}

.login_box {
	position: absolute;
	left: 40%;
	margin-top: -10%;
}

.guest_box {
	position: absolute;
	left: 40%;
	margin-top: 8%;
}

.sign_box {
	position: absolute;
	left: 40%;
	margin-top: -1%;
}

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
</style>
</head>

<body>
	<!-- 모달창 -->
	<div id="modal">
		<form action="login.text" method="post" id="loginForm">
			<button type="submit" class="aass" id="sasd"></button>

			<div id="idDiv" class="idDivc">
				<span class="id_sp int_id"> <input type="text" id="id"
					class="int" value maxlength="20" autocomplete="off"
					placeholder="아이디" name="id">
				</span>
			</div>
			<div id="idCheckStatus"></div>
			<div style="height: 15px;"></div>

			<div id="PassDiv" class="PassDivc">
				<span class="pass_sp int_pass"> <input type="password"
					id="pass" class="int" value maxlength="20" autocomplete="off"
					placeholder="비밀번호" name="pass">
				</span>
			</div>
			<div id="PasscDiv" class="PasscDivc">
				<span class="passc_sp int_pass"> <input type="password"
					id="pass" class="int" value maxlength="20" autocomplete="off"
					placeholder="비밀번호확인">
				</span>
			</div>

			<div id="status"></div>
			<div id="mailDiv" class="mailDivc">
				<span class="mail_sp int_pass"> <input type="email" id="mail"
					class="int" value maxlength="20" autocomplete="off"
					placeholder="E-mail" name="mail">
				</span>
			</div>
			<div id="nicknameDiv" class="nicknameDivc">
				<span class="nickname_sp int_pass"> <input type="text"
					id="nickname" class="int" value maxlength="20" autocomplete="off"
					placeholder="별명" name="nickname">
				</span>
			</div>
			<div class="wrap">
				<input name="radio" type="radio" id="radio0" class="radio"
					onclick="gender1()"> <label for="radio0"
					class="radio-label"> <i class="fa fa-check"></i> <span>남자</span>
				</label> <input type="text" name="gender" id="gender" hidden="hidden">

				<input name="radio" type="radio" id="radio1" class="radio"
					onclick="gender2()"> <label for="radio1"
					class="radio-label"> <i class="fa fa-check"></i> <span>여자</span>
				</label>

			</div>


			<div class="sign_div" onclick="login()">
				<a href="#" class="signa" style="width: 80%;"> <span>SING</span></a>
			</div>

			<div class="exit_div" onclick="back()">
				<a href="#" class="exia" style="width: 80%;"> <span>EXIT</span></a>
			</div>
		</form>
		<a href="#" class="js_close"> <img src="icon_img/exit2.jpg"
			style="position: absolute; top: 1px; right: 1px;">
		</a>
	</div>
	<div class="container">
		<div class="logo">
			<img src="/textant/resources/icon_img/fristLogo2.png" class="logoimg">
		</div>

		<div class="outer">

			<div class="inner">




				<div class="login_box" onclick="login()">
					<a href="login.text" class="loginn" style="width: 100%;" id="btn1">
						<span class="btn1_text">LOGIN</span>
					</a>
				</div>

				<div class="sign_box" onclick="sign()" id="modal_open">
					<a href="#" class="signn" style="width: 100%;" id="btn3"> <span
						class="btn1_text">SIGN</span>
					</a>
				</div>

				<div class="guest_box" onclick="back()">
					<a href="guest.text" class="guestt" style="width: 100%;" id="btn2">
						<span class="btn2_text">GUEST</span>
					</a>
				</div>

				<div class="centered"></div>
			</div>


		</div>
	</div>

	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"></script>
	<script type="text/javascript"
		src="/textant/resources/js/Example.Modal.js"></script>
	<script type="text/javascript" src="/textant/resources/js/modal.js"></script>
</body>
</html>