<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
        body {
           background-image: url(/textant/resources/background_img/book-2572101_1920.jpg);
            /*            background-image: url(slick-1.8.0/slick-1.8.0/slick/1300.png);*/
            background-position: center center;
            background-size:cover;
            background-attachment: fixed;
            background-repeat: no-repeat;
            /*            position: fixed;*/
            
            overflow: hidden;
            word-break: break-word;
        }
        
        .container {
            width: 55%;
            height: 55%;
            margin: 40px auto;
            /*            background-color: red;*/
        }
        
        .outer {
            display: table;
            width: 100%;
            height: 600px;
        }
        
        .inner {
            display: table-cell; 
            vertical-align: middle;
            text-align: center;
        }
        
        .centered {
            position: relative;
            display: inline-block;
            width: 50%;
            padding: 1em;
/*            background: orange;*/
            color: white;
        }
        
        
        
        .login_box {
/*             position: absolute; */
/*             top: 37%; */
/*             left: 40%; */
/*             width: 20%; */
margin-top : 10px
width: 100%;
        }
        
        .guest_box {
/*             position: absolute; */
/*             top: 55%; */
/*             left: 40%; */
/*             width: 20%; */
margin-top:200px;
width: 100%;
        }
        
        /*
        .login_box:hover {
            background: none;
            border: 1px solid white;
        }
*/
        
        a {
            text-decoration: none;
            color: white;
            text-align: center;
        }
        
        .guestt {
            width: 200px;
            height: 40px;
            background-color: #9f793e;
            padding: 13px 100px;
            border: 1px solid #9f793e;
        }
        
        .guestt:hover {
            background: none;
            transition: 0.5s;
            border: 1px solid white;
        }
        
        .loginn {
            width: 200px;
            height: 40px;
            background-color: #9f793e;
            padding: 13px 100px;
            border: 1px solid #9f793e;
        }
        
        .loginn:hover {
            background: none;
            transition: 0.5s;
            border: 1px solid white;
        }
        
 	.introduce{
 		display: table-cell;
        vertical-align: middle;
        text-align: center;
        width: 50%;
 	}
   	.introimg{
   	width: 100%;
    	height: 400px; 
   	}
    </style>
</head>

<body>
    <div class="container">
    <div class="logo">
        <img src="/textant/resources/icon_img/fristLogo2.png" class="logoimg">
        </div>
        <div class="outer">
<div class="introduce">
<img src="/textant/resources/background_img/men-2425121_960_720.jpg" class="introimg">
</div>
            <div class="inner">

                
                
                <div class="login_box" onclick="login()">
                    <a href="login.text" class="loginn" style="width: 100%;" id="btn1">
                        <span class="btn1_text">LOGIN</span>
                    </a>
                </div>

                <div class="guest_box" onclick="back()">
                    <a href="guest.text" class="guestt" style="width: 100%;" id="btn2">
                        <span class="btn2_text">GUEST</span>
                    </a>
                </div>

                <div class="centered">
                    
                </div>
            </div>


        </div>
    </div>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
//        function login() {
//
//            var x = document.getElementById("myDIV1");
//            //        로그인화면 들어가기
//            if (x.style.display === "block") {
//
//            } else {
//                document.getElementById("btn1").style.padding = "13px 105px";
//                document.getElementById("btn2").style.padding = "13px 105px";
//                $('.btn1_text').text("SIGN");
//
//                $('.btn2_text').text("BACK");
//
//                $('#btn1').attr("href", "##");
//                $('#btn2').attr("href", "#");
//
//                $('.login_box').animate({
//                    top: 550
//                });
//                $('.guest_box').animate({
//                    top: 650
//                });
//                $('#myDIV1').show(400);
//            }
//
//        }
//
//        //        로그인화면나가기
//        function back() {
//            var x = document.getElementById("myDIV1");
//
//            if (x.style.display === "block") {
//                document.getElementById("btn1").style.padding = "13px 100px";
//                document.getElementById("btn2").style.padding = "13px 100px";
//                $('.btn1_text').text("LOGIN");
//                $('.btn2_text').text("GUEST");
//                $('#btn1').attr("href", "#");
//                $('#btn2').attr("href", "##");
//
//                //            document.getElementById("btn1").style.paddingRight = "105px";
//
//                $('.login_box').animate({
//                    top: 332
//                });
//                $('.guest_box').animate({
//                    top: 498
//                });
//                $('#myDIV1').hide(300);
//            } else {}
//        }

    </script>
</body>
</html>