<%@page import="java.util.ArrayList"%>
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
body {
	
}

.clear {
	clear: both;
}

.managing {
	border: 1px solid black;
	background-color: white;
}
.main{
background-color: #EFEEEE;
} 
.text-muted{
/* font-style: italic; */
font:bold;
font-size: 20px; 
padding-left: 5px;
}
</style>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
body {
	background-color: white;
}

.managing table tr:hover {
	background-color: gray;
	font: white;
}
.sidebar{
/* 	background-color: #000; */
/* 	height: 100% */
}
.main{
border-left: 1px solid #999;
padding-left: 40px;
}
</style>
<script>
window.onload = function () {
let totalCount = "${totalVisitCount}";	

 let size = "${totalVisitCount.size()}";
	let visitDateList = []; 
	let visitCountList = []; 
	function Init() {
			visitDateList[1] = "${totalVisitCount.get(0).visitDate}";
			visitCountList[1] = "${totalVisitCount.get(0).visitCount}";
			visitDateList[2] = "${totalVisitCount.get(1).visitDate}";
			visitCountList[2] = "${totalVisitCount.get(1).visitCount}";
			visitDateList[3] = "${totalVisitCount.get(2).visitDate}";
			visitCountList[3] = "${totalVisitCount.get(2).visitCount}";
			visitDateList[4] = "${totalVisitCount.get(3).visitDate}";
			visitCountList[4] = "${totalVisitCount.get(3).visitCount}";
			visitDateList[5] = "${totalVisitCount.get(4).visitDate}";
			visitCountList[5] = "${totalVisitCount.get(4).visitCount}";
			visitDateList[6] = "${totalVisitCount.get(5).visitDate}";
			visitCountList[6] = "${totalVisitCount.get(5).visitCount}";
			visitDateList[7] = "${totalVisitCount.get(6).visitDate}";
			visitCountList[7] = "${totalVisitCount.get(6).visitCount}";
	}
 
 Init();
 
 var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		title: {
			text: "방문자수"
		},
		axisY: {
			title: "방문자 수",
			suffix: "명",
			includeZero: false
		},
		axisX: {
			title: "날짜"
		},
		data: [{
			type: "column",
			yValueFormatString: "#,##0\"\"명",
			dataPoints: [
				{ label: visitDateList[1], y: Number(visitCountList[1]) },	
				{ label: visitDateList[2], y: Number(visitCountList[2]) },	
				{ label: visitDateList[3], y: Number(visitCountList[3]) },	
				{ label: visitDateList[4], y: Number(visitCountList[4]) },	
				{ label: visitDateList[5], y: Number(visitCountList[5]) },	
				{ label: visitDateList[6], y: Number(visitCountList[6]) },	
				{ label: visitDateList[7], y: Number(visitCountList[7]) },	
				
			]
		}]
	});
chart.render();

}
</script>

 
</head>
<body>
	<div class="header">
		<div class="header_logo" style="padding-top: 20px;">
			<div style="float: left;">
				<a href="/textant/main.text" class="logo_a" style="height: 55px;">
					<img src="/textant/resources/icon_img/logo_mini.png" class="logo">
				</a>
			</div>
			<div style="float: left;">
				<a href="/textant/managerMain.text" style="text-decoration: none;"><span
					style="margin-top: auto; margin-bottom: auto; font-size: 33px; color: white;">
						&nbsp | 관리자 메뉴</span></a>
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
	</div>
 
	<%@include file="../topMenu.jsp" %>
	<br />


	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<br>
				<ul class="nav nav-sidebar">
					<li class="active"><a href="#">관리자 메인<span class="sr-only">(current)</span></a></li>
					<li><a href="#reportComment">신고된 댓글</a></li>
					<li><a href="#badComment">싫어요 댓글</a></li>
					<li><a href="#reportBook">신고된 책</a></li>
					<li><a href="#notice">공지사항</a></li>
					<li><a href="#recommendBook">추천 책</a></li>
				</ul>
				<div style="padding-left: 20px;">
				<hr style="color: black; size: 1px" >
					<span>관리하기</span>
				</div>
				<br>
				<ul class="nav nav-sidebar nav-stacked">
					<li><a href="/textant/reportCommentManaging.text?pageNum=1">댓글
							신고 관리하기</a></li>
					<li><a href="/textant/bookManaging.text?pageNum=1">책 신고
							관리하기</a></li>
					<li><a href="/textant/noticeManaging.text?pageNum=1">공지사항
							관리하기</a></li>
					<li><a href="/textant/recommendBookManaging.text?pageNum=1">추천
							책 관리하기</a></li>
					<li><a href="/textant/commentManaging.text?pageNum=1">전체
							댓글 관리하기</a></li>
					<li><a href="/textant/allBookManaging.text?pageNum=1">전체
							책 관리하기</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-md-10 main">
				<h1 class="page-header">관리자 메인</h1>
				
				
