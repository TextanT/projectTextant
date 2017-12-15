<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("N0B6XXo2rqhysUglG48w",
				"http://localhost:800/textant/api/naverCallbackApi");
		// 접근 토큰 값 출력
// 		alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회 
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			
			document.getElementById('id').value = naver_id_login.getProfileData('id'); 
			document.getElementById('email').value = naver_id_login.getProfileData('email'); 
			document.getElementById('age').value = naver_id_login.getProfileData('age'); 
			document.getElementById('name').value = naver_id_login.getProfileData('name'); 
			document.getElementById('gender').value = naver_id_login.getProfileData('gender'); 
			document.getElementById('nickname').value = naver_id_login.getProfileData('nickname'); 
				document.getElementById('naver_mit').submit();
// 			location.href="naverData.text?id="+document.getElementById('id').value+"&email="+naver_id_login.getProfileData('email')
// 					+"&age="+naver_id_login.getProfileData('age')+"&name="+naver_id_login.getProfileData('name')+"&gender="+naver_id_login.getProfileData('gender')
// 					+"&nickName="+naver_id_login.getProfileData('nickname');
// 			location.href="naverData.text?id="+document.getElementById('id').value
			return false;


		}
	</script>
	<form action="naverData.text" id="naver_mit" method="post">
		<input type="hidden" name="userId" class="id" id="id" >
		<input type="hidden" name="email" class="email" id="email">
		<input type="hidden" name="nickName" class="nickname" id="nickname">
		<input type="hidden" name="age" class="age" id="age">
		<input type="hidden" name="gender" class="gender" id="gender">
		<input type="hidden" name="realName" class="realname" id="name">
	</form>
</body>
</html>