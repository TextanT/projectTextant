<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
  <!-- 네이버아이디로로그인 버튼 노출 영역 -->
<!--   <div id="naver_id_login"></div>  -->
  <a href="https://nid.naver.com/oauth2.0/authorize?response_type=token&client_id=t7KPh5ern4uRP6_bCdxW&redirect_uri=http%3A%2F%2F210.119.12.233%2Ftextant%2Fcallback.text&state=289454a7-bb9b-4d08-b9b2-873352712c8d" style="position:absolute; left:20%;top:33%;">
  <img src="/textant/resources/icon_img/naver_login_btn.png"id="naver_id_login">
  </a> 
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("t7KPh5ern4uRP6_bCdxW", "http://localhost/textant/callback.text");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost/textant/naverlogin.text");
  	naver_id_login.setState(state);
//   	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  	
  	
  </script>
</html>