<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/textant/resources/css/header.css" rel="stylesheet" type="text/css">
<title>TEXTANT | MY PAGE</title>
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
			<div style="float: left;">
				<a href="/textant/main.text" class="logo_a" style="height: 55px;">
					<img src="/textant/resources/icon_img/logo_mini.png" class="logo">
				</a>
			</div>
			<div style="float: left;">
				<a href="/textant/mypage.text" style="text-decoration: none;"><span
					style="margin-top: auto; margin-bottom: auto; font-size: 33px; color: white;">
						&nbsp | 내정보</span></a>
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
	<%@include file="topMenu.jsp" %>
	
	<form action="/textant/mypage.text" method="post">
    	<input type="hidden" name="userNum" value="${userNum}">
        <div class="mypagepos">
<!--             <div class="nameput"> -->
<!--                 <div style="font-size: 15px; display: inline;">이름</div> -->
<%--                 <input type="text" name="realName" value="${memberDto.realName}" readonly="readonly" class="nameputT"> --%>
<!--                 </div> -->
                <div class="prof">
	                <table>
			   			<tbody>			
							<tr>
								<td align="center" style="border:1px solid #eeeeee; padding:4px 0 4px 0;">
								<img src="/textant/resources/mpImage/profile1.jpg" width="194" alt=""></td>
							</tr>
							<tr>
								<td height="20"></td>
							</tr>
						 </tbody>         
	                </table>
	              </div>

            <div class="nicknameput">
                <div style="font-size: 15px; display: inline;">별명</div>
                <input type="text" name="nickName" value="${memberDto.nickName}" readonly="readonly" class="nicknameputT"> </div>
            <div class="idput">
                <div style="font-size: 15px; display: inline;">아이디</div>
                <input type="text" name="userId" value="${memberDto.userId}" readonly="readonly" class="idputT"> 
            </div>
            <div class="mailput">
                <div style="font-size: 15px; display: inline;">E-Mail</div>
                <input type="text" name="email" value="${memberDto.email}" readonly="readonly" class="mailputT">
             </div>
            <div class="genderput">
                <div style="font-size: 15px; display: inline;">성별</div>
                <input type="text" name="gender" value="${memberDto.gender}" readonly="readonly" class="genderputT">
            </div>
            <div class="ageput">
                <div style="font-size: 15px; display: inline;">나이</div>
                <input type="text" name="age" value="${memberDto.age}" readonly="readonly" class="ageputT">
            </div>
            <div class="comput">
                <div style="font-size: 15px;">소개</div>
                <textarea name="comments" cols="60" rows="5" value="" readonly="readonly" class="computT">${memberDto.comments}</textarea>
            </div>
            <div class="buttonbox">
                <input type="button" value="수정하기" onclick="location.href='modify.text?userNum=${memberDto.userNum}'" class="comit">
             </div>
        </div>
    </form>

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