<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE>
<html>
<head>
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
</head>

<body>
	${totalPage}
	<br /> ${pageNumber}
	<h1>Hello world!</h1>
	<div class="plus">확대</div>
	<br />
	<!-- 	<div class="fileDrop" style="width: 1200px;height: 900px;"> -->
	<!-- 	<img src='displayFile.text?fileName=1' width="49%" style="border: black solid 1px; margin-right: 0; padding-right: 0;"/> -->
	<!-- 	<img src='displayFile.text?fileName=2' width="49%" style="border: black solid 1px; margin-left: 0; padding-left: 0;"/>	</div> -->
	</div>
	<div class="progress">
		<progress class="proBar" value="0" max="100"></progress>

	</div>
	<br />
	<a href="#" onclick="history.back()">뒤로</a>
	<br />


	<script>
		$.ajaxSetup({
			type : "POST",
			async : true,
			dataType : "json",
			error : function(xhr) {
				//         alert("error html = " + xhr.statusText);
			}
		});
		$(document).ready(function() {
			let a = function() {
				/**/
				$.ajax({
					url : "/textant/getProgress.text",
					data : {},
					success : function(data) {
						console.log(data);
						$(".proBar").attr("max", data.totalPage);
						$(".proBar").attr("value", data.pageNumber);
						if (data.pageNumber == data.totalPage) {
							// 	                	alert("끝");
							window.location.replace("/textant/main.text");
						}
					}
				})
				/**/
			}
			a();

			function loop(x) {
				setTimeout(function() {
					console.log(x);
					a();
				}, 100 * x);
			}

			for (i = 1; i < 9999; i++) {
				loop(i);
			}

		})
	</script>
</body>
</html>
