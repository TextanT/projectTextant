<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/textant/resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/footer.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/genre.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/bookover.css" rel="stylesheet"
	type="text/css">

<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<title>Insert title here</title>
<style>
a {
	text-decoration: none;
}
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
					<span
						style="margin-top: auto; margin-bottom: auto; font-size: 33px; color: white;">
						&nbsp | 창작하기</span>
				</div>
			</div>
		<div class="menu_box">
			<c:if test="${id!=null}">
				<c:out
					value="
			<a href='#' class='menu_title'><span class='menu1' id='menu1'>${nickname}</span></a>
			
			<a href='mypage.text' class='menu_title'><span class='menu2'id='menu2'>내정보</span></a> 

			<a href='logout.text' class='menu_title'><span class='menu3'id='menu3'>로그아웃</span></a> 
			
			<a href='first.text' class='menu_title'><span class='menu4'id='menu4'>처음으로</span></a>
			 "
					escapeXml="false" />
			</c:if>
			<c:if test="${id==null}">
				<c:out
					value="
			<a href='#' class='menu_title'><span class='menu1' id='menu1'>로그인</span></a>
			
			<a href='#' class='menu_title'><span class='menu2'id='menu2'>회원가입</span></a> 

			<a href='find.text' class='menu_title'><span class='menu3'id='menu3'>ID/PW찾기</span></a> 
			
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
				<a href='' class='sub_header_menu3' id="sub_menu3" style="color: highlight">장르별검색</a>
			</div>
			<div class="sub_sub3">
				<a href='/textant/write.text' class='sub_header_menu3' id="sub_menu3">책쓰기</a>
			</div>
		</div>
	</div>
	<div class="menu_top">
		<div class="menu_box1">
			<div class="list_box1">
				<ul>
					<li><a href="#">카페</a></li>
					<li><a href="#">베스트</a></li>
					<li><a href="/textant/writeAmateur.text">작품쓰기</a></li>

				</ul>
			</div>
			<div class="list_box2">
				<ul>
					<li><a href="#">창작도서</a></li>
					<li><a href="#">일반도서</a></li>
					<li style="cursor: default;">&nbsp</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="serchpos">
		<div class="serchDiv">
			<div class="serchpotionDiv">
				<div class="serchoption1" id="serchoptionid">역사</div>
				<div class="serchoption2" id="serchoptionid">스포츠</div>
				<div class="serchoption3" id="serchoptionid">SF</div>
				<div class="serchoption4" id="serchoptionid">추리</div>
				<div class="serchoption5" id="serchoptionid">공포</div>
				<div class="serchoption6" id="serchoptionid">게임</div>
				<div class="serchoption7" id="serchoptionid">판타지</div>
				<div class="serchoption8" id="serchoptionid">무협</div>
				<div class="serchoption9" id="serchoptionid">미스테리</div>
				<div class="serchoption10" id="serchoptionid">로맨스</div>
				<div class="serchoption11" id="serchoptionid">전쟁</div>
				<div class="serchoption12" id="serchoptionid">성장</div>
				<div class="serchoption13" id="serchoptionid">시</div>
				<div class="serchoption14" id="serchoptionid">수필</div>
				<div class="serchoption15" id="serchoptionid">유머</div>
				<div class="serchoption16" id="serchoptionid">액션</div>
				<input type="radio" name="1" class="radio1" onclick="radio1()" value='history'> 
    			<input type="radio" name="1" class="radio2" onclick="radio2()" value='sports'> 
    			<input type="radio" name="1" class="radio3" onclick="radio3()" value='SF'> 
    			<input type="radio" name="1" class="radio4" onclick="radio4()" value='Reasoning'>
    			<input type="radio" name="1" class="radio5" onclick="radio5()" value='horror'> 
    			<input type="radio" name="1" class="radio6" onclick="radio6()" value='game'> 
    			<input type="radio" name="1" class="radio7" onclick="radio7()" value='fantasy'>
    			<input type="radio" name="1" class="radio8" onclick="radio8()" value='arts'> 
    			<input type="radio" name="1" class="radio9" onclick="radio9()" value='mystery'> 
    			<input type="radio" name="1" class="radio10" onclick="radio10()" value='romance'>
    			<input type="radio" name="1" class="radio11" onclick="radio11()" value='war'> 
    			<input type="radio" name="1" class="radio12" onclick="radio12()" value='growth'> 
    			<input type="radio" name="1" class="radio13" onclick="radio13()" value='verse'>
    			<input type="radio" name="1" class="radio14" onclick="radio14()" value='essay'> 
    			<input type="radio" name="1" class="radio15" onclick="radio15()" value='humor'> 
    			<input type="hidden" id="pageNum" name="pageNum" value='1'> 
    			
    			<input type="text" class="genre" id="genre" name="genre" hidden>
    			
    			<input type="button" class="genget" id="genget" onclick="genresub()" hidden >
				
				</tr>
			</div>
		</div>
		<div class="serchbookDiv">
