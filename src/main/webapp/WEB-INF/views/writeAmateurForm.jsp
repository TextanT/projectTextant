<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="/textant/resources/css/header-creative.css" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<!-- Add jQuery library -->
<script type="text/javascript"
	src="/textant/resources/fancybox-2.1.7/lib/jquery-1.10.2.min.js"></script>
<!-- Add mousewheel plugin (this is optional) -->
<script type="text/javascript"
	src="/textant/resources/fancybox-2.1.7/lib/jquery.mousewheel.pack.js"></script>

<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript"
	src="/textant/resources/fancybox-2.1.7/source/jquery.fancybox.pack.js"></script>
<link rel="stylesheet" type="text/css"
	href="/textant/resources/fancybox-2.1.7/source/jquery.fancybox.css"
	media="screen" />

<!-- Add Button helper (this is optional) -->
<link rel="stylesheet" type="text/css"
	href="/textant/resources/fancybox-2.1.7/source/helpers/jquery.fancybox-buttons.css" />
<script type="text/javascript"
	src="/textant/resources/fancybox-2.1.7/source/helpers/jquery.fancybox-buttons.js"></script>

<!-- Add Thumbnail helper (this is optional) -->
<link rel="stylesheet" type="text/css"
	href="/textant/resources/fancybox-2.1.7/source/helpers/jquery.fancybox-thumbs.css" />
<script type="text/javascript"
	src="/textant/resources/fancybox-2.1.7/source/helpers/jquery.fancybox-thumbs.js"></script>

<!-- Add Media helper (this is optional) -->
<script type="text/javascript"
	src="/textant/resources/fancybox-2.1.7/source/helpers/jquery.fancybox-media.js"></script>

<link href="/textant/resources/css/writeForm.css" rel="stylesheet"
	type="text/css">
<link href="/textant/resources/css/footer.css" rel="stylesheet"
	type="text/css">

<title>글쓰기</title>
<style>
#holder>img {
	float: right;
	padding-right: 500px;
	padding-bottom: 50px;
}
</style>

