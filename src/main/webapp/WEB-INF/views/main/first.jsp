<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="/textant/resources/css/log.css" type="text/css"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

body {
	background-image: url(/textant/resources/background_img/fritsPage2.jpg);
	background-position: center center;
	background-size: cover;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-position: center center;
}

@media screen and (max-width:1920px) {
	body {
		background-image: url(/textant/resources/background_img/fritsPage2.jpg);
		background-position: center center;
		background-size: cover;
		background-attachment: fixed;
		background-repeat: no-repeat;
		background-position: center center;
	}
}

@media screen and (max-width:1440px) {
	body {
		background-image: url(/textant/resources/background_img/fritsPage2.jpg);
		background-position: center center;
		background-size: cover;
		background-attachment: fixed;
		background-repeat: no-repeat;
		background-position: center center;
	}
}

@media screen and (max-width:1024px) {
	body {
		background-image: url(/textant/resources/background_img/fritsPage2.jpg);
		background-position: center center;
		background-size: cover;
		background-attachment: fixed;
		background-repeat: no-repeat;
		background-position: center center;
	}
}

.box1 {
	text-align: center;
}

.login_btn {
	background-color: #d9d9d9;
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-bottom-right-radius: 0px;
	border-bottom-left-radius: 0px;
	text-indent: 0px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	color: #666666;
	font-family: Courier New;
	font-size: 13px;
	font-weight: bold;
	font-style: normal;
	height: 34px;
	line-height: 34px;
	width: 150px;
	text-decoration: none;
	text-align: center;
}

.login_btn:hover {
	background-color: #a8a8a8;
}

.login_btn:active {
	position: relative;
	top: 1px;
}

.sign_btn {
	background-color: #d9d9d9;
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-bottom-right-radius: 0px;
	border-bottom-left-radius: 0px;
	text-indent: 0px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	color: #666666;
	font-family: Courier New;
	font-size: 13px;
	font-weight: bold;
	font-style: normal;
	height: 34px;
	line-height: 34px;
	width: 150px;
	text-decoration: none;
	text-align: center;
}

.sign_btn:hover {
	background-color: #a8a8a8;
}

.sign_btn:active {
	position: relative;
	top: 1px;
}

.guest_btn {
	background-color: #d9d9d9;
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-bottom-right-radius: 0px;
	border-bottom-left-radius: 0px;
	text-indent: 0px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	color: #666666;
	font-family: Courier New;
	font-size: 13px;
	font-weight: bold;
	font-style: normal;
	height: 34px;
	line-height: 34px;
	width: 150px;
	text-decoration: none;
	text-align: center;
}

.guest_btn:hover {
	background-color: #a8a8a8;
}

.guest_btn:active {
	position: relative;
	top: 1px;
}

.signUp_btn {
	background-color: #d9d9d9;
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-bottom-right-radius: 0px;
	border-bottom-left-radius: 0px;
	text-indent: 0px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	color: #666666;
	font-family: Courier New;
	font-size: 13px;
	font-weight: bold;
	font-style: normal;
	height: 34px;
	line-height: 34px;
	width: 230px;
	text-decoration: none;
	text-align: center;
}

.signUp_btn:hover {
	background-color: #a8a8a8;
}

.signUp_btn:active {
	position: relative;
	top: 1px;
}

#exit {
	background-color: #d9d9d9;
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-bottom-right-radius: 0px;
	border-bottom-left-radius: 0px;
	text-indent: 0px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	color: #666666;
	font-family: Courier New;
	font-size: 13px;
	font-weight: bold;
	font-style: normal;
	height: 34px;
	line-height: 34px;
	width: 230px;
	text-decoration: none;
	text-align: center;
}

#exit:hover {
	background-color: #a8a8a8;
}

#exit:active {
	position: relative;
	top: 1px;
}

.login_div {
	padding-top: 2%;
	padding-left: 35%;
}

.sign_div {
	padding-top: 2%;
	padding-left: 35%;
}

.guest_div {
	padding-top: 2%;
	padding-left: 35%;
}

.signUp_div {
	padding-top: 140%;
	padding-left: 17%;
}

.exit_div {
	padding-top: 3%;
	padding-left: 17%;
}

