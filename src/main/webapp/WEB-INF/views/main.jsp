<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/textant/resources/Swiper-master/dist/css/swiper.min.css">
	
<link href="/textant/resources/css/headermain.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/footer.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/main_slider.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/main_slider2.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/book_list.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/notice.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/sign_modal.css" type="text/css"
	rel="stylesheet">
<link href="/textant/resources/css/log.css" type="text/css"
	rel="stylesheet">
<link href="/textant/resources/css/modal2.css" type="text/css"
	rel="stylesheet">
<link href="/textant/resources/css/bookover.css" type="text/css"
	rel="stylesheet">
<script src="/textant/resources/Swiper-master/dist/js/swiper.min.js"></script>
<title>Document</title>
<style>
</style>
</head>

<body>

	<div class="header">
		<div class="header_logo" style="padding-top: 20px;">
			<a href="/textant/main.text" class="logo_a"> <img
				src="/textant/resources/icon_img/logo_mini.png" class="logo">
			</a>
		</div>
	<%@include file="menuBox.jsp" %>

	</div>
	<%@include file="topMenu.jsp" %>


	<div class="swiper-container" onmouseover="slidestop()"
		onmouseout="slidestart()">
		<div class="swiper-wrapper">
			<c:forEach var="files" items="${fileList}">
				<div class="swiper-slide">
					<div class="img-wrapper">
						<div class="swiper-size"
							style="height: 320px; width: 220px; overflow: hidden;">
							<a href="/textant/read.text?fileName=${files.fileLocation}&bookType=jpg" target="_black"><img
								src="displayFile.text?fileName=${files.fileLocation}/OriginImg&pageNum=1&fileType=jpg"
								style="display: block; height: 100%; width: auto; border: 1px solid #e8e8e8;"
								class="bookimg" /></a>
						</div>
						<a href="/textant/read.text?fileName=${files.fileLocation}&bookType=jpg" target="_black"> <span
							class="bookname" style="text-align: center;">${files.bookName}</span><br />
							<span class="bookname">${files.userNum}</span>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<!-- Add Arrows -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>

	</div>
	<div class="book_list_box" style="overflow: hidden; height: 920px;position: relative;">
		<div style="float: right; margin-right: 30px;">
			<div style="float: right;">
				<img src="/textant/resources/icon_img/likestarnon.png"
					style="cursor: pointer;" class="likenon"> <img
					src="/textant/resources/icon_img/likestarselect.png"
					style="display: none; cursor: pointer;" class="likeselect">
			</div>
			<div style="float: right;">
				<img src="/textant/resources/icon_img/hitnon.png"
					style="cursor: pointer;" class="hitnon"> <img
					src="/textant/resources/icon_img/hitselect.png"
					style="display: none; cursor: pointer;" class="hitselect">
			</div>
			<div style="float: right;">
				<img src="/textant/resources/icon_img/updatanon.png"
					style="cursor: pointer;display: none;" class="updatanon"> <img
					src="/textant/resources/icon_img/updataselect.png"
					 cursor: pointer;" class="updataselect">
			</div>
		<input type="text" class="sortType" id="sortType" name="sortType" hidden>
		</div>
		<br> <br>
		<div id="booklistdiv">
<%-- 			<c:forEach var="files" items="${fileList}" varStatus="index"> --%>

