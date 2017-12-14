<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/textant/resources/css/header.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/footer.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/myStudy-theme.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/myStudy.css" rel="stylesheet"
	type="text/css">
    <link href="header.css" rel="stylesheet" type="text/css">
    <link href="footer.css" rel="stylesheet" type="text/css">
    
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <style>
    	
        .mybooks {
            width: 1260px;
            height: 1300px; /* border: 1px solid black;*/ /* background: white;*/
            margin: auto;
            margin-bottom: 15px;
            margin-top: 15px;
        }
        
        .mycomment {
            width: 580px;
            height: 200px;
            border: 1px solid black;
            float: left;
            margin-left: 20px;
            /*            margin-top: 20px;*/
        }
        
        .mywritebook {
            width: 580px;
            height: 200px;
            border: 1px solid black;
            float: left;
            margin-left: 55px;
            /*            margin-top: 20px;*/
        }
        
        .mycommentTocomment {
            width: 580px;
            height: 200px;
            border: 1px solid black;
            float: left;
            margin-left: 20px;
            /*            margin-top: 60px;*/
        }
        
        .myreadbook {
            width: 580px;
            height: 200px;
            border: 1px solid black;
            float: left;
            margin-left: 55px;
            /*            margin-top: 60px;*/
        }
        .mm{
            margin-top: 50px;
        }
        
        #ex {
            font-size: 15px;
            text-align: center;
            height: 50px;
            width: 580px;
            /*            border: 1px solid;*/
            margin-left: 20px;
            float: left;
            margin-top: 30px;
        }
        
        #exx {
            font-size: 15px;
            text-align: center;
            height: 50px;
            width: 580px;
            /*            border: 1px solid;*/
            margin-left: 55px;
            float: left;
            margin-top: 30px;
        }
        
        .mylikebook {
            width: 1217px;
            height: 225px;
            border: 1px solid black;
            float: left;
            margin-left: 20px;
        }
        
        #likeex {
            font-size: 15px;
            text-align: center;
            height: 50px;
            width: 1217px;
            /*            border: 1px solid;*/
            margin-left: 20px;
            float: left;
            margin-top: 30px;
        }
        
        .bookmark {
            width: 1217px;
            height: 225px;
            border: 1px solid black;
            float: left;
            margin-left: 20px;
        }
        
        #markex {
            font-size: 15px;
            text-align: center;
            height: 50px;
            width: 1217px;
            /*            border: 1px solid;*/
            margin-left: 20px;
            float: left;
            margin-top: 30px;
        }

    </style>
</head>

<body>
    <div class="header">
        <input type="hidden" id="pageNum" name="pageNum" value="1">
        <div class="header_logo" style="padding-top: 20px;">
            <div style="float:left;">
                <a href="/textant/main.text" class="logo_a" style="height:55px;"> <img src="icon_img/logo_mini.png" class="logo">
                </a>
            </div>
            <div style="float:left;"><span style="margin-top: auto; margin-bottom: auto;font-size: 33px; color: white;"> &nbsp | 내 서재</span></div>
        </div>
        <div class="menu_box">
            <c:if test="${id!=null}">
                <c:out value="
			<a href='#' class='menu_title'><span class='menu1' id='menu1'>${id}</span></a>
			
			<a href='mypage.text' class='menu_title'><span class='menu2'id='menu2'>내정보</span></a> 

			<a href='logout.text' class='menu_title'><span class='menu3'id='menu3'>로그아웃</span></a> 
			
			<a href='first.text' class='menu_title'><span class='menu4'id='menu4'>처음으로</span></a>
			 " escapeXml="false" />
            </c:if>

        </div>
    </div>

    <div class="sub_header">
        <div class="menu_dd">
            <div class="sub_sub1">
                <a href='' class='sub_header_menu1'>내서재</a>
            </div>
            <div class="sub_sub2">
                <a href='/textant/write.text' class='sub_header_menu2' id="sub_menu2">창작카페</a>
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
    <div class="mybooks">
        <div id="ex" class="mm">
            <h3>내가 찜 한책<a href="/textant/myWishView.text?pageNum=1" style="font-size: 13px; position: absolute; top:280px; left: 550px;">더 보기</a></h3>
        </div>
        <div id="exx" class="mm">
            <h3>내가 쓴 책<a href="/textant/myBookWriteView.text?pageNum=1"style="font-size: 13px; position: absolute; top:280px; left: 1185px;">더 보기</a></h3>
        </div>
        <div class="mycomment">
<!--         	<div style="text-align: right;"><a href="/textant/myWishView.text?pageNum=1">더 보기</a></div> -->
        	<c:forEach var="wish" items="${wishList}">
						<div style="; display: inline-block; margin-top: 1px">
							<a href="/textant/read.text?fileName=${wish.fileLocation}">
						<div style="height: 152px; width: 140px; overflow: hidden;">
								<img src="displayFile.text?fileName=${wish.fileLocation}/OriginImg&pageNum=1&fileType=jpg"
									 style="display: block; height: 100%; width: auto;"
									class="bookimg" />
							</div> 
							<span style="position: relative; left: 45px" class="bookname">${wish.bookName}</span>
							</a>
						</div>
					</c:forEach>
					
        </div>
        
        <div class="mywritebook">
