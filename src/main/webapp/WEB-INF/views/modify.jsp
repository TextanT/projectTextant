<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <link href="/textant/resources/css/header.css" rel="stylesheet" type="text/css">
	<link href="/textant/resources/css/footer.css" rel="stylesheet" type="text/css">
    <title>내 정보 수정</title>
    <style>
        .mypagepos {
            border: 1px solid black;
            width: 75%;
            height: 1300px;
            background: white;
            margin: auto;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        
        .nameput {
            width: 600px;
            height: 40px;
            margin-top: 100px;
            margin-left: 50px;
        }
        
        .idput {
            width: 550px;
            height: 40px;
            margin-top: 80px;
            margin-left: 50px;
        }
        
        .nicknameput {
            width: 550px;
            height: 40px;
            margin-top: 30px;
            margin-left: 50px;
        }
        
        .passput {
            width: 550px;
            height: 40px;
            margin-top: 30px;
            margin-left: 50px;
        }
        
        .passcput {
            width: 550px;
            height: 40px;
            margin-top: 30px;
            margin-left: 50px;
        }
        
        .mailput {
            width: 600px;
            height: 40px;
            margin-top: 80px;
            margin-left: 50px;
        }
        
        .genderput {
            width: 600px;
            height: 40px;
            margin-top: 30px;
            margin-left: 50px;
        }
        
        .ageput {
            width: 600px;
            height: 40px;
            margin-top: 30px;
            margin-left: 50px;
        }
        
        .comput {
            width: 600px;
            height: 40px;
            margin-top: 80px;
            margin-left: 50px;
        }
        
        .buttonbox {
            width: 600px;
            height: 40px;
            margin-left: 370px;
            margin-top: 300px;
        }
        
        input {
            margin: 0;
        }
        
        .nameputT {
            width: 50%;
            height: 100%;
            border: none;
            font-size: 1em;
            padding-left: 5px;
            /*            font-style: oblique;*/
            display: inline;
            outline: none;
            box-sizing: border-box;
            color: black;
            border: 1px solid gray;
            margin-left: 80px;
        }
        
        .nicknameputT {
            width: 75.7%;
            height: 100%;
            border: none;
            font-size: 1em;
            padding-left: 5px;
            /*            font-style: oblique;*/
            display: inline;
            outline: none;
            box-sizing: border-box;
            color: black;
            border: 1px solid gray;
            margin-left: 80px;
        }
        
        .idputT {
            width: 75.7%;
            height: 100%;
            border: none;
            font-size: 1em;
            padding-left: 5px;
            /*            font-style: oblique;*/
            display: inline;
            outline: none;
            box-sizing: border-box;
            color: black;
            border: 1px solid gray;
            margin-left: 65px;
        }
        
        .passputT {
            width: 75.7%;
            height: 100%;
            border: none;
            font-size: 1em;
            padding-left: 5px;
            /*            font-style: oblique;*/
            display: inline;
            outline: none;
            box-sizing: border-box;
            color: black;
            border: 1px solid gray;
            margin-left: 50px;
        }
        
        .passcputT {
            width: 75.7%;
            height: 100%;
            border: none;
            font-size: 1em;
            padding-left: 5px;
            /*            font-style: oblique;*/
            display: inline;
            outline: none;
            box-sizing: border-box;
            color: black;
            border: 1px solid gray;
            margin-left: 20px;
        }
        
        .mailputT {
            width: 50%;
            height: 100%;
            border: none;
            font-size: 1em;
            padding-left: 5px;
            /*            font-style: oblique;*/
            display: inline;
            outline: none;
            box-sizing: border-box;
            color: black;
            border: 1px solid gray;
            margin-left: 67px;
        }
        
        .genderputT {
            width: 50%;
            height: 100%;
            border: none;
            font-size: 1em;
            padding-left: 5px;
            /*            font-style: oblique;*/
            display: inline;
            outline: none;
            box-sizing: border-box;
            color: black;
            border: 1px solid gray;
            margin-left: 80px;
        }
        
        .ageputT {
            width: 50%;
            height: 100%;
            border: none;
            font-size: 1em;
            padding-left: 5px;
            /*            font-style: oblique;*/
            display: inline;
            outline: none;
            box-sizing: border-box;
            color: black;
            border: 1px solid gray;
            margin-left: 80px;
        }
        
        .computT {
            width: 69.4%;
            height: 200px;
            border: none;
            font-size: 15px;
            padding-left: 5px;
            /*            font-style: oblique;*/
            display: inline;
            outline: none;
            box-sizing: border-box;
            color: black;
            border: 1px solid gray;
            margin-left: 115px;
            margin-top: -20px;
            resize: none;
        }
        
        .proB[type=button] {
            width: 20%;
            height: 100%;
            background-color: lightgray;
            background-color: lightgray;
            font-size: 12px;
            color: gray;
            outline: none;
            display: inline;
            margin-left: -10px;
            /*            box-sizing: border-box;*/
            border: 1px solid gray;
            border-left: none;
            cursor: pointer;
        }
        
        .proB[type=button]:hover {
            background-color: gray;
            color: white;
        }
        
        .comit[type=button] {
            width: 20%;
            height: 100%;
            background-color: lightgray;
            background-color: lightgray;
            font-size: 12px;
            color: gray;
            outline: none;
            display: inline;
            margin-left: -10px;
            /*            box-sizing: border-box;*/
            border: 1px solid gray;
            /*            border-left: none;*/
            cursor: pointer;
        }
        
        .comit[type=button]:hover {
            background-color: gray;
            color: white;
        }
        
        .exit[type=button] {
            width: 20%;
            height: 100%;
            background-color: lightgray;
            background-color: lightgray;
            font-size: 12px;
            color: gray;
            outline: none;
            display: inline;
            margin-left: -10px;
            /*            box-sizing: border-box;*/
            border: 1px solid gray;
            /*            border-left: none;*/
            cursor: pointer;
        }
        
        .exit[type=button]:hover {
            background-color: gray;
            color: white;
        }
        
        .prof {
            /*            position: absolute;*/
            float: right;
            margin-right: 100px;
            width: 200px;
            height: 250px;
            border: 1px solid gray;
        }

    </style>
</head>

<body>
    <div class="header">
        <div class="header_logo" style="padding-top: 20px;">
            <a href="/textant/main.text" class="logo_a"> <img src="/textant/resources/icon_img/logo_mini.png" class="logo"> </a>
        </div>
        <div class="menu_box">
            <c:if test="${id!=null}">
                <c:out value="
			<a href='#' class='menu_title'><span class='menu1' id='menu1'>${id}</span></a>
			
			<a href='mypage.text' class='menu_title'><span class='menu2'id='menu2'>내정보</span></a> 

			<a href='logout.text' class='menu_title'><span class='menu3'id='menu3'>로그아웃</span></a> 
			
			<a href='first.text' class='menu_title'><span class='menu4'id='menu4'>처음으로</span></a>
			 " escapeXml="false" /> </c:if>
        </div>
    </div>
    <div class="sub_header">
        <div class="menu_dd">
            <div class="sub_sub1"> <a href='' class='sub_header_menu1'>내서재</a> </div>
            <div class="sub_sub2"> <a href='/textant/write.text' class='sub_header_menu2' id="sub_menu2" style="color: highlight">창작카페</a> </div>
            <div class="sub_sub3"> <a href='' class='sub_header_menu3' id="sub_menu3">장르별</a> </div>
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

	<form action="/textant/modify.text" method="post">
		<input type="hidden" name="userNum" value="${userNum}">
		<input type="hidden" name="userId" value="${userId}">
        <div class="mypagepos">
<!--             <div class="nameput"> -->
<!--                 <div style="font-size: 15px; display: inline;">이름</div> -->
<%--                 <input type="text" name="name" value="${memberDto.realName}" readonly="readonly" class="nameputT"> --%>
<!--                 <input type="button" name="name" value="공개" class="proB"> </div> -->
                <div class="prof">
	                <table>
			   			<tbody>			
							<tr>
								<td align="center" style="border:1px solid #eeeeee; padding:4px 0 4px 0;">
								<img src="/textant/resources/mpImage/dara_e.jpg" width="150" alt=""></td>
							</tr>							
							<tr>
								<td height="20"></td>
							</tr>							
	                		<tr>
								<td class="textLine_16" style="text-align:left;"><b>사진 등록</b>
								<a href="javascript: void(0);" onclick="memberImgUpPop();">
								<img src="/textant/resources/mpImage/btn_miniEdit.gif" align="absmiddle" class="ml2 mb2"></a>
								</td>
							</tr>											
						 </tbody>						 	 
	                </table>	                
	              </div>
	             
			
            <div class="nicknameput">
                <div style="font-size: 15px; display: inline;">별명</div>
                <input type="text" name="nickName" value=""  placeholder="별명"  class="nicknameputT"> </div>
            <div class="idput">
                <div style="font-size: 15px; display: inline;">아이디</div>
                <input type="text" name="userId" value="${memberDto.userId}" placeholder="아이디" readonly="readonly" class="idputT"> </div>
            <div class="passput">
                <div style="font-size: 15px; display: inline; ">비밀번호</div>
                <input type="passward" name="pass" value="" placeholder="비밀번호"  class="passputT"> </div>
            <div class="passcput">
                <div style="font-size: 15px; display: inline; ">비밀번호확인</div>
                <input type="passward" name="pass_check" value="" placeholder="비밀번호확인"  class="passcputT"> </div>
            <div class="mailput">
                <div style="font-size: 15px; display: inline;">E-Mail</div>
                <input type="text" name="email" value=""  placeholder="이메일"  class="mailputT">
                <input type="button" name="name" value="공개" class="proB"> </div>
            <div class="genderput">
                <div style="font-size: 15px; display: inline;">성별</div>
                <input type="text" name="gender" value="${memberDto.gender}" readonly="readonly" class="genderputT">
                <input type="button" name="name" value="공개" class="proB"> </div>
            <div class="ageput">
                <div style="font-size: 15px; display: inline;">나이</div>
                <input type="text" name="age" value="${memberDto.age}"  readonly="readonly" class="ageputT">
                <input type="button" name="name" value="공개" class="proB"> </div>
            <div class="comput">
                <div style="font-size: 15px;">소개</div>
                <textarea name="comments" cols="60" rows="5" value="${memberDto.comments}" placeholder="자기소개 하기"  class="computT"></textarea>
            </div>
            <div class="buttonbox">            	
		            	
		                <input type="submit"  value="수정하기" class="comit">
		                	               
             </div>
        </div>
    </form>
    <footer>
        <div> <img height="50px" src="/textant/resources/icon_img/footer_logo.png" class="footer_img"> </div> <address>
		Tel. 010-1234-1234<br> Fax. 051)555-555<br> E-Mail.
		cwj1102@naver.com<br> 주소. 부산광역시 남구 신선로 365 부경대학교<br> <br>
		<br> <a href="#" class="foo_a">회사소개</a> <a href="#" class="foo_a">광고문의</a>
		<a href="#" class="foo_a">제휴문의</a> <a href="#" class="foo_a">인재채용</a>
		<a href="#" class="foo_a">서비스약관</a> <a href="#" class="foo_a">고객센터</a>
		<a href="#" class="foo_a">Q&A게시판</a>
	</address> </footer>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    
	function memberImgUpPop() {
		var w = 630;
		var h = 600;
		var t = (screen.height - h) / 2;
		var l = (screen.width - w) / 2;;
		window.open('/textant/Member_Icon_Edit.text', 'Member_Icon_Edit', 'scrollbars=yes,width='+ w +', height='+ h +', top='+ t +', left='+ l);
	}

	
	function open_popup(name, url, width, height){
		window.open(url,name,'width='+width+'px, height='+height+'px, scrollbars=no,menubar=no,location=no,toolbar=no;');
	}

    </script>
</body>

</html>