</head>   
<body>
	<form action="/textant/writeAmateur.text" method="post"
		enctype="multipart/form-data" id="writeForm">
		<input type="hidden" id="userNum" name="userNum" value="${userNum}">
		<input type="hidden" id="hiddenline" name="line" value="3">
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
			
	<%@include file="menuBoxAop.jsp" %>
	
	</div>
	
	<%@include file="topMenu.jsp" %>


		<div class="writeForm">
			<div class="writer_nameDiv">
				<label class="writer_name">작가명 <input type="text"
					class="name_text" placeholder="작가명을 입력해주세요" value="${nickname}"></label>
			</div>

			<div class="nov_titleDiv">
				<label class="nov_title">작품명 <input type="text"
					class="title_text" placeholder="작품명을 입력해주세요" name="bookName"></label>
			</div>

			<input type="text" name="genre" style="display: none;"
				id="genre_text" class="genre_tt">
			<%-- 				<p>${userNum}</p> --%>

			<div class="genDiv">
				<label class="genre">장르 <select name='fruits' id="genre_sel"
					onchange="selectchange(this.form)">
						<option value='' selected>-- 장르 선택 --</option>
						<option value='action'>액션</option>
						<option value='fantasy'>판타지</option>
						<option value='sports'>스포츠</option>
						<option value='SF'>SF</option>
						<option value='horror'>공포</option>
						<option value='Reasoning'>추리</option>
						<option value='game'>게임</option>
						<option value='history'>역사</option>
						<option value='arts'>무협</option>
						<option value='mystery'>미스테리</option>
						<option value='romance'>로맨스</option>
						<option value='war'>전쟁</option>
						<option value='growth'>성장</option>
						<option value='verse'>시</option>
						<option value='essay'>수필</option>
						<option value='humor'>유머</option>
				</select></label>
			</div>

			<div class="intro_titleDiv">
				<div class="intro">작품소개</div>
				<textarea type="" class="introduce_text" name="bookDesc"></textarea>
			</div>
			<div class="book_coverDiv">
				<div class="book_cover">책표지</div>
				TEXTANT제공<input type="radio" name="corch" value="textantcor"
					onclick="textantcover()" checked> 외부이미지사용<input
					type="radio" name="corch" value="usercor" onclick="usercover()">

				<br> <br>

				<div class="samplecover1">
					<a class="fancybox" data-fancybox-group="gallery"
						href="/textant/resources/book_img/너의췌장을먹고싶어.jpg"><img
						src="/textant/resources/book_img/너의췌장을먹고싶어.jpg"
						style="height: 150px;"></a>
						<input type="radio" name="inside" value="1">
				</div> 
				
				<div class="samplecover1">
					<a class="fancybox" data-fancybox-group="gallery"
						href="/textant/resources/book_img/다빈치코드.jpg"><img
						src="/textant/resources/book_img/다빈치코드.jpg"
						style="height: 150px;"></a>
						<input type="radio" name="inside" value="2">
				</div>
				<div class="samplecover1">
					<a class="fancybox" data-fancybox-group="gallery"
						href="/textant/resources/book_img/메이즈러너_데스큐어.jpg"><img
						src="/textant/resources/book_img/메이즈러너_데스큐어.jpg"
						style="height: 150px;"></a>
						<input type="radio" name="inside" value="3">
				</div>
				<div class="samplecover1">
					<a class="fancybox" data-fancybox-group="gallery"
						href="/textant/resources/book_img/신경끄기의 기술.jpg"><img
						src="/textant/resources/book_img/신경끄기의 기술.jpg"
						style="height: 150px;"></a>
						<input type="radio" name="inside" value="4">
				</div>
						<input type="radio" name="inside" value="0" checked="checked" style="display: none;">
				<div class="userimgDiv" style="display: none;">
					<a class="cover_btn" id="cover_mit" style="float: left;"
						onclick="document.all.bookcover.click(); bookimgch();">외부파일선택</a>
					<!-- 					<input type="file" style="display: none;" name="bookcover" id="bookcover" -->
					<!-- 					onchange="bookcover()"> -->
					<input type=file name="bookImg" id="bookcover"
						style="display: none;" onchange="bookimgch()"> <input
						type="text" id="bookcor" name="bookcor"
						style="border: 0; width: 400px; left: 222px; margin-top: 120px; position: absolute; background: none;"
						readonly>

					<div class="selectcover"></div>
					<div id="holder"></div>
				</div>

			</div>

			<div class="book_fileDiv">
				<div class="boofi">
					책파일 <input type="file" style="display: none;" name="bookFile"
						id="file" onchange="fileval()"> <a class="file_btn"
						id="file_mit" onclick="document.all.file.click(); fileval();">파일올리기</a>

					<input type="text" name='file2' id='file2'
						style="width: 300px; border: 0;" readonly> <input
						type="radio" name="ch" value="PDF" checked id="pdfc"
						onclick="pdfselect()">PDF파일 <input type="radio" name="ch"
						value="TXT" id="txtc" onclick="textselect()">TXT파일
				</div>
			</div>

			<div class="book_propDiv" style="display: none;">
				<div class="booprop">
					TXT파일설정 라인글자수 <input type="number" value="30" min="30" max="50">
					줄바꿈 <input type="number" value="30" min="30" max="50">
				</div>
			</div>

			<a class="write_btn" id="write_mit" onclick="fileCheck(this.form)">글올리기</a>
			<a class="back_btn" id="back_mit" onclick="javascript:history.back(-1)">취소</a>
		</div>

	</form>
	<%@include file="footer.jsp" %>



	<script type="text/javascript">
		function textselect() {
			$('.book_propDiv').css("display", "block");
			$("#hiddenline").val("2");
		}
		function pdfselect() {
			$('.book_propDiv').css("display", "none");
			$("#hiddenline").val("3");
		}
		function textantcover() {
			$('.userimgDiv').css("display", "none");
			$('.samplecover1').css("display", "block");
		}
		function usercover() {
			$('.userimgDiv').css("display", "block");
			$('.samplecover1').css("display", "none");
		}
	</script>

	<script>
		function fileCheck(frm) {

			var file = document.getElementById("file").value;
			var FileFilter = /\.(txt|pdf)$/i;
			var extArray = new Array(".txt", ".pdf");
			var bSubmitCheck = false;

			var fileImg = document.getElementById("bookcover").value;
			var FileImgFilter = /\.(jpg|png|jpeg)$/i;
			var extImgArray = new Array(".jpg", ".png", ".jpeg");
			var bSubmitImgCheck = false;

			if (!file) {
				alert("파일을 선택하여 주세요!");
				return;
			}

			if (document.getElementById("file").value.match(FileFilter)) {
				bSubmitCheck = true;
			}

			if (fileImg) {
				if (document.getElementById("bookcover").value
						.match(FileImgFilter)) {

				} else {
					alert("이미지는 다음 파일만 업로드가 가능합니다.\n\n 파일:"
							+ (extImgArray.join("  ")) + "\n\n 업로드할 파일을 "
							+ " 다시 선택하여 주세요.");
					return;
				}
			}

			if (bSubmitCheck) {
				alert("파일 업로드를 시작합니다.");
				document.getElementById("writeForm").submit();
			} else {
				alert("다음 파일만 업로드가 가능합니다.\n\n 파일:" + (extArray.join("  "))
						+ "\n\n 업로드할 파일을 " + " 다시 선택하여 주세요.");
			}
			if (genre_tt.text == "") {
				alert("장르를 입력해주세요");
			}

			document.getElementById("writeForm").submit();
		}

		function gkgkgkgk(file) {

			var FileFilter = /\.(txt)$/i;
			if (file.value.match(FileFilter)) {
				let html = "<td>txt설정</td><td>기존 줄바꿈 삭제<input type='checkbox' onclick='kokoko()' id='linener' name='linener'>"
						+ "<br>라인글자수<input  type='number' value='30' class='numOfOneLine' name='numOfOneLine' onblur='lineText()'><br>"
						+ "줄바꿈<input type='number' value='30' class='lineOfOnePage' name='lineOfOnePage' onblur='pageText()'>"
						+ "</td>"
				$("#setting").html(html);
				$("#line").val("2");
			} else {
				$("#line").val("3");
				$("#setting").html("");
			}

		}

		function kokoko() {
			alert("check박스?!");
			if ($("#linener").is(":checked")) {
				$("#line").val("1");
				alert("1");
			} else {
				$("#line").val("2");
				alert("2");
			}

		}

		function image() {

		}

		function lineText() {
			var lineText = $(".numOfOneLine").val();
			if (lineText<30||lineText>50) {
				alert("111");
				$(".numOfOneLine").val(30);
			}
		}

		function pageText() {
			var pageText = $(".lineOfOnePage").val();
			if (pageText<30||pageText>50) {
				alert("111");
				$(".lineOfOnePage").val(30);
			}
		}

		var upload = document.getElementsByName("bookImg")[0], holder = document
				.getElementById('holder');

		upload.onchange = function(e) {
			e.preventDefault();
			document.getElementById("bookcor").value = document
					.getElementById("bookcover").value;
			var file = upload.files[0], reader = new FileReader();
			reader.onload = function(event) {
				var img = new Image();
				img.src = event.target.result;
				img.width = 101.94;
				img.height = 150;
				holder.innerHTML = '';
				holder.appendChild(img);
			};
			reader.readAsDataURL(file);
			return false;
		};
	</script>
	<script type="text/javascript">
		function fileval() {
			document.getElementById("file2").value = document
					.getElementById("file").value;
		}
	</script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('.fancybox').fancybox();
		});
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
		function selectchange(frm) {

			frm.genre.value = frm.fruits.options[frm.fruits.selectedIndex].value;

		}
	</script>

</body>
</html>