.box1_Id {
	background: #fff;
	border: 1px solid #D8D8D8;
	/*            width: 100px;*/
	padding: 10px;
	margin-left: 55%;
	margin-right: 20%;
	margin-top: 13%;
}

.box1_Id .int {
	font-size: 15px;
	z-index: 10;
	width: 100%;
	height: 16px;
	border: none;
	background: #fff;
}

.box1_pass {
	background: #fff;
	border: 1px solid #D8D8D8;
	/* width: 100px;*/
	padding: 10px;
	margin-left: 55%;
	margin-right: 20%;
	margin-top: 3%;
}

.box1_pass .int {
	font-size: 15px;
	z-index: 10;
	width: 100%;
	height: 16px;
	border: none;
	background: #fff;
}

#idCheckStatus {
	position: absolute;
	top: 17%;
}

#status {
	position: absolute;
	top: 37%;
}

.exit2_div {
	position: absolute;
	top: 1px;
	right: 1px;
}
</style>
</head>

<body>
	<c:if test="${id!=null}">
		<c:redirect url="/main.text"></c:redirect>
	</c:if>
	<div class="ex">
		<span>Textant에서 책을 읽으며 여러 사람과 소통해보세요.</span>
	</div>
	<!-- 모달창 -->
	<div id="modal">
		<form action="sign.text" method="post" id="signForm">
			<button type="submit" class="aass" id="sasd"></button>

			<div id="idDiv" class="idDivc">
				<span class="id_sp int_id"> <input type="text" id="signid"
					class="int" value maxlength="20" autocomplete="off"
					placeholder="아이디" name="userId">
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
					id="passcheck" class="int" value maxlength="20" autocomplete="off"
					placeholder="비밀번호확인" onblur="checkvalue()">
				</span>
			</div>

			<div id="status"></div>

			<div id="mailDiv" class="mailDivc">
				<span class="mail_sp int_pass"> <input type="email"
					id="email" class="int" value maxlength="20" autocomplete="off"
					placeholder="E-mail" name="email">
				</span>
			</div>
			<div id="nicknameDiv" class="nicknameDivc">
				<span class="nickname_sp int_pass"> <input type="text"
					id="nickname" class="int" value maxlength="20" autocomplete="off"
					placeholder="별명" name="nickName">
				</span>
			</div>
			<div class="wrap">
				<input name="radio" type="radio" id="radio0" class="radio"
					onclick="gender1()"> <label for="radio0"
					class="radio-label"> <i class="fa fa-check"></i> <span>남자</span>
				</label> <input type="text" name="jender" id="jender" hidden="hidden">

				<input name="radio" type="radio" id="radio1" class="radio"
					onclick="gender2()"> <label for="radio1"
					class="radio-label"> <i class="fa fa-check"></i> <span>여자</span>
				</label>
			</div>

			<div class="signUp_div">
				<a href="#" class="signUp_btn" id="sign_mit">화원가입</a>
			</div>
			<div class="exit_div">
				<a href="#" class="js_close" id="exit">돌아가기</a>
			</div>

		</form>
		<div class="exit2_div">
			<img src="/textant/resources/icon_img/exit3.jpg" class="js_close"
				style="cursor: pointer;">
		</div>

	</div>
	<div class="fristG">
		<img src="/textant/resources/img/fritsg.gif" style="padding-left: 280px;padding-top:163px;
		position: absolute;">
	</div>
	<div class="box1">
		<form action="login.text" method="post" id="loginForm">
			<div id="box1_Id" class="box1_Id">
				<span class=""> <input type="text" id="loginid" class="int"
					value maxlength="20" complete="off" placeholder="아이디" name="userId">
				</span>
			</div>
			<div id="box1_pass" class="box1_pass">
				<span class=""> <input type="password" id="pass" class="int"
					value maxlength="20" complete="off" placeholder="비밀번호" name="pass">
				</span>
			</div>
			<button type="submit" class="aass" id="sasd" style="display: none;"></button>
			<div class="login_div">
				<a href="#" class="login_btn" id="login_mit">로그인</a>
			</div>
			<div class="sign_div">
				<a href="#" class="sign_btn" id="modal_open">회원가입</a>
			</div>
			<div class="guest_div">
				<a href="guest.text" class="guest_btn">게스트</a>
			</div>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"></script>
	<script type="text/javascript"
		src="/textant/resources/js/Example.Modal.js"></script>
	<script type="text/javascript" src="/textant/resources/js/modal.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			document.getElementById('login_mit').onclick = function() {
				document.getElementById('loginForm').submit();
				return false;
			};
			document.getElementById('sign_mit').onclick = function() {
				document.getElementById('signForm').submit();
				return false;
			};
		};
	</script>
	<script>
		function gender1() {

			// 			alert("남자");
			document.getElementById("jender").value = "1";

		};
		function gender2() {

			alert("여자");
			document.getElementById("jender").value = "0";

		};
	</script>
	<script language="javascript">
		$.ajaxSetup({
			type : "POST",
			async : true,
			dataType : "json",
			error : function(xhr) {
				alert("error html = " + xhr.statusText);
			}
		});

		$(function() {
			$("#signid").on(
					"blur",
					function() {
						$.ajax({
							url : "joinIdCheck.text",
							data : {
								inputId : $("#signid").val()
							},
							success : function(data) {
								let html;
								// 								alert(data);
								if ($("#signid").val() != "") {
									if (data == 1) {
										html = "<p>사용가능한 아이디입니다</p>";
										$("#idCheckStatus").html(html).css(
												"color", "highlight");
										$("#idCheckStatus").html(html).css(
												"font-size", "12px");
										$("#idCheckStatus").html(html).css(
												"height", "16.3px");
										$("#idCheckStatus").html(html).css(
												"left", "16%");

										;
									} else if (data == 0) {
										html = "<p>중복된 아이디입니다</p>";
										$("#idCheckStatus").html(html).css(
												"color", "red");
										$("#idCheckStatus").html(html).css(
												"font-size", "12px");
										$("#idCheckStatus").html(html).css(
												"height", "16.3px");
										$("#idCheckStatus").html(html).css(
												"left", "16%");
									}

								} else {
									html = "<p>아이디를 입력하세요</p>";
									$("#idCheckStatus").html(html).css("color",
											"red");
									$("#idCheckStatus").html(html).css(
											"font-size", "13px");
									$("#idCheckStatus").html(html).css(
											"height", "16.3px");
								}
							}
						});
					})
		});
	</script>
	<script>
		// checkvalue 기능
		function checkvalue() {
			let html;
			// a 텍스트 필드와 b 텍스트 필드 중 둘다 값이 있을 때
			if (signForm.pass.value && signForm.passcheck.value) {

				// 두 필드의 값이 서로 다를 때
				if (signForm.pass.value != signForm.passcheck.value) {

					html = "<p>일치하지않습니다.</p>";
					$("#status").html(html).css("color", "red");
					$("#status").html(html).css("font-size", "12px");
					$("#status").html(html).css("height", "16.3px");
					$("#status").html(html).css("left", "16%");

					// status 필드에 일치하지 않는다는 문장 출력
					// 					joinForm.status.value = "일치하지 않습니다";

					// 그에 맞게 길이 수정
					// 					joinForm.status.style.width = "120";
					// 					joinForm.status.style.color = "red";

					// 두 필드의 값이 동일 할 때
				} else {

					html = "<p>일치합니다.</p>";
					$("#status").html(html).css("color", "highlight");
					$("#status").html(html).css("font-size", "12px");
					$("#status").html(html).css("height", "16.3px");
					$("#status").html(html).css("left", "16%");

					// status 필드에 일치한다는 문장 출력
					// 					joinForm.status.value = "일치합니다";

					// 					joinForm.status.style.color = "highlight";

					// 역시 그에 맞게 길이 수정
					// 					joinForm.status.style.width = "83";

				}

				// a 텍스트 필드와 b 텍스트 필드 두중하나라도 값이 없을 때
			} else {

				// 아무것도 입력이 안 되어 있으므로 비밀번호를 입력해 달라는 메세지를 status 필드에 출력 함
				joinForm.status.value = "비밀번호를 입력해 주세요";

				// 그에 맞게 길이 수정
				joinForm.status.style.width = "160";

				joinForm.status.style.color = "red";
			}
			if (joinForm.passc.value == null) {

			}
			form.submit();

		}
	</script>
</body>
</html>