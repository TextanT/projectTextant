<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/textant/resources/css/sign_modal.css" type="text/css"
	rel="stylesheet">
<link href="/textant/resources/css/log.css" type="text/css"
	rel="stylesheet">
<link href="/textant/resources/css/modal2.css" type="text/css"
	rel="stylesheet">
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
	<!-- 모달창 -->
	<div id="modal_log">
		<form action="login.text" method="post" id="loginForm">
			<button type="submit" class="aass" id="sasd"></button>

			<div id="idDiv" class="idDivc">
				<span class="id_sp int_id"> <input type="text" class="int"
					value maxlength="20" autocomplete="off" placeholder="아이디"
					name="userId" id="mologinId">
				</span>
			</div>

			<div style="height: 15px;"></div>

			<div id="PassDiv" class="PassDivc">
				<span class="pass_sp int_pass"> <input type="password"
					id="pass" class="int" value maxlength="20" autocomplete="off"
					placeholder="비밀번호" name="pass" id="mologinPass">
				</span>
			</div>
			<div class="apiLogo">
<!-- 			<a href="naverlogin.text" style="position:absolute; left:19%;top:33%;"><img src="/textant/resources/icon_img/naver_width_bar.png"></a> -->
<!-- 			<a href="kakao.text" style="position:absolute; left:19%;top:40%;"><img src="/textant/resources/icon_img/kakao_width_bar.png"></a> -->
		
		<%@include file="api/naverApi.jsp" %>
		<%@include file="api/kakaoApi.jsp" %>
			</div>
			<div class="login_div">
				<a href="#" class="login_btn" id="login_mit">로그인</a>
			</div>
			<div class="find_div">
				<a href="find.text" id="find">아이디/비밀번호 찾기</a>
			</div>
			<div class="exit_div">
				<a href="#" class="js_close" id="exit">돌아가기</a>
			</div>

		</form>
		<div class="exit2_div">
			<img src="/textant/resources/icon_img/exit3.jpg" class="js_close"
				style="cursor: pointer;" onclick="modalemp()">
		</div>

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
				<span class="mail_sp int_pass"> <input type="email" id="mail"
					class="int" value maxlength="20" autocomplete="off"
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
</body>
</html>