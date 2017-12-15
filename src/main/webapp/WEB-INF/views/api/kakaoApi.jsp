<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>API Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
	<a id="kakao-login-btn" href="javascript:loginWithKakao()" style="position:absolute; left:19%;top:40%;"><img src="/textant/resources/icon_img/kakao_width_bar.png"></a>
	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>       
	<script type='text/javascript'>
	//<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('6eb547f54e58a452fbc79d9009d3a12f');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
        	var refreshToken = Kakao.Auth.getRefreshToken(authObj);
          alert(JSON.stringify(authObj));
          alert(refreshToken);
          location.href="/textant/main.text";
        },
        fail: function(err) {
          alert(JSON.stringify(err));
          location.href="/textant/main.text";
        }
      });
    };
    
  //]]>
// 		//<![CDATA[
// 		// 사용할 앱의 JavaScript 키를 설정해 주세요.
// 		Kakao.init('6eb547f54e58a452fbc79d9009d3a12f');
// 		// 카카오 로그인 버튼을 생성합니다.
// 		Kakao.Auth.createLoginButton({
// 			container : '#kakao-login-btn',
// 			success : function(authObj) {
// 				// 로그인 성공시, API를 호출합니다.
// 				Kakao.API.request({
// 					url : '/v1/user/me',
// 					success : function(res) {
// 						alert(JSON.stringify(res));
// 						location.href="/textant/main.text";
// 					},
// 					fail : function(error) {
// 						alert(JSON.stringify(error));
// 						location.href="/textant/main.text";
// 					}
// 				});
// 			},
// 			fail : function(err) {
// 				alert(JSON.stringify(err));
// 			}
// 		});
// 		//]]>
	</script>

</body>
</html>