<div id="chartContainer" style="height: 300px; width: 100%;"></div>


				<div class="row placeholders">
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>댓글신고수</h4>
						<span class="text-muted">${totalReportComment}</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>책 신고수</h4>
						<span class="text-muted">${totalReportBook}</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>싫어요10개이상댓글</h4>
						<span class="text-muted">${totalBadComment}</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>추천책수</h4>
						<span class="text-muted">${totalRecommendBook}</span>
					</div>
				</div>

				<a name="reportComment"></a>
				<h2 class="sub-header" name="reportComment">신고된 댓글</h2>
				<div class="table-responsive">
					<div style="float: right;">
						<a href="/textant/reportCommentManaging.text?pageNum=1">관리하기</a>
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>댓글번호</th>
								<th>신고내용</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="reportComment"
								items="${getFirstReportCommentList}">
								<tr>
									<td><c:out value="${reportComment.reportCommentNum}" /></td>
									<td><c:out value="${reportComment.commentNum}" /></td>
									<td><c:out value="${reportComment.repoCommCont}" /></td>
									<td><c:out
											value="${reportComment.writeDate.substring(0,10)}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a name="badComment"></a>
					<h2 class="sub-header" name="badComment">댓글 전체 관리(싫어요순)</h2>
					<div style="text-align: right;">
						<a href="/textant/commentManaging.text?pageNum=1">관리하기</a>
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>유저번호</th>
								<th>내용</th>
								<th>싫어요수</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="badComment" items="${getFirstBadCommentList}">
								<tr>
									<td><c:out value="${badComment.commentNum}" /></td>
									<td><c:out value="${badComment.userNum}" /></td>
									<td><c:out value="${badComment.conet}" /></td>
									<td><c:out value="${badComment.commentBad}" /></td>
									<td><c:out value="${badComment.writeDate.substring(0,10)}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a name="reportBook"></a>
					<h2 class="sub-header" name="reportBook">신고된 책</h2>
					<div style="text-align: right;">
						<a href="/textant/bookManaging.text?pageNum=1">관리하기</a>
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>책번호</th>
								<th>책 신고 내용</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="reportBook" items="${getFirstReportBookList}">
								<tr>
									<td><c:out value="${reportBook.reportBookNum}" /></td>
									<td><c:out value="${reportBook.bookArticleNum}" /></td>
									<td><c:out value="${reportBook.repoBookCont}" /></td>
									<td><c:out value="${reportBook.writeDate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a name="notice"></a>
					<h2 class="sub-header" name="notice">공지사항</h2>
					<div style="text-align: right;">
						<a href="/textant/noticeManaging.text?pageNum=1">관리하기</a>
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>유저번호</th>
								<th>조회수</th>
								<th>타입</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="notice" items="${getFirstNoticeList}">
								<tr>
									<td><c:out value="${notice.articleNum}" /></td>
									<td><c:out value="${notice.title}" /></td>
									<td><c:out value="${notice.userNum}" /></td>
									<td><c:out value="${notice.hit}" /></td>
									<td><c:out value="${notice.type}" /></td>
									<td><c:out value="${notice.writeDate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a name="recommendBook"></a>
					<h2 class="sub-header" name="recommendBook">추천 책</h2>
					<div style="text-align: right;">
						<a href="/textant/recommendBookManaging.text?pageNum=1">관리하기</a>
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>책번호</th>
								<th>유저번호</th>
								<th>추천코멘트</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="recommendedBook"
								items="${getFirstRecommendedBookList}">
								<tr>
									<td><c:out value="${recommendedBook.recommendNum}" /></td>
									<td><c:out value="${recommendedBook.bookArticleNum}" /></td>
									<td><c:out value="${recommendedBook.userNum}" /></td>
									<td><c:out value="${recommendedBook.recommendComment}" /></td>
									<td><c:out value="${recommendedBook.writeDate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<div>
			<img height="50px" src="/textant/resources/icon_img/footer_logo.png"
				class="footer_img">
		</div>
		<address>
			Tel. 010-1234-1234<br> Fax. 051)555-555<br> E-Mail.
			cwj1102@naver.com<br> 주소. 부산광역시 남구 신선로 365 부경대학교<br> <br>
			<br> <a href="#" class="foo_a">회사소개</a> <a href="#"
				class="foo_a">광고문의</a> <a href="#" class="foo_a">제휴문의</a> <a
				href="#" class="foo_a">인재채용</a> <a href="#" class="foo_a">서비스약관</a>
			<a href="#" class="foo_a">고객센터</a> <a href="#" class="foo_a">Q&A게시판</a>
		</address>
	</footer>

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
		
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>