<!--         	<div style="text-align: right;"><a href="/textant/myBookWriteView.text?pageNum=1">더 보기</a></div> -->
        	<c:forEach var="bookWrite" items="${bookWriteList}">
						<div style="; display: inline-block; margin-top: 1px">
							<a href="/textant/read.text?fileName=${bookWrite.fileLocation}">
						<div style="height: 152px; width: 140px; overflow: hidden;">

								<img src="displayFile.text?fileName=${bookWrite.fileLocation}/OriginImg&pageNum=1&fileType=jpg"
									 style="display: block; height: 100%; width: auto;"
									class="bookimg" />

							</div> 
							<span style="position: relative; left: 45px" class="bookname">${bookWrite.bookName}</span>
							</a>
						</div>
					</c:forEach>
        </div>
        <div id="ex">
            <h3>북 마크<a href="/textant/myBookMarkView.text?pageNum=1"style="font-size: 13px; position: absolute; top:560px; left: 550px;">더 보기</a></h3>
        </div>
        <div id="exx">
            <h3>내가 읽은 책<a href="/textant/myBookReadView.text?pageNum=1"style="font-size: 13px; position: absolute; top:560px; left: 1185px;">더 보기</a></h3>
        </div>
        <div class="mycommentTocomment">
<!--         	<div style="text-align: right;"><a href="/textant/myBookMarkView.text?pageNum=1">더 보기</a></div> -->
        	<c:forEach var="bookMark" items="${bookMarkList}">
						<div style="; display: inline-block; margin-top: 1px">
							<a href="/textant/read.text?fileName=${bookMark.fileLocation}">
						<div style="height: 152px; width: 140px; overflow: hidden;">

								<img src="displayFile.text?fileName=${bookMark.fileLocation}/OriginImg&pageNum=1&fileType=jpg"
									 style="display: block; height: 100%; width: auto;"
									class="bookimg" />

							</div> 
							<span style="position: relative; left: 45px" class="bookname">${bookMark.bookName}</span>
							</a>
						</div>
					</c:forEach>
        </div>
        <div class="myreadbook">
<!--         	<div style="text-align: right;"><a href="/textant/myBookReadView.text?pageNum=1">더 보기</a></div> -->
        	<c:forEach var="bookRead" items="${bookReadList}">
						<div style="; display: inline-block; margin-top: 1px">
							<a href="/textant/read.text?fileName=${bookRead.fileLocation}">
						<div style="height: 152px; width: 140px; overflow: hidden;">
								<img src="displayFile.text?fileName=${bookRead.fileLocation}/OriginImg&pageNum=1&fileType=jpg"
									 style="display: block; height: 100%; width: auto;"
									class="bookimg" />

							</div> 
							<span style="position: relative; left: 45px" class="bookname">${bookRead.bookName}</span>
							</a>
						</div>
					</c:forEach>
        </div>
        <div id="likeex">
            <h3>내가 쓴 댓글<a href="/textant/myCommentView.text?pageNum=1"style="font-size: 13px; position: absolute; top:840px; left: 1185px;">더 보기</a></h3>
        </div>
        <div class="mylikebook" style="overflow: scroll;">
<!--         	<div style="text-align: right;"><a href="/textant/myCommentView.text?pageNum=1">더 보기</a></div> -->
        	<table class="table" style="margin-left: auto; margin-right: auto;text-align: center;">
				<tr>
					<td width="10%;">댓글번호</td>
					<td width="20%;">제목</td>
					<td width="10%;">페이지</td>
					<td width="45%;">내용</td>
					<td width="15%;">날짜</td>					
					</tr>
					<c:forEach var="comment" items="${commentList}">
					<tr>
					<td><c:out value="${comment.commentNum}"/></td>
					<td><c:out value="${comment.bookName}"/></td>
					<td><c:out value="${comment.pageGroup}"/></td>
					<td><c:out value="${comment.conet}"/></td>
					<td><c:out value="${comment.writeDate.substring(0,10)}"/></td>
					</tr>
					</c:forEach>
				</table>
        </div>
        <div id="markex">
            <h3>내가 쓴 답글<a href="/textant/myCommentReplyView.text?pageNum=1"style="font-size: 13px; position: absolute; top:1146px; left: 1185px;">더 보기</a></h3>
        </div>
        <div class="bookmark">
        	<table class="table" style="margin-left: auto; margin-right: auto;text-align: center;">
				<tr>
					<td width="10%;">댓글번호</td>
					<td width="20%;">제목</td>
					<td width="10%;">페이지</td>
					<td width="10%;">답글 대상</td>
					<td width="35%;">내용</td>
					<td width="15%;">날짜</td>					
					</tr>
					<c:forEach var="commentReply" items="${commentReplyList}">
					<tr>
					<td><c:out value="${commentReply.commentNum}"/></td>
					<td><c:out value="${commentReply.bookName}"/></td>
					<td><c:out value="${commentReply.pageGroup}"/></td>
					<td><c:out value="${commentReply.replyTarget}"/></td>
					<td><c:out value="${commentReply.conet}"/></td>
					<td><c:out value="${commentReply.writeDate.substring(0,10)}"/></td>
					</tr>
					</c:forEach>
				</table>
        </div>
    </div>

    <footer>
        <div>
            <img height="50px" src="icon_img/footer_logo.png" class="footer_img">
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
        <a href="#" id="MOVE_TOP_BTN"><img src="/textant/resources/icon_img/top.jpg"></a>
    </div>
</body>

</html>
