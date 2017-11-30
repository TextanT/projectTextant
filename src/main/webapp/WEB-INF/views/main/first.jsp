<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        
        .js_close {
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
        
        .js_close:hover {
            background-color: #a8a8a8;
        }
        
        .js_close:active {
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

    </style>
</head>

<body>
	<div class="ex">
		<span>Textant에서 책을 읽으며 여러 사람과 소통해보세요.</span>
	</div>
	<!-- 모달창 -->
	<div id="modal">
		<form action="sign.text" method="post" id="signForm">
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
					placeholder="별명" name="name">
				</span>
			</div>
			<div class="wrap">
				<input name="radio" type="radio" id="radio0" class="radio"
					onclick="gender1()"> <label for="radio0"
					class="radio-label"> <i class="fa fa-check"></i> <span>남자</span>
				</label> 
				
				<input type="text" name="jender" id="jender">

				<input name="radio" type="radio" id="radio1" class="radio"
					onclick="gender2()"> <label for="radio1"
					class="radio-label"> <i class="fa fa-check"></i> <span>여자</span>
				</label>
			</div>
			<div class="signUp_div" id="sign_mit">
				<a href="#" class="signUp_btn">화원가입</a>
			</div>
			<div class="exit_div">
				<a href="#" class="js_close">돌아가기</a>
			</div>


		</form>

	</div>

	<div class="box1">
		<form action="login.text" method="post" id="loginForm">
			<div id="box1_Id" class="box1_Id">
				<span class=""> <input type="text" id="id" class="int" value
					maxlength="20" complete="off" placeholder="아이디" name="id">
				</span>
			</div>
			<div id="box1_pass" class="box1_pass">
				<span class=""> <input type="password" id="pass" class="int"
					value maxlength="20" complete="off" placeholder="비밀번호" name="pass">
				</span>
			</div>
			<button type="submit" class="aass" id="sasd" style="display: none;"></button>
			<div class="login_div" >
				<a href="#" class="login_btn"id="login_mit">로그인</a>
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
</body>
</html>