<%-- 				<div class="book_list${index.count}"> --%>
<%-- 					<a href="/textant/read.text?fileName=${files.fileLocation}"> <img --%>
<%-- 						src="displayFile.text?fileName=${files.fileLocation}/OriginImg&pageNum=1&fileType=jpg" --%>
<!-- 						style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;" -->
<!-- 						class="book_img_size"> -->
<!-- 						<div style="width: 176.66px; height: 259px; position: relative;" -->
<%-- 							class="book_cap${index.count}" id="book_cap${index.count}"> --%>
<%-- 							<h5>${files.bookName}</h5> --%>
<%-- 							<p>${files.userNum}</p> --%>
<!-- 							<br> -->
<!-- 							<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다. -->
<!-- 								이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p> -->
<!-- 						</div> -->
<!-- 					</a> -->
<!-- 				</div> -->
<%-- 			</c:forEach> --%>
			
			<input type="button" class="genget" id="genget" onclick="mainbooks()"hidden>
			<input type="hidden" class="pageNum" id="pageNum" name="pageNum" value="1">
			<!-- 			<div class="book_list1"> -->
			<!-- 				<a href="#"><img src="/textant/resources/book_img/너의췌장을먹고싶어.jpg" -->
			<!-- 					style="border: 1px solid #D8D8D8; position: absolute; z-index: 2;" -->
			<!-- 					class="book_img_size" onmouseover="bookli1over()" -->
			<!-- 					onmouseout="bookli1out()"> -->
			<!-- 					<div style="width: 176.66px; height: 259px; position: relative;" -->
			<!-- 						class="book_cap1" id="book_cap1"> -->
			<!-- 						<h5>너의 췌장을 먹고싶어</h5> -->
			<!-- 						<p>기시미이치로</p> -->
			<!-- 						<br> -->
			<!-- 						<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다. -->
			<!-- 							이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p> -->
			<!-- 					</div> </a> -->
			<!-- 			</div> -->
			
			<div style="width:100px; height: 100px; border: 1px solid black; position: absolute; left: 0; bottom: 0;"></div>
		</div>

		<!-- 		<div class="book_list4"></div> -->
		<!-- 		<div class="book_list5"></div> -->
	</div>


	<div class="data_box">
		<div class="tab_menu">
			<div class="tab_box">
				<ul class="tabs">
					<li class="active" rel="tab1">공지사항</li>
					<li rel="tab2">업데이트</li>
				</ul>
				<div class="tab_container">
					<div id="tab1" class="tab_content">
						<ul>
						<c:forEach var="noticeList" items="${getFirstNoticeList}">
							<li><c:out value="${noticeList.writeDate.substring(0,10)}"/> 
							<c:out value="${noticeList.title}"/></li>
						</c:forEach>
						</ul>
					</div>
					<div id="tab2" class="tab_content">
						<ul>
						<c:forEach var="eventList" items="${getFirstEventList}">
							<li><c:out value="${eventList.writeDate.substring(0,10)}"/> 
							<c:out value="${eventList.title}"/></li>
						</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="visual">

			<div class="visual-controller">
				<a href="#visual-01">1번보기</a> <a href="#visual-01">2번보기</a> <a
					href="#visual-01">3번보기</a> <a href="#visual-01">4번보기</a>
				<div type="button" class="btn-stop">
					<img src="/textant/resources/slide_img/start.jpg">
				</div>
				<div type="button" class="btn-play">
					<img src="/textant/resources/slide_img/stop.jpg">
				</div>
			</div>


			<div class="visual-list">
				<ul>
					<li id="visual-01">
						<div class="img">
							<img src="/textant/resources/slide_img/event1.jpg" alt=""
								class="simg" />
						</div>
					</li>
					<li id="visual-02">
						<div class="img">
							<img src="/textant/resources/slide_img/event2.jpg" alt=""
								class="simg" />
						</div>
					</li>
					<li id="visual-03">
						<div class="img">
							<img src="/textant/resources/slide_img/event3.jpg" alt=""
								class="simg" />
						</div>
					</li>
					<li id="visual-04">
						<div class="img">
							<img src="/textant/resources/slide_img/event4.jpg" alt=""
								class="simg" />
						</div>
					</li>

				</ul>
			</div>
		</div>

	</div>




	<%@include file="footer.jsp" %>
 
	<div style="position: fixed; bottom: 15px; right: 30px;">
		<a href="#" id="MOVE_TOP_BTN"><img
			src="/textant/resources/icon_img/top.jpg"></a>
	</div>



	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>

	<!-- Initialize Swiper -->
	<script src="/textant/resources/js/main_slider.js"></script>

	<script src="/textant/resources/js/header_over.js"></script>

	<script src="/textant/resources/js/top_move.js"></script>

	<script src="/textant/resources/js/notice.js"></script>

	<script src="/textant/resources/js/main_slider2.js"></script>
	<script type="text/javascript"
		src="/textant/resources/js/Example.Modal.js"></script>
	<script type="text/javascript" src="/textant/resources/js/modal1.js"></script>
	<script>
		function gender1() {

			// 			alert("남자");
			document.getElementById("jender").value = "1";

		};
		function gender2() {

			// 			alert("여자");
			document.getElementById("jender").value = "0";

		};
	</script>
	<script language="javascript">

		$.ajaxSetup({
			type : "POST",
			async : true,
			dataType : "json",
			error : function(xhr) {
				alert("error html = " + xhr.statusText);
			}
		});
		$(function() {
					$("#signid").on(
							"blur",
							function() {
								$.ajax({
									url : "joinIdCheck.text",
									data : {
										inputId : $("#signid").val()
									},
									success : function(data) {
										let html;
										// 								alert(data);
										if ($("#signid").val() != "") {
											if (data == 1) {
												html = "<p>사용가능한 아이디입니다</p>";
												$("#idCheckStatus").html(html).css(
														"color", "highlight");
												$("#idCheckStatus").html(html).css(
														"font-size", "12px");
												$("#idCheckStatus").html(html).css(
														"height", "16.3px");
												$("#idCheckStatus").html(html).css(
														"left", "16%");
		
												;
											} else if (data == 0) {
												html = "<p>중복된 아이디입니다</p>";
												$("#idCheckStatus").html(html).css(
														"color", "red");
												$("#idCheckStatus").html(html).css(
														"font-size", "12px");
												$("#idCheckStatus").html(html).css(
														"height", "16.3px");
												$("#idCheckStatus").html(html).css(
														"left", "16%");
											}
		
										} else {
											html = "<p>아이디를 입력하세요</p>";
											$("#idCheckStatus").html(html).css("color",
													"red");
											$("#idCheckStatus").html(html).css(
													"font-size", "13px");
											$("#idCheckStatus").html(html).css(
													"height", "16.3px");
										}
									}
								});
							})
				});
		$(document).ready(function() {
			var pageNum =$("#pageNum").val()
			getMainBookList(pageNum);
		});

		function getMainBookList(pageNum) {

			var html = "";
			$.ajax({
				url : "/textant/getMainBookList.comment",

				error : function(xhr) {

				},
				complete: function(){
					var overindex = 2;
					var outindex = 1;
					//book1 over	
					$('.book_list1').mouseenter(function() {
						document.getElementById('book_cap1').style.zIndex = overindex;
					});
					$('.book_list1').mouseleave(function() {
						document.getElementById('book_cap1').style.zIndex = outindex;
					});
					//book2 over
					$('.book_list2').mouseenter(function() {
						document.getElementById('book_cap2').style.zIndex = overindex;
					});
					$('.book_list2').mouseleave(function() {
						document.getElementById('book_cap2').style.zIndex = outindex;
					});
					//book3 over
					$('.book_list3').mouseenter(function() {
						document.getElementById('book_cap3').style.zIndex = overindex;
					});
					$('.book_list3').mouseleave(function() {
						document.getElementById('book_cap3').style.zIndex = outindex;
					});
					//book4 over
					$('.book_list4').mouseenter(function() {
						document.getElementById('book_cap4').style.zIndex = overindex;
					});
					$('.book_list4').mouseleave(function() {
						document.getElementById('book_cap4').style.zIndex = outindex;
					});
					//book5 over
					$('.book_list5').mouseenter(function() {
						document.getElementById('book_cap5').style.zIndex = overindex;
					});
					$('.book_list5').mouseleave(function() {
						document.getElementById('book_cap5').style.zIndex = outindex;
					});
					//book6 over
					$('.book_list6').mouseenter(function() {
						document.getElementById('book_cap6').style.zIndex = overindex;
					});
					$('.book_list6').mouseleave(function() {
						document.getElementById('book_cap6').style.zIndex = outindex;
					});
					//book7 over
					$('.book_list7').mouseenter(function() {
						document.getElementById('book_cap7').style.zIndex = overindex;
					});
					$('.book_list7').mouseleave(function() {
						document.getElementById('book_cap7').style.zIndex = outindex;
					});
					//book8 over
					$('.book_list8').mouseenter(function() {
						document.getElementById('book_cap8').style.zIndex = overindex;
					});
					$('.book_list8').mouseleave(function() {
						document.getElementById('book_cap8').style.zIndex = outindex;
					});
					//book9 over
					$('.book_list9').mouseenter(function() {
						document.getElementById('book_cap9').style.zIndex = overindex;
					});
					$('.book_list9').mouseleave(function() {
						document.getElementById('book_cap9').style.zIndex = outindex;
					});
					//book10 over
					$('.book_list10').mouseenter(function() {
						document.getElementById('book_cap10').style.zIndex = overindex;
					});
					$('.book_list10').mouseleave(function() {
						document.getElementById('book_cap10').style.zIndex = outindex;
					});
					//book11 over
					$('.book_list11').mouseenter(function() {
						document.getElementById('book_cap11').style.zIndex = overindex;
					});
					$('.book_list11').mouseleave(function() {
						document.getElementById('book_cap11').style.zIndex = outindex;
					});
					//book12 over
					$('.book_list12').mouseenter(function() {
						document.getElementById('book_cap12').style.zIndex = overindex;
					});
					$('.book_list12').mouseleave(function() {
						document.getElementById('book_cap12').style.zIndex = outindex;
					});
					//book13 over
					$('.book_list13').mouseenter(function() {
						document.getElementById('book_cap13').style.zIndex = overindex;
					});
					$('.book_list13').mouseleave(function() {
						document.getElementById('book_cap13').style.zIndex = outindex;
					});
					//book14 over
					$('.book_list14').mouseenter(function() {
						document.getElementById('book_cap14').style.zIndex = overindex;
					});
					$('.book_list14').mouseleave(function() {
						document.getElementById('book_cap14').style.zIndex = outindex;
					});
					//book15 over
					$('.book_list15').mouseenter(function() {
						document.getElementById('book_cap15').style.zIndex = overindex;
					});
					$('.book_list15').mouseleave(function() {
						document.getElementById('book_cap15').style.zIndex = outindex;
					});
				},
				data : {
					sortType : $("#sortType").val(),
					pageNum : pageNum
				},
				success : function(data) {
					$("#booklistdiv").empty();
					$.each(data.getMainBookList, function(index, item) {
						html +="<div class='book_list"+(index+1)+"'style='width:176.66px; height:259px; overflow:hidden;'>"
						+"<a href='/textant/read.text?fileName="+item.fileLocation+"&bookType="+/* item.fileLocation.substring(item.fileLocation.lastIndexOf('.')+1) */"txt"+"' target='_black'> <img "
						+"src='displayFile.text?fileName="+item.fileLocation+"/OriginImg&pageNum=1&fileType=jpg'"
							+"style='border: 1px solid #D8D8D8; position: absolute; z-index: 2; '"
								+"class='book_img_size'>"
								
							+"<div style='width: 176.66px; height: 259px; position: relative;'"
								+"class='book_cap"+(index+1)+"' id='book_cap"+(index+1)+"'>"
								+"<h5>"+item.bookName+"</h5>" 
								+"<p>"+item.userNum+"</p>"
								+"<br>"
								+"<p style='text-overflow: ellipsis; overflow:hidden; word-break:break-all;max-height:180px;'>"+item.bookDesc +"</p>"
								+"</div>"
								+"</a>"
								+"</div>"
					});

					$("#booklistdiv").append(html);
					
					html=data.pageCode;
// 					alert(data.pageCode);
					
					$("#booklistdiv").append(html);
				}
			});

		};
	</script>
	<script>
		// checkvalue 기능
		function checkvalue() {
			let html;
			// a 텍스트 필드와 b 텍스트 필드 중 둘다 값이 있을 때
			if (signForm.pass.value && signForm.passcheck.value) {

				// 두 필드의 값이 서로 다를 때
				if (signForm.pass.value != signForm.passcheck.value) {

					html = "<p>일치하지않습니다.</p>";
					$("#status").html(html).css("color", "red");
					$("#status").html(html).css("font-size", "12px");
					$("#status").html(html).css("height", "16.3px");
					$("#status").html(html).css("left", "16%");

					// status 필드에 일치하지 않는다는 문장 출력
					// 					joinForm.status.value = "일치하지 않습니다";

					// 그에 맞게 길이 수정
					// 					joinForm.status.style.width = "120";
					// 					joinForm.status.style.color = "red";

					// 두 필드의 값이 동일 할 때
				} else {

					html = "<p>일치합니다.</p>";
					$("#status").html(html).css("color", "highlight");
					$("#status").html(html).css("font-size", "12px");
					$("#status").html(html).css("height", "16.3px");
					$("#status").html(html).css("left", "16%");

					// status 필드에 일치한다는 문장 출력
					// 					joinForm.status.value = "일치합니다";

					// 					joinForm.status.style.color = "highlight";

					// 역시 그에 맞게 길이 수정
					// 					joinForm.status.style.width = "83";

				}

				// a 텍스트 필드와 b 텍스트 필드 두중하나라도 값이 없을 때
			} else {

				// 아무것도 입력이 안 되어 있으므로 비밀번호를 입력해 달라는 메세지를 status 필드에 출력 함
				joinForm.status.value = "비밀번호를 입력해 주세요";

				// 그에 맞게 길이 수정
				joinForm.status.style.width = "160";

				joinForm.status.style.color = "red";
			}
			if (joinForm.passc.value == null) {

			}
			form.submit();

		}
	</script>
	<script type="text/javascript">
		window.onload = function() {
			document.getElementById('login_mit').onclick = function() {
				document.getElementById('loginForm').submit();
				return false;
			};
			document.getElementById('sign_mit').onclick = function() {
				document.getElementById('signForm').submit();
				return false;
			};
		};
	</script>
	<script type="text/javascript">
