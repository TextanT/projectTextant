<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>부트스트랩 101 템플릿</title>

    <!-- 부트스트랩 -->
    <link href="/textant/resources/css/bootstrap.min.css" rel="stylesheet">

	<title>bookMark</title>
  </head>

<body>
	
<div class="container" style="width:100%">
	<!-- for Each-->
	<div class="row">
		<div class="col-md-1"> 1. </div>
		<div class="col-md-3" style="height:150px; background:#ddd;"> img </div>
		<div class="col-md-8">
			<dl>
				<dt class="text-overflow">el: 책이름을 넣어주세요 </dt>
				<dd class="text-overflow">el: 북마크 메모 내역입니다 </dd>
			</dl>
		</div>
	</div>
</div>

</body>
</html>