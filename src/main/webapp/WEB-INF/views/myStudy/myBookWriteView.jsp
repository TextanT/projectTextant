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
<!-- <link href="/textant/resources/css/genre.css" rel="stylesheet" -->
<!-- 	type="text/css"> -->
<link href="/textant/resources/css/bookover.css" rel="stylesheet"
	type="text/css">

<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<title>TEXTANT</title><style>


a {
	text-decoration: none;
}
h1{
	font-size: 400%;
	margin-left: 4%;
	margin-top: 3%
}
#pageCode{
	margin-left: 45%;
}
  .serchpos {
        display: block;
        margin-left: auto;
        margin-right: auto;
        margin-top: 10%;
        /*        padding-top: 1%;*/
        padding-bottom: 1%;
        border: 1px solid #D8D8D8;
        width: 1012px;
        height: 1220px;
        background: white;
        margin-top: 20px;
/*        margin-bottom: 20px;*/
    }
    
    .serchDiv {
        width: 100%;
        height: 150px;
    }
    
    .serchpotionDiv {
        margin-left: 2.8%;
        padding-top: 2%;
    }
    
    .serchoption1 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
    }
    
    .serchoption2 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
    }
    
    .serchoption3 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
    }
    
    .serchoption4 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
    }
    
    .serchoption5 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
    }
    
    .serchoption6 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
    }
    
    .serchoption7 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
    }
    
    .serchoption8 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
    }
    
    .serchoption9 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
    }
    
    .serchoption10 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
    }
    
    .serchoption11 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
    }
    
    .serchoption12 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
        margin-top: 5px;
    }
    
    .serchoption13 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
        margin-top: 5px;
    }
    
    .serchoption14 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
        margin-top: 5px;
    }
    
    .serchoption15 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
        margin-top: 5px;
    }
    .serchoption16 {
        width: 80px;
        height: 35px;
        border: 1px solid #e8e8e8;
        text-align: center;
        line-height: 33px;
        cursor: pointer;
        float: left;
        margin-top: 5px;
    }
    
    .serchoption1:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption2:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption3:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption4:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption5:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption6:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption7:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption8:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption9:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption10:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption11:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption12:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption13:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption14:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption15:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    .serchoption16:hover {
        color: #819FF7;
        border: 1px solid #819FF7;
    }
    
    #serchoptionid {
        margin-left: 5px;
    }
    
    .serchbookDiv {
        margin: auto;
        margin-top: 5%;
        padding-top: 1%;
        width: 95%;
        height: 75%;
        border: 1px solid #BDBDBD;
    }
    
    .genre1_book_list {
        margin-left: 2%;
        margin-bottom: 2%;
        float: left;
    }
    
    
    .book_cap1 {
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 1;
        /* 	display: none; */
    }
    
    .book_cap1>p {
        font-size: 15px;
    }
    
    .book_cap1>h5 {
        padding-top: 10px;
    }
</style>
</head>
<body>
	<input type="hidden" id="pagaNum" name="pagaNum">
	<div class="header">
		<div class="header_logo" style="padding-top: 20px;">
			<a href="/textant/main.text" class="logo_a"> <img
				src="/textant/resources/icon_img/logo_mini.png" class="logo">
			</a>
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
				<a href='' class='sub_header_menu1' style="color: highlight">내서재</a>
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
					<li><a href="/textant/write.text">작품쓰기</a></li>

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
	
	<div class="serchpos">
			<h1>내가 쓴책</h1>
		<div class="serchbookDiv">
			<c:forEach var="bookWrite" items="${bookWriteList}">
				<div class="genre1_book_list" onmouseenter="bookCapOn(${bookWrite.bookArticleNum})" onmouseleave="bookCapOff(${bookWrite.bookArticleNum})">
					<a name="bookArticleNum" href="/textant/myBookWriteDelete.text?pageNum=${pageNum}&bookArticleNum=${bookWrite.bookArticleNum}">삭제</a><br>
					<a href="/textant/read.text?fileName=${bookWrite.fileLocation}">
						<img src="displayFile.text?fileName=${bookWrite.fileLocation}/OriginImg&pageNum=1&fileType=jpg" style="border: 1px solid #D8D8D8; width: 166.45px; height: 244px; position: absolute; z-index: 2; height: 242px;" class="book_img_size" id="bookimg" >
							
							<div style="width: 166.45px; height: 244px; position: relative; text-align: center; color: white; background: gray;z-index: 1; background-color: rgba(0, 0, 0, 0.5);" class="book_cap${bookWrite.bookArticleNum}" id="book_cap${bookWrite.bookArticleNum}">
<%-- 								<h5><c:out value="${bookWrite}"></c:out></h5> --%>
     								<p>${bookWrite.bookName}</p>
									<br>
									<p>${bookWrite.bookDesc}</p>
							</div> 
<!-- 																																				<div style="width: 176.66px; height: 259px; position: relative;" class="book_cap15" id="book_cap15"> -->
					</a>
				</div>
			</c:forEach>
		</div>
		<div id="pageCode">${pageCode}</div></div>
	</div>





	<%@include file="../footer.jsp" %>
	<script type="text/javascript" src="/textant/resources/js/serch.js">
		
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
// 		$('.book_list1').mouseenter(function() {
// 			document.getElementById('book_cap1').style.zIndex = overindex;
// 		});
// 		$('.book_list1').mouseleave(function() {
// 			document.getElementById('book_cap1').style.zIndex = outindex;
// 		});
		
		function bookCapOn(CapNum) {
// 			alert("1"+CapNum);
			document.getElementById("book_cap"+CapNum).style.zIndex = overindex;
		}
// 		alert("2"+CapNum);
		function bookCapOff(CapNum) {
// 			alert("1"+CapNum);
			document.getElementById("book_cap"+CapNum).style.zIndex = outindex;
		}
	</script>
</body>
</html>