<%-- 			<c:forEach var="lists" items="${testList}"> --%>
<%-- 				<div class="genre1_book_list${lists}"> --%>
<!-- 					<a href="#"><img -->
<!-- 						src="/textant/resources/book_img/너의췌장을먹고싶어.jpg" -->
<!-- 						style="border: 1px solid #D8D8D8; position: absolute; z-index: 2; height: 242px;" -->
<!-- 						class="book_img_size"> -->
<!-- 						<div -->
<!-- 							style="width: 166.45px; height: 244px; position: relative; text-align: center; color: white;" -->
<%-- 							class="book_cap${lists}" id="book_cap${lists}"> --%>
<!-- 							<h5> -->
<%-- 								<c:out value="${lists}"></c:out> --%>
<!-- 							</h5> -->
<!-- 							<p>기시미이치로</p> -->
<!-- 							<br> -->
<!-- 							<p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다. -->
<!-- 								이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p> -->
<!-- 						</div> </a> -->
<!-- 				</div> -->
<%-- 			</c:forEach> --%>
			
		</div>
		<div id="pageCode" class="pageCode" name="pageCode"></div>
	</div>





	<footer>
	<div>
		<img height="50px" src="/textant/resources/icon_img/footer_logo.png"
			class="footer_img">
	</div>
	<address>
		Tel. 010-1234-1234<br> Fax. 051)555-555<br> E-Mail.
		cwj1102@naver.com<br> 주소. 부산광역시 남구 신선로 365 부경대학교<br> <br>
		<br> <a href="#" class="foo_a">회사소개</a> <a href="#" class="foo_a">광고문의</a>
		<a href="#" class="foo_a">제휴문의</a> <a href="#" class="foo_a">인재채용</a>
		<a href="#" class="foo_a">서비스약관</a> <a href="#" class="foo_a">고객센터</a>
		<a href="#" class="foo_a">Q&A게시판</a>
	</address>
	</footer>
	<script type="text/javascript" src="/textant/resources/js/serch.js">
		
	</script>
	
	<script type="text/javascript">
	function genresub(page){
		
// 		alert($("#genre").val());
		let html = "";
			$.ajax({
				type : "GET",
				async : true,
				dataType : "json",
				error : function(xhr) {
					alert("error html = " + xhr.statusText);
				},
				url : "/textant/genre.genre",
				data : {
					genre : $("#genre").val(),
					pageNum : page
				},success:function(data){
// 					alert(data);
// 					alert(data.fileLocationList);
// 					alert(data.length);
					$(".serchbookDiv").empty();
					let num = data.length;
					var pageCode = data.pageCode;
					 $.each(data.fileLocationList, function(index,item) {
// 						 alert(data[index].length);
// 						
						
						html='<div class="genre1_book_list'+(index+1)+'"><a href="#"><img src="displayFile.text?fileName='+item+'/OriginImg&pageNum=1&fileType=jpg" style="border: 1px solid #D8D8D8; position: absolute; z-index: 2; height: 242px;" class="book_img_size" id="bookimg'+(index+1)+'"><div style="width: 166.45px; height: 244px; position: relative; text-align: center; color: white;" class="book_cap'+(index+1)+'" id="book_cap'+(index+1)+'"><h5><c:out value="${lists}"></c:out> </h5><p>기시미이치로</p><br><p>이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.이곳에는 책의 줄거리가 들어갑니다.</p></div> </a></div>'
						$(".serchbookDiv").append(html);
// 						 var genre=item.commentNum;
// 						alert(data[index]);
						
						
					 });
					 $('#pageCode').html(pageCode);
					 var overindex = 2;
						var outindex = 1;
						//book1 over	
						$('#bookimg1').mouseenter(function() {
							document.getElementById('book_cap1').style.zIndex = overindex;
						});
						$('.genre1_book_list1').mouseleave(function() {
							document.getElementById('book_cap1').style.zIndex = outindex;
						});
						//book2 over
						$('.genre1_book_list2').mouseenter(function() {
							document.getElementById('book_cap2').style.zIndex = overindex;
						});
						$('.genre1_book_list2').mouseleave(function() {
							document.getElementById('book_cap2').style.zIndex = outindex;
						});
						//book3 over
						$('.genre1_book_list3').mouseenter(function() {
							document.getElementById('book_cap3').style.zIndex = overindex;
						});
						$('.genre1_book_list3').mouseleave(function() {
							document.getElementById('book_cap3').style.zIndex = outindex;
						});
						//book4 over
						$('.genre1_book_list4').mouseenter(function() {
							document.getElementById('book_cap4').style.zIndex = overindex;
						});
						$('.genre1_book_list4').mouseleave(function() {
							document.getElementById('book_cap4').style.zIndex = outindex;
						});
						//book5 over
						$('.genre1_book_list5').mouseenter(function() {
							document.getElementById('book_cap5').style.zIndex = overindex;
						});
						$('.genre1_book_list5').mouseleave(function() {
							document.getElementById('book_cap5').style.zIndex = outindex;
						});
						//book6 over
						$('.genre1_book_list6').mouseenter(function() {
							document.getElementById('book_cap6').style.zIndex = overindex;
						});
						$('.genre1_book_list6').mouseleave(function() {
							document.getElementById('book_cap6').style.zIndex = outindex;
						});
						//book7 over
						$('.genre1_book_list7').mouseenter(function() {
							document.getElementById('book_cap7').style.zIndex = overindex;
						});
						$('.genre1_book_list7').mouseleave(function() {
							document.getElementById('book_cap7').style.zIndex = outindex;
						});
						//book8 over
						$('.genre1_book_list8').mouseenter(function() {
							document.getElementById('book_cap8').style.zIndex = overindex;
						});
						$('.genre1_book_list8').mouseleave(function() {
							document.getElementById('book_cap8').style.zIndex = outindex;
						});
						//book9 over
						$('.genre1_book_list9').mouseenter(function() {
							document.getElementById('book_cap9').style.zIndex = overindex;
						});
						$('.genre1_book_list9').mouseleave(function() {
							document.getElementById('book_cap9').style.zIndex = outindex;
						});
						//book10 over
						$('.genre1_book_list10').mouseenter(function() {
							document.getElementById('book_cap10').style.zIndex = overindex;
						});
						$('.genre1_book_list10').mouseleave(function() {
							document.getElementById('book_cap10').style.zIndex = outindex;
						});
						//book11 over
						$('.genre1_book_list11').mouseenter(function() {
							document.getElementById('book_cap11').style.zIndex = overindex;
						});
						$('.genre1_book_list11').mouseleave(function() {
							document.getElementById('book_cap11').style.zIndex = outindex;
						});
						//book12 over
						$('.genre1_book_list12').mouseenter(function() {
							document.getElementById('book_cap12').style.zIndex = overindex;
						});
						$('.genre1_book_list12').mouseleave(function() {
							document.getElementById('book_cap12').style.zIndex = outindex;
						});
						//book13 over
						$('.genre1_book_list13').mouseenter(function() {
							document.getElementById('book_cap13').style.zIndex = overindex;
						});
						$('.genre1_book_list13').mouseleave(function() {
							document.getElementById('book_cap13').style.zIndex = outindex;
						});
						//book14 over
						$('.genre1_book_list14').mouseenter(function() {
							document.getElementById('book_cap14').style.zIndex = overindex;
						});
						$('.genre1_book_list14').mouseleave(function() {
							document.getElementById('book_cap14').style.zIndex = outindex;
						});
						//book15 over
						$('.genre1_book_list15').mouseenter(function() {
							document.getElementById('book_cap15').style.zIndex = overindex;
						});
						$('.genre1_book_list15').mouseleave(function() {
							document.getElementById('book_cap15').style.zIndex = outindex;
						});
					
				}
			});
		}
	
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
	<script type="text/javascript">
		var overindex = 2;
		var outindex = 1;
		//book1 over	
		$('.genre1_book_list1').mouseenter(function() {
			document.getElementById('book_cap1').style.zIndex = overindex;
		});
		$('.genre1_book_list1').mouseleave(function() {
			document.getElementById('book_cap1').style.zIndex = outindex;
		});
		//book2 over
		$('.genre1_book_list2').mouseenter(function() {
			document.getElementById('book_cap2').style.zIndex = overindex;
		});
		$('.genre1_book_list2').mouseleave(function() {
			document.getElementById('book_cap2').style.zIndex = outindex;
		});
		//book3 over
		$('.genre1_book_list3').mouseenter(function() {
			document.getElementById('book_cap3').style.zIndex = overindex;
		});
		$('.genre1_book_list3').mouseleave(function() {
			document.getElementById('book_cap3').style.zIndex = outindex;
		});
		//book4 over
		$('.genre1_book_list4').mouseenter(function() {
			document.getElementById('book_cap4').style.zIndex = overindex;
		});
		$('.genre1_book_list4').mouseleave(function() {
			document.getElementById('book_cap4').style.zIndex = outindex;
		});
		//book5 over
		$('.genre1_book_list5').mouseenter(function() {
			document.getElementById('book_cap5').style.zIndex = overindex;
		});
		$('.genre1_book_list5').mouseleave(function() {
			document.getElementById('book_cap5').style.zIndex = outindex;
		});
		//book6 over
		$('.genre1_book_list6').mouseenter(function() {
			document.getElementById('book_cap6').style.zIndex = overindex;
		});
		$('.genre1_book_list6').mouseleave(function() {
			document.getElementById('book_cap6').style.zIndex = outindex;
		});
		//book7 over
		$('.genre1_book_list7').mouseenter(function() {
			document.getElementById('book_cap7').style.zIndex = overindex;
		});
		$('.genre1_book_list7').mouseleave(function() {
			document.getElementById('book_cap7').style.zIndex = outindex;
		});
		//book8 over
		$('.genre1_book_list8').mouseenter(function() {
			document.getElementById('book_cap8').style.zIndex = overindex;
		});
		$('.genre1_book_list8').mouseleave(function() {
			document.getElementById('book_cap8').style.zIndex = outindex;
		});
		//book9 over
		$('.genre1_book_list9').mouseenter(function() {
			document.getElementById('book_cap9').style.zIndex = overindex;
		});
		$('.genre1_book_list9').mouseleave(function() {
			document.getElementById('book_cap9').style.zIndex = outindex;
		});
		//book10 over
		$('.genre1_book_list10').mouseenter(function() {
			document.getElementById('book_cap10').style.zIndex = overindex;
		});
		$('.genre1_book_list10').mouseleave(function() {
			document.getElementById('book_cap10').style.zIndex = outindex;
		});
		//book11 over
		$('.genre1_book_list11').mouseenter(function() {
			document.getElementById('book_cap11').style.zIndex = overindex;
		});
		$('.genre1_book_list11').mouseleave(function() {
			document.getElementById('book_cap11').style.zIndex = outindex;
		});
		//book12 over
		$('.genre1_book_list12').mouseenter(function() {
			document.getElementById('book_cap12').style.zIndex = overindex;
		});
		$('.genre1_book_list12').mouseleave(function() {
			document.getElementById('book_cap12').style.zIndex = outindex;
		});
		//book13 over
		$('.genre1_book_list13').mouseenter(function() {
			document.getElementById('book_cap13').style.zIndex = overindex;
		});
		$('.genre1_book_list13').mouseleave(function() {
			document.getElementById('book_cap13').style.zIndex = outindex;
		});
		//book14 over
		$('.genre1_book_list14').mouseenter(function() {
			document.getElementById('book_cap14').style.zIndex = overindex;
		});
		$('.genre1_book_list14').mouseleave(function() {
			document.getElementById('book_cap14').style.zIndex = outindex;
		});
		//book15 over
		$('.genre1_book_list15').mouseenter(function() {
			document.getElementById('book_cap15').style.zIndex = overindex;
		});
		$('.genre1_book_list15').mouseleave(function() {
			document.getElementById('book_cap15').style.zIndex = outindex;
		});
	</script>
</body>
</html>