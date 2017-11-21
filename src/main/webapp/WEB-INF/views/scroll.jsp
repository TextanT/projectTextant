<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('ccc').scroll(function(){
		alert("1");
		var scrollHeight=$(window).scrollTop()+$(window).height();
		var documentHeight=$(document).height();
		
		if(scrollHeight==documentHeight){
				$('<h1>무한스크롤</h1>').appendTo('.aaa');
		}
	})
})

</script>
<style>
</style>
<title>Insert title here</title>
</head>
<body>
<div class="ccc" div style="overflow-y:scroll;width:400px;height:500px;">
<div class="aaa">
<div class="wrdLatest" id=9>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=9>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=9>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=9>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=9>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>
<div class="wrdLatest" id=8>content</div>

</div>
</div>
<form action="/textant/scroll.text" method="post">
<input name="conet" type="text">
<input type="submit" value="쓰기">
</form>
</body>
</html>