// 		var overindex = 2;
// 		var outindex = 1;
// 		//book1 over	
// 		$('.book_list1').mouseenter(function() {
// 			document.getElementById('book_cap1').style.zIndex = overindex;
// 		});
// 		$('.book_list1').mouseleave(function() {
// 			document.getElementById('book_cap1').style.zIndex = outindex;
// 		});
// 		//book2 over
// 		$('.book_list2').mouseenter(function() {
// 			document.getElementById('book_cap2').style.zIndex = overindex;
// 		});
// 		$('.book_list2').mouseleave(function() {
// 			document.getElementById('book_cap2').style.zIndex = outindex;
// 		});
// 		//book3 over
// 		$('.book_list3').mouseenter(function() {
// 			document.getElementById('book_cap3').style.zIndex = overindex;
// 		});
// 		$('.book_list3').mouseleave(function() {
// 			document.getElementById('book_cap3').style.zIndex = outindex;
// 		});
// 		//book4 over
// 		$('.book_list4').mouseenter(function() {
// 			document.getElementById('book_cap4').style.zIndex = overindex;
// 		});
// 		$('.book_list4').mouseleave(function() {
// 			document.getElementById('book_cap4').style.zIndex = outindex;
// 		});
// 		//book5 over
// 		$('.book_list5').mouseenter(function() {
// 			document.getElementById('book_cap5').style.zIndex = overindex;
// 		});
// 		$('.book_list5').mouseleave(function() {
// 			document.getElementById('book_cap5').style.zIndex = outindex;
// 		});
// 		//book6 over
// 		$('.book_list6').mouseenter(function() {
// 			document.getElementById('book_cap6').style.zIndex = overindex;
// 		});
// 		$('.book_list6').mouseleave(function() {
// 			document.getElementById('book_cap6').style.zIndex = outindex;
// 		});
// 		//book7 over
// 		$('.book_list7').mouseenter(function() {
// 			document.getElementById('book_cap7').style.zIndex = overindex;
// 		});
// 		$('.book_list7').mouseleave(function() {
// 			document.getElementById('book_cap7').style.zIndex = outindex;
// 		});
// 		//book8 over
// 		$('.book_list8').mouseenter(function() {
// 			document.getElementById('book_cap8').style.zIndex = overindex;
// 		});
// 		$('.book_list8').mouseleave(function() {
// 			document.getElementById('book_cap8').style.zIndex = outindex;
// 		});
// 		//book9 over
// 		$('.book_list9').mouseenter(function() {
// 			document.getElementById('book_cap9').style.zIndex = overindex;
// 		});
// 		$('.book_list9').mouseleave(function() {
// 			document.getElementById('book_cap9').style.zIndex = outindex;
// 		});
// 		//book10 over
// 		$('.book_list10').mouseenter(function() {
// 			document.getElementById('book_cap10').style.zIndex = overindex;
// 		});
// 		$('.book_list10').mouseleave(function() {
// 			document.getElementById('book_cap10').style.zIndex = outindex;
// 		});
// 		//book11 over
// 		$('.book_list11').mouseenter(function() {
// 			document.getElementById('book_cap11').style.zIndex = overindex;
// 		});
// 		$('.book_list11').mouseleave(function() {
// 			document.getElementById('book_cap11').style.zIndex = outindex;
// 		});
// 		//book12 over
// 		$('.book_list12').mouseenter(function() {
// 			document.getElementById('book_cap12').style.zIndex = overindex;
// 		});
// 		$('.book_list12').mouseleave(function() {
// 			document.getElementById('book_cap12').style.zIndex = outindex;
// 		});
// 		//book13 over
// 		$('.book_list13').mouseenter(function() {
// 			document.getElementById('book_cap13').style.zIndex = overindex;
// 		});
// 		$('.book_list13').mouseleave(function() {
// 			document.getElementById('book_cap13').style.zIndex = outindex;
// 		});
// 		//book14 over
// 		$('.book_list14').mouseenter(function() {
// 			document.getElementById('book_cap14').style.zIndex = overindex;
// 		});
// 		$('.book_list14').mouseleave(function() {
// 			document.getElementById('book_cap14').style.zIndex = outindex;
// 		});
// 		//book15 over
// 		$('.book_list15').mouseenter(function() {
// 			document.getElementById('book_cap15').style.zIndex = overindex;
// 		});
// 		$('.book_list15').mouseleave(function() {
// 			document.getElementById('book_cap15').style.zIndex = outindex;
// 		});
	</script>
	<script type="text/javascript">
		$('.likenon').click(function() {
			getMainBookList(1);
			$('.likenon').css("display", "none");
			$('.likeselect').css("display", "block");
			$('.hitnon').css("display", "block");
			$('.updatanon').css("display", "block");
			$('.hitselect').css("display", "none");
			$('.updataselect').css("display", "none");
		});
	
		$('.hitnon').click(function() {
			getMainBookList(1);
			$('.hitnon').css("display", "none");
			$('.hitselect').css("display", "block");
			$('.likenon').css("display", "block");
			$('.likeselect').css("display", "none");
			$('.updatanon').css("display", "block");
			$('.updataselect').css("display", "none");
		});
		$('.updatanon').click(function() {
			getMainBookList(1);
			$('.updatanon').css("display", "none");
			$('.updataselect').css("display", "block");
			$('.likenon').css("display", "block");
			$('.likeselect').css("display", "none");
			$('.hitnon').css("display", "block");
			$('.hitselect').css("display", "none");

		});
		
		$('.likenon').mousedown(function() {
			// 			alert("asd");
			// 			$('.sortType').val("1");
			document.getElementById("sortType").value = "3";
			// 			document.getElementById("jender").value = "0";
		})
		$('.hitnon').mousedown(function() {
			// 			$('.sortType').val(2);

			document.getElementById("sortType").value = "2";
			// 			document.getElementById("sortType").val(2);
		})
		$('.updatanon').mousedown(function() {
			// 			$('.sortType').val(3);
			document.getElementById("sortType").value = "1";
			// 			document.getElementById("sortType").val(3);
		})
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			document.getElementById("sortType").value = "1";
			getMainBookList($("#pageNum").val());
		})
	</script>
	<script>
	
