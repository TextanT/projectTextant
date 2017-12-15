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
<%@include file="../topMenu.jsp" %>
	<br />
	<div id="managingDistrict">
		<div style="margin-top: 50px;">
			<h3 style="text-align: center">전체 책 관리</h3>
		</div>
		<div
			style="margin-left: 80px; margin-right: 80px; margin-bottom: 50px; width: auto;">

			<div style="float: right;">
				<form action="/textant/allBookSearch.text" method="get">
						<input type="hidden" value="1" name="pageNum">
					<table>
						<tr>
							<td colspan="4" style="text-align: center;"><span>책 검색</span></td>
						</tr>
						<tr>
							<td>
<!-- 							<input type="text" name="searchType" -->
<!-- 								style="display: none;" id="searchType_text" class="searchType_tt"> -->
							</td>
							<td>
								<div class="genDiv">
									<label class="searchType"> <select name='searchType'
										id="searchType_sel" onchange="selectchange(this.form)">
											<option value='' selected>-- 선택 --</option>
											<option value='title'>제목</option>
											<option value='contents'>내용</option>
											<option value='userName'>사용자번호</option>
											<option value='bookNum'>책번호</option>
											<option value='genre'>장르</option>
									</select>
									</label>
								</div>
							</td>
							<td><input type="text" name="commentContents"></td>
							<td><input type="submit" value="검색"></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="managing" id="recommendBook" style="clear: both;">

				<table class="table"
					style="margin-left: auto; margin-right: auto; text-align: center;">
					<tr>
						<td>책번호</td>
							<td>책이름</td>
							<td>총페이지</td>
							<td>유저번호</td>
							<td>장르</td>
							<td>조회수</td>
							<td>작성날짜</td>
							<td>별점</td>
					</tr>
					<c:forEach var="bookInfoList" items="${bookInfoList}">

						<tr style="cursor: pointer;"
							onClick="window.open('/textant/allBookContent.text?num=${bookInfoList.bookArticleNum}','_self');">
							<td><c:out value="${bookInfoList.bookArticleNum}" /></td>
							<td><c:out value="${bookInfoList.bookName}" /></td>
							<td><c:out value="${bookInfoList.totalPage}" /></td>
							<td><c:out value="${bookInfoList.userNum}" /></td>
							<td><c:out value="${bookInfoList.genre}" /></td>
							<td><c:out value="${bookInfoList.hit}" /></td>
							<td><c:out value="${bookInfoList.writeDate.substring(0,10)}" /></td>
							<td><c:out value="${(bookInfoList.totalScore+0.0)/(bookInfoList.scoreNum+0.0)}" /></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="8" align="center" height="40">${pageCode}</td>
					</tr>
				</table>
			</div>
			<div style="text-align: right;">
				<a href="/textant/managerMain.text">관리자 메인</a>
			</div>
			<div style="width: 700px"> 
			<table class="table">
			</table>
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

// 		function selectchange(frm) {
// 			frm.searchType.value = frm.searchTypeGo.options[frm.searchTypeGo.selectedIndex].value;
// 		}
		
		$.ajaxSetup({
			type : "POST",
			async : true,
			dataType : "json",
			error : function(xhr) {
				//         alert("error html = " + xhr.statusText);
			}
		});

		function bookSearchDo() {
			$.ajax({
				url : "/textant/getBookNum.comment",
				data : {
					bookSearch : $("#bookSearchInput").val()
				},
				success : function(data) {
					$("#bookSearchInput").val("");
					if (data != null) {
						$(".bookList").empty();
						$(".bookList").append("<table class='table'>");
						$(".bookList table").append(
								"<tr><td>" + "책번호" + "</td><td>" + "책이름"
										+ "</td><td>" + "원본이름" + "</td><td>"
										+ "장르" + "</td><td>" + "유저번호"
										+ "</td><td>" + "설명" + "</td>");
						$.each(data, function(index, item) {
							$(".bookList table").append(
									"<tr><td>" + item.bookArticleNum
											+ "</td><td>" + item.bookName
											+ "</td><td>"
											+ item.fileLocation.substring(37)
											+ "</td><td>" + item.genre
											+ "</td><td>" + item.userNum
											+ "</td><td>" + item.bookDesc
											+ "</td>");
							// 						 console.log(data);
							// 						$(".proBar").attr("max", data.totalPage);
							// 						$(".proBar").attr("value", data.pageNumber);
							// 						if (data.pageNumber == data.totalPage) {
							// 							// 	                	alert("끝");
							// 							window.location.replace("/textant/main.text");
							// 						}
							$(".bookList table").append("</tr>");
						});
						$(".bookList").append("</table>");

					}
				}
			});
		}
		
		function bookSearchDoNum() {
			$.ajax({
				url : "/textant/getBookName.comment",
				data : {
					bookSearch : $("#bookSearchInputNum").val()
				},
				success : function(data) {
					$("#bookSearchInputNum").val("");
					if (data != null) {
						$(".bookList").empty();
						$(".bookList").append("<table class='table'>");
						$(".bookList table").append(
								"<tr><td>" + "책번호" + "</td><td>" + "책이름"
										+ "</td><td>" + "원본이름" + "</td><td>"
										+ "장르" + "</td><td>" + "유저번호"
										+ "</td><td>" + "설명" + "</td>");
						$.each(data, function(index, item) {
							$(".bookList table").append(
									"<tr><td>" + item.bookArticleNum
											+ "</td><td>" + item.bookName
											+ "</td><td>"
											+ item.fileLocation.substring(37)
											+ "</td><td>" + item.genre
											+ "</td><td>" + item.userNum
											+ "</td><td>" + item.bookDesc
											+ "</td>");
							// 						 console.log(data);
							// 						$(".proBar").attr("max", data.totalPage);
							// 						$(".proBar").attr("value", data.pageNumber);
							// 						if (data.pageNumber == data.totalPage) {
							// 							// 	                	alert("끝");
							// 							window.location.replace("/textant/main.text");
							// 						}
							$(".bookList table").append("</tr>");
						});
						$(".bookList").append("</table>");

					}
				}
			});
		}
	</script>

</body>
</html>