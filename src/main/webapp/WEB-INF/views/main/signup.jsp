<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
body {
	background-image: url(resources/background_img/book-2572101_1920.jpg);
	background-position: 50% 0%;
	background-size: 100%;
	background-repeat: no-repeat;
	position: fixed;
	overflow: hidden;
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

.signupDiv {
	border-radius: 1em;
	border-top-left-radius: 0.1em;
	border-top-right-radius: 0.1em;
	border-bottom-left-radius: 0.1em;
	border-bottom-right-radius: 0.1em;
	position: absolute;
	top: 80%;
	left: 48%;
	width: 300px;
	height: 600px;
	margin: 50px 0 0 0px;
	margin-top: 100px;
	/*            padding-left:40%;*/
}

.sign_button1 {
	position: absolute;
	top: 80%;
	left: 12%;
	width: 70%;
}

.back_button2 {
	position: absolute;
	top: 90%;
	left: 12%;
	width: 70%;
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
.idDivc:first-child {
	border-bottom: none;
}

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
	/*            border-top: none;*/
	border: 1px solid #D8D8D8;
}

.nameDivc {
	/*            border-top: none;*/
	border: 1px solid #D8D8D8;
}

.emailDivc {
	/*            border-top: none;*/
	border: 1px solid #D8D8D8;
}

#PassDiv {
	border-bottom: none;
}

#nameDiv {
	border-bottom: none;
}
/*        Passcheck Div*/
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
/*        name Div */
.nameDivc {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 11px 11px 11px 13px;
	background: #fff;
}

.name_sp.int_name {
	background-position: 100% -57px;
}