// 		function mainbooks(page) {

// 			// 		alert($("#genre").val());
// 			let html = "";
// 			$
// 					.ajax({
// 						type : "GET",
// 						async : true,
// 						dataType : "json",
// 						error : function(xhr) {
// 							alert("error html = " + xhr.statusText);
// 						},
// 						url : "/textant/main.text",
// 						data : {
// 							sortType : $("#sortType").val(),
// 							pageNum : page
// 						},
// 						success : function(data) {
// 							// 					alert(data);
// 							// 					alert(data.fileLocationList);
// 							// 					alert(data.length);
// 							$(".serchbookDiv").empty();
// 							let num = data.length;
// 							var pageCode = data.pageCode;
// 							$
// 									.each(
// 											data.fileLocationList,
// 											function(index, item) {
// 												// 						 alert(data[index].length);
// 												// 						

// 												html = '<div class="genre1_book_list'
// 														+ (index + 1)
// 														+ '"><a href="#"><img src="displayFile.text?fileName='
// 														+ item
// 														+ '/OriginImg&pageNum=1&fileType=jpg" style="border: 1px solid #D8D8D8; position: absolute; z-index: 2; height: 242px;" class="book_img_size" id="bookimg'
// 														+ (index + 1)
// 														+ '"><div style="width: 166.45px; height: 244px; position: relative; text-align: center; color: white;" class="book_cap'
// 														+ (index + 1)
// 														+ '" id="book_cap'
// 														+ (index + 1)
// 														+ '"><h5><c:out value="${lists}"></c:out> </h5><p>기시미이치로</p><br><p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p></div> </a></div>'
// 												$(".serchbookDiv").append(html);
// 												// 						 var genre=item.commentNum;
// 												// 						alert(data[index]);

// 											});
// 							$('#pageCode').html(pageCode);

// 						}
// 					});
// 		}
	</script>
	<script type="text/javascript">
		function modalemp() {
			$('#mologinId').val('Default Value');
			$('#mologinPass').empty();
		}
	</script>
</body>

</html>
