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
	
<title>TEXTANT</title><style>
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
/* .managing table tr:hover{ */
/* background-color: gray; */
/* font: white; */
/* } */
</style>
</head>
<body>
	<div class="header">
		<div class="header_logo" style="padding-top: 20px;">
		<div style="float:left;">
			<a href="/textant/main.text" class="logo_a" style="height:55px;"> <img
				src="/textant/resources/icon_img/logo_mini.png" class="logo">
			</a>
			</div><div style="float:left;"><span style="margin-top: auto; margin-bottom: auto;font-size: 33px; color: white;"> &nbsp | 내 서재</span></div>
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
	<div id="managingDistrict">
		<div style="margin-top: 50px;">
			<h3 style="text-align: center">내가 쓴 댓글</h3>
		</div>
		<div style="margin-left: 80px; margin-right: 80px;margin-bottom:50px; width: auto;">
			<div class="managing" id="recommendBook"
				>
				<table class="table" style="margin-left: auto; margin-right: auto;text-align: center;">
				<tr>
					<td width="10%;">댓글번호</td>
					<td width="20%;">제목</td>
					<td width="10%;">페이지</td>
					<td width="40%;">내용</td>
					<td width="15%;">날짜</td>				
					<td width="5%;">옵션</td>				
					</tr>
					<c:forEach var="comment" items="${commentList}">
					<tr>
					<td><c:out value="${comment.commentNum}"/></td>
					<td><c:out value="${comment.bookName}"/></td>
					<td><c:out value="${comment.pageGroup}"/></td>
					<td><c:out value="${comment.conet}"/></td>
					<td><c:out value="${comment.writeDate.substring(0,10)}"/></td>
					<td><a name="bookArticleNum" href="/textant/myCommentDelete.text?pageNum=${pageNum}&commentNum=${comment.commentNum}&commentGroup=${comment.commentGroup}">삭제</a></td>
					</tr>
					</c:forEach>
					<tr>	  
      <td colspan="5" align="center" height="40">	 
	  ${pageCode}
	  </td>
  </tr>
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