.name_sp {
	position: relative;
	display: block;
	height: 27px;
	background: #fff
		url(https://static.nid.naver.com/images/ui/join/t_ico_join3_2x_20170906.png)
		100% 0 no-repeat;
	-webkit-background-size: 97px 900px;
	background-size: 97px 900px;
}

.nameDivc .int {
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
/*        e-mail Div*/
.emailDivc {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 11px 11px 11px 13px;
	background: #fff;
}

.email_sp.int_email {
	background-position: 100% -57px;
}

.email_sp {
	position: relative;
	display: block;
	height: 27px;
	background: #fff
		url(https://static.nid.naver.com/images/ui/join/t_ico_join3_2x_20170906.png)
		100% 0 no-repeat;
	-webkit-background-size: 97px 900px;
	background-size: 97px 900px;
}

.emailDivc .int {
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
/* 데모페이지 설정 */
.wrap {
	/*            padding: 20px 30px;*/
	padding-top: 20px;
	/*            padding-left: 5px;*/
}
/* 인풋 */
input[type=radio] {
	display: none;
}

.radio-label {
	display: inline-block;
	width: 105px;
	height: 30px;
	padding: 0 20px;
	border: 1px solid rgba(0, 0, 0, 0.08);
	/*            margin-right: 20px;*/
	background: #ddd;
	line-height: 30px;
	cursor: pointer;
	-webkit-transition: all 0.3s ease-out;
	-moz-transition: all 0.3s ease-out;
	-ms-transition: all 0.3s ease-out;
	-o-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
	text-align: center;
}

.radio-label i {
	margin-right: 10px;
	opacity: 0;
	-webkit-transition: opacity 0.3s ease-out;
	-moz-transition: opacity 0.3s ease-out;
	-ms-transition: opacity 0.3s ease-out;
	-o-transition: opacity 0.3s ease-out;
	transition: opacity 0.3s ease-out;
}

.radio:checked+.radio-label {
	background: rgba(4, 120, 193, 0.1);
}

.radio:checked+.radio-label i {
	opacity: 1;
}

.radio+.radio-label span {
	display: inline-block;
	font-size: 13px;
	-webkit-transition: all 0.3s ease-out;
	-moz-transition: all 0.3s ease-out;
	-ms-transition: all 0.3s ease-out;
	-o-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
	-webkit-transform: translateX(-13px);
	-moz-transform: translateX(-13px);
	-ms-transform: translateX(-13px);
	-o-transform: translateX(-13px);
	transform: translateX(-13px);
}

.radio:checked+.radio-label span {
	-webkit-transform: translateX(0);
	-moz-transform: translateX(0);
	-ms-transform: translateX(0);
	-o-transform: translateX(0);
	transform: translateX(0);
}

.main_logo {
	padding-left: 280px;
	padding-top: 20px;
}

.backk {
	width: 200px;
	height: 40px;
	background-color: #9f793e;
	padding: 13px 125px;
	border: 1px solid #9f793e;
}

.backk:hover {
	background: none;
	transition: 0.5s;
	border: 1px solid white;
}

.loginn {
	width: 200px;
	height: 40px;
	background-color: #9f793e;
	padding: 13px 126px;
	border: 1px solid #9f793e;
}

.loginn:hover {
	background: none;
	transition: 0.5s;
	border: 1px solid white;
}

.login_box {
	position: absolute;
	top: 70%;
	left: 1.5%;
	width: 20%;
}

.back_box {
	position: absolute;
	top: 85%;
	left: 1.5%;
	width: 20%;
}

a {
	text-decoration: none;
	color: white;
	text-align: center;
}

ul li {
	list-style-type: none;
}

ul li label {
	width: 70px;
	float: left;
}

#idCheckStatus {
	height: 28px;
	margin-bottom: 16px;
}

#status {
	height: 28px;
	margin-bottom: 16px;
}
.aass{
	display: none;
}
</style>
</head>
<body>
	<form action="sign.bbs" method="post" id="signForm" name="joinForm">



		<div class="main_logo">
			<img src="resources/icon_img/fristLogo2.png" class="logo">
		</div>

		<div class="signupDiv">
			<div id="idDiv" class="idDivc">
				<span class="id_sp int_id"> <input type="text" id="id"
					class="int" value maxlength="20" autocomplete="off"
					placeholder="아이디" name="id">
				</span>
			</div>

			<div id="idCheckStatus"></div>

			<div id="PassDiv" class="PassDivc">
				<span class="pass_sp int_pass"> <input type="password"
					id="pass" class="int" value maxlength="20" autocomplete="off"
					placeholder="비밀번호" onblur="checkvalue()" name="pass">
				</span>
			</div>
			<div id="PasscDiv" class="PasscDivc">
				<span class="passc_sp int_passc"> <input type="password"
					id="passcheck" class="int" value maxlength="20" autocomplete="off"
					placeholder="비밀번호 확인" onblur="checkvalue()">
				</span>
			</div>
			<div id="status"></div>
			<!-- 			<div id="status" -->
			<!-- 				style="border: 0; font size: 10px 굴림; width: 160px; height: 20px;background:none;" -->
			<!-- 				readonly onfocus="this.blur();" value=""> -->
			<!-- 			</div> -->
			<div id="nameDiv" class="nameDivc">
				<span class="name_sp int_name"> <input type="text" id="name"
					class="int" value maxlength="20" autocomplete="off"
					placeholder="이름" name="name">
				</span>
			</div>
			<div id="emailDiv" class="emailDivc">
				<span class="email_sp int_email"> <input type="text"
					id="email" class="int" value maxlength="20" autocomplete="off"
					placeholder="E-Mail" name="mail">
				</span>
			</div>

			<div class="wrap">
				<input name="radio" type="radio" id="radio0" class="radio"
					onclick="gender1()"> <label for="radio0"
					class="radio-label"> <i class="fa fa-check"></i> <span>남자</span>
				</label> 
				
				<input type="text" name="gender" id="gender" hidden="hidden">

				<input name="radio" type="radio" id="radio1" class="radio"
					onclick="gender2()"> <label for="radio1"
					class="radio-label"> <i class="fa fa-check"></i> <span>여자</span>
				</label>

			</div>
			<div class="btnbox">
				<div class="login_box" onclick="submi()">
					<a href="" class="loginn" style="width: 100%;" id="btn1">
						SIGN </a>
				</div>

				<div class="back_box" onclick="">
					<a href="main.bbs" class="backk" style="width: 10%;" id="btn2"> BACK </a>
<!-- 						onclick="javascript:history.back(-1)" -->
				</div>
				
<!-- 				<button type="submit" class="aass" id="sasd"></button> -->

			</div>
		</div>
	</form>

<script type="text/javascript">

function submi() {
	var form = document.joinForm;
	
	form.submit();
	

};

</script>
	<script>
		function gender1() {

			// 			alert("남자");
			document.getElementById("gender").value = "1";

		};
		function gender2() {

			alert("여자");
			document.getElementById("gender").value = "0";

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
			$("#id").on(
					"blur",
					function() {
						$.ajax({
							url : "joinIdCheck.bbs",
							data : {
								inputId : $("#id").val()
							},
							success : function(data) {
								let html;
								// 								alert(data);
								if ($("#id").val() != "") {
									if (data == 1) {
										html = "<p>사용가능한 아이디입니다</p>";
										$("#idCheckStatus").html(html).css(
												"color", "highlight");
										$("#idCheckStatus").html(html).css(
												"font-size", "12px");
										$("#idCheckStatus").html(html).css(
												"height", "16.3px");
										
										;
									} else if (data == 0) {
										html = "<p>중복된 아이디입니다</p>";
										$("#idCheckStatus").html(html).css(
												"color", "red");
										$("#idCheckStatus").html(html).css(
												"font-size", "12px");
										$("#idCheckStatus").html(html).css(
												"height", "16.3px");
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

		function signUpCheck() {
			var form = document.joinForm;
			if (!form['id'].value) {
				alert("아이디를 입력해주세요.");
				form['id'].focus();
				return;
			} else if (!form['pass'].value) {
				alert("비밀번호를 입력해주세요.")
				form['pass'].focus;
				return;
			} else {

			}
			//     	form.submit();
			if (form['id'].value.indexOf(" ") >= 0) {
				alert("아이디에 공백을 사용할 수 없습니다.")
				form['id'].focus()
				form['id'].select()
				return false;
			}
			if (form['id'].value.length<4 || form['id'].value.length>12) {
				alert("아이디를 4~12자까지 입력해주세요.")
				form['id'].focus()
				form['id'].select()
				return false;
			}
			for (i = 0; i < form['id'].value.length; i++) {
				ch = form['id'].value.charAt(i)
				if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')
						&& !(ch >= 'A' && ch <= 'Z')) {
					alert("아이디는 대소문자, 숫자만 입력가능합니다.")
					form['id'].focus()
					form['id'].select()
					return false;
				}
			}

			if (form['pass'].value == form['id'].value) {
				alert("아이디와 비밀번호가 같습니다.")
				form['pass'].focus()
				return false;
			}
			form.submit();
		}
		
		function submi(){
			document.joinForm.submit();
		}
	</script>

	<script type="text/javascript">
		// checkvalue 기능
		function checkvalue() {
			let html;
			// a 텍스트 필드와 b 텍스트 필드 중 둘다 값이 있을 때
			if (joinForm.pass.value && joinForm.passcheck.value) {

				// 두 필드의 값이 서로 다를 때
				if (joinForm.pass.value != joinForm.passcheck.value) {

					html = "<p>일치하지않습니다.</p>";
					$("#status").html(html).css("color", "red");
					$("#status").html(html).css("font-size", "12px");
					$("#status").html(html).css("height", "16.3px");

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
		// 	$(document).ready(function () {
		//		if (form['pass'].value == form['passcheck'].value) {
		//			form['passcheck_messge2'].style.display = "block";
		//			form['passcheck_messge1'].style.display = "none";
		//		} else {
		//			form['passcheck_messge1'].style.display = "block";
		//			form['passcheck_messge2'].style.display = "none";
		//		}
		//	})
	</script>



</body>
</html>