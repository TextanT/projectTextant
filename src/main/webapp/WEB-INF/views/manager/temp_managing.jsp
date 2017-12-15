<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/textant/resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/footer.css" rel="stylesheet"
	type="text/css">
	
<title>Insert title here</title>
<style>
body{

}
.clear {
	clear: both;
}

.managing {
	border: 1px solid black;
	background-color: white;
}
</style>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
body{
background-color: #EFEEEE;
}
.managing table tr:hover{
background-color: gray;
font: white;
}
</style>
</head>
<body>
	<div class="header">
		<div class="header_logo" style="padding-top: 20px;">
		<div style="float:left;">
			<a href="/textant/main.text" class="logo_a" style="height:55px;"> <img
				src="/textant/resources/icon_img/logo_mini.png" class="logo">
			</a>
			</div>
			<div style="float:left;"><a href="/textant/managerMain.text" style="text-decoration: none;"><span style="margin-top: auto; margin-bottom: auto;font-size: 33px; color: white;"> &nbsp | 관리자 메뉴</span></a></div>
		</div>
		<div class="menu_box">
			<c:if test="${id!=null}">
				<c:out
					value="
			<a href='#' class='menu_title'><span class='menu1' id='menu1'>${id}</span></a>
			
			<a href='mypage.text' class='menu_title'><span class='menu2'id='menu2'>내정보</span></a> 

			<a href='logout.text' class='menu_title'><span class='menu3'id='menu3'>로그아웃</span></a> 
			
			<a href='first.text' class='menu_title'><span class='menu4'id='menu4'>처음으로</span></a>
			 "
					escapeXml="false" />
			</c:if>

		</div>
	</div>

	<div class="sub_header">
		<div class="menu_dd">
			<div class="sub_sub1">
				<a href='' class='sub_header_menu1'>내서재</a>
			</div>
			<div class="sub_sub2">
				<a href='/textant/write.text' class='sub_header_menu2'
					id="sub_menu2">창작카페</a>
			</div>
			<div class="sub_sub3">
				<a href='' class='sub_header_menu3' id="sub_menu3">장르별</a>
			</div>
		</div>
	</div>
	<div class="menu_top">
		<div class="menu_box1">
			<div class="list_box1">
				<ul>
					<li><a href="#">카페</a></li>
					<li><a href="#">베스트</a></li>
					<li><a href="#">작품쓰기</a></li>

				</ul>
			</div>
			<div class="list_box2">
				<ul>
					<li><a href="#">역사</a></li>
					<li><a href="#">스포츠</a></li>
					<li><a href="#">SF</a></li>

				</ul>
			</div>
			<div class="list_box3">
				<ul>
					<li><a href="#">추리</a></li>
					<li><a href="#">공포</a></li>
					<li><a href="#">게임</a></li>

				</ul>
			</div>
			<div class="list_box4">
				<ul>
					<li><a href="#">판타지</a></li>
					<li><a href="#">무협</a></li>
					<li><a href="#">미스테리</a></li>

				</ul>
			</div>
			<div class="list_box5">
				<ul>
					<li><a href="#">로맨스</a></li>
					<li><a href="#">전쟁</a></li>
					<li><a href="#">성장</a></li>

				</ul>
			</div>
			<div class="list_box6">
				<ul>
					<li><a href="#">시</a></li>
					<li><a href="#">수필</a></li>
					<li><a href="#">유머</a></li>

				</ul>
			</div>

		</div>
	</div>
	<br />
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-md-10 main">
          <h1 class="page-header">Dashboard</h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzBEOEZEQiIvPjxnPjx0ZXh0IHg9Ijc0LjA1NDY4NzUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6I0ZGRkZGRjtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjIwMHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-holder-rendered="true">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="200x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzM5REJBQyIvPjxnPjx0ZXh0IHg9Ijc0LjA1NDY4NzUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6IzFFMjkyQztmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjIwMHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-holder-rendered="true">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzBEOEZEQiIvPjxnPjx0ZXh0IHg9Ijc0LjA1NDY4NzUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6I0ZGRkZGRjtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjIwMHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-holder-rendered="true">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="200x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzM5REJBQyIvPjxnPjx0ZXh0IHg9Ijc0LjA1NDY4NzUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6IzFFMjkyQztmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjIwMHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-holder-rendered="true">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
          </div>

          <h2 class="sub-header">Section title</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>sit</td>
                </tr>
                <tr>
                  <td>1,002</td>
                  <td>amet</td>
                  <td>consectetur</td>
                  <td>adipiscing</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>Integer</td>
                  <td>nec</td>
                  <td>odio</td>
                  <td>Praesent</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>libero</td>
                  <td>Sed</td>
                  <td>cursus</td>
                  <td>ante</td>
                </tr>
                <tr>
                  <td>1,004</td>
                  <td>dapibus</td>
                  <td>diam</td>
                  <td>Sed</td>
                  <td>nisi</td>
                </tr>
                <tr>
                  <td>1,005</td>
                  <td>Nulla</td>
                  <td>quis</td>
                  <td>sem</td>
                  <td>at</td>
                </tr>
                <tr>
                  <td>1,006</td>
                  <td>nibh</td>
                  <td>elementum</td>
                  <td>imperdiet</td>
                  <td>Duis</td>
                </tr>
                <tr>
                  <td>1,007</td>
                  <td>sagittis</td>
                  <td>ipsum</td>
                  <td>Praesent</td>
                  <td>mauris</td>
                </tr>
                <tr>
                  <td>1,008</td>
                  <td>Fusce</td>
                  <td>nec</td>
                  <td>tellus</td>
                  <td>sed</td>
                </tr>
                <tr>
                  <td>1,009</td>
                  <td>augue</td>
                  <td>semper</td>
                  <td>porta</td>
                  <td>Mauris</td>
                </tr>
                <tr>
                  <td>1,010</td>
                  <td>massa</td>
                  <td>Vestibulum</td>
                  <td>lacinia</td>
                  <td>arcu</td>
                </tr>
                <tr>
                  <td>1,011</td>
                  <td>eget</td>
                  <td>nulla</td>
                  <td>Class</td>
                  <td>aptent</td>
                </tr>
                <tr>
                  <td>1,012</td>
                  <td>taciti</td>
                  <td>sociosqu</td>
                  <td>ad</td>
                  <td>litora</td>
                </tr>
                <tr>
                  <td>1,013</td>
                  <td>torquent</td>
                  <td>per</td>
                  <td>conubia</td>
                  <td>nostra</td>
                </tr>
                <tr>
                  <td>1,014</td>
                  <td>per</td>
                  <td>inceptos</td>
                  <td>himenaeos</td>
                  <td>Curabitur</td>
                </tr>
                <tr>
                  <td>1,015</td>
                  <td>sodales</td>
                  <td>ligula</td>
                  <td>in</td>
                  <td>libero</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<div id="managingDistrict">
		<div
			style="margin-top: 10px; margin-left: 80px; width: 40%; float: left;">
			<h3 style="text-align: center">신고 댓글</h3>
		</div>
		<div
			style="margin-top: 10px; margin-right: 80px; width: 40%; float: right;">
			<h3 style="text-align: center">댓글 전체 관리(싫어요순)</h3>
		</div>
		<div class="clear"></div>
		<div style="margin-left: 80px; width: 40%; float: left;'">
			<div style="text-align: right;"><a href="/textant/reportCommentManaging.text?pageNum=1">관리하기</a></div>
			<div class="managing" id="reportComment"
				style="height: 200px; overflow-y: scroll;">
				<table class="table" style="margin-left: auto; margin-right: auto;text-align: center;">
				<tr>
					<td>번호</td>
					<td>댓글번호</td>
					<td>신고내용</td>
					<td>작성날짜</td>
					</tr>
					<c:forEach var="reportComment" items="${getFirstReportCommentList}">
					<tr>
					<td><c:out value="${reportComment.reportCommentNum}"/></td>
					<td><c:out value="${reportComment.commentNum}"/></td>
					<td><c:out value="${reportComment.repoCommCont}"/></td>
					<td><c:out value="${reportComment.writeDate.substring(0,10)}"/></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<div style="margin-right: 80px; width: 40%; float: right;'">
			<div style="text-align: right;"><a href="/textant/commentManaging.text?pageNum=1">관리하기</a></div>
			<div class="managing" id="badComment"
				style="height: 200px; overflow-y: scroll;">
				<table class="table" style="margin-left: auto; margin-right: auto;text-align: center;">
				<tr>
					<td>번호</td>
					<td>유저번호</td>
					<td>내용</td>
					<td>싫어요수</td>
					<td>작성날짜</td>
					</tr>
					<c:forEach var="badComment" items="${getFirstBadCommentList}">
					<tr>
					<td><c:out value="${badComment.commentNum}"/></td>
					<td><c:out value="${badComment.userNum}"/></td>
					<td><c:out value="${badComment.conet}"/></td>
					<td><c:out value="${badComment.commentBad}"/></td>
					<td><c:out value="${badComment.writeDate.substring(0,10)}"/></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="clear"></div>
		<div style="margin-top: 50px;">
			<h3 style="text-align: center">이상 책 관리</h3>
		</div>
		<div style="margin-left: 80px; margin-right: 80px; width: auto;">
			<div style="text-align: right;"><a href="/textant/bookManaging.text?pageNum=1">관리하기</a></div>
			<div class="managing" id="reportBook"
				style="height: 200px; overflow-y: scroll;">
				<table class="table"style="margin-left: auto; margin-right: auto;text-align: center;">
				<tr>
					<td>번호</td>
					<td>책번호</td>
					<td>책 신고 내용</td>
					<td>작성날짜</td>
					</tr>
					<c:forEach var="reportBook" items="${getFirstReportBookList}">
					<tr>
					<td><c:out value="${reportBook.reportBookNum}"/></td>
					<td><c:out value="${reportBook.bookArticleNum}"/></td>
					<td><c:out value="${reportBook.repoBookCont}"/></td>
					<td><c:out value="${reportBook.writeDate}"/></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<div style="margin-top: 50px;">
			<h3 style="text-align: center">공지사항 관리</h3>
		</div>
		<div style="margin-left: 80px; margin-right: 80px; width: auto;">
			<div style="text-align: right;"><a href="/textant/noticeManaging.text?pageNum=1">관리하기</a></div>
			<div class="managing" id="notice"
				style="height: 200px; overflow-y: scroll;">
				<table class="table"style="margin-left: auto; margin-right: auto;text-align: center;">
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>유저번호</td>
					<td>조회수</td>
					<td>타입</td>
					<td>작성날짜</td>
					</tr>
					<c:forEach var="notice" items="${getFirstNoticeList}">
					<tr>
					<td><c:out value="${notice.articleNum}"/></td>
					<td><c:out value="${notice.title}"/></td>
					<td><c:out value="${notice.userNum}"/></td>
					<td><c:out value="${notice.hit}"/></td>
					<td><c:out value="${notice.type}"/></td>
					<td><c:out value="${notice.writeDate}"/></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div style="margin-top: 50px;">
			<h3 style="text-align: center">추천 책 관리</h3>
		</div>
		<div style="margin-left: 80px; margin-right: 80px;margin-bottom:50px; width: auto;">
			<div style="text-align: right;"><a href="/textant/recommendBookManaging.text?pageNum=1">관리하기</a></div>
			<div class="managing" id="recommendBook"
				style="height: 200px; overflow-y: scroll;">
				<table class="table" style="margin-left: auto; margin-right: auto;text-align: center;">
				<tr>
					<td>번호</td>
					<td>책번호</td>
					<td>유저번호</td>
					<td>추천코멘트</td>
					<td>작성날짜</td>
					</tr>
				<c:forEach var="recommendedBook" items="${getFirstRecommendedBookList}">
					<tr>
					<td><c:out value="${recommendedBook.recommendNum}"/></td>
					<td><c:out value="${recommendedBook.bookArticleNum}"/></td>
					<td><c:out value="${recommendedBook.userNum}"/></td>
					<td><c:out value="${recommendedBook.recommendComment}"/></td>
					<td><c:out value="${recommendedBook.writeDate}"/></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
</div>
		<%@include file="../footer.jsp" %>

		<div style="position: fixed; bottom: 15px; right: 30px;">
			<a href="#" id="MOVE_TOP_BTN"><img
				src="/textant/resources/icon_img/top.jpg"></a>
		</div>

		<script src="https://code.jquery.com/jquery-2.2.0.min.js"
			type="text/javascript">
			
		</script>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#sub_menu2').mouseover(function() {
					$('.menu_box1').css("display", "block");
				})
				$('#sub_menu2').mouseout(function() {
					$('.menu_box1').css("display", "none");
				})
				$('#sub_menu3').mouseover(function() {
					$('.menu_box1').css("display", "block");
				})
				$('#sub_menu3').mouseout(function() {
					$('.menu_box1').css("display", "none");
				})
				$('.menu_box1').mouseover(function() {
					$('.menu_box1').css("display", "block");
				})
				$('.menu_box1').mouseout(function() {
					$('.menu_box1').css("display", "none");
				})
			})
		</script>

</body>
</html>