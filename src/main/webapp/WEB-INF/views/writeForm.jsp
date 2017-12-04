<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>
<form action="/textant/write.text" method="post" enctype="multipart/form-data">
	<input type="hidden" id="line" name="line" value="3">
	<table border="2" width="200">  
		<tr>
 			 <td>글쓴이 :</td><td>human</td>
 		</tr>
 		<tr>	 
		 <td>제목 : </td><td><input type="txt" name="bookTitle" ></td>			 
		</tr>
		<tr>
		  <td colspan="2"> <textarea cols="50" rows="20" name="bookcontent" ></textarea></td>
	    </tr> 	    
	    <tr>
	      <td>첨부 : </td><td><input type="file"  onchange="gkgkgkgk(bookFile)"  name="bookFile"></td>
	    </tr>
	    <tr id="setting"><td></td></tr>
	    <tr>
	      <td><input type="button" onclick="fileCheck(this.form)" value="글쓰기"></td>
	      <td><input type="reset" onclick="history.back()" value="글쓰기취소"></td>
	    </tr>		
	</table>
	<section id="wrapper">
표지 이미지를 넣으세요(가급적 jpg로) <input type=file name="bookImg">
<div id="holder"></div>	
</form>


<script>
function fileCheck(frm) {   

  var file = frm.bookFile.value;
  var FileFilter = /\.(txt|pdf)$/i;
  var extArray = new Array(".txt", ".pdf");   
  var bSubmitCheck = false;
  
  var fileImg = frm.bookImg.value;
  var FileImgFilter = /\.(jpg|png|jpeg)$/i;
  var extImgArray = new Array(".jpg", ".png",".jpeg");   
  var bSubmitImgCheck = false;
  
  if( !file ){ 
    alert( "파일을 선택하여 주세요!");
    return;
  }
  
  if( frm.bookFile.value.match(FileFilter))
  { 
      bSubmitCheck = true;
  }
  
  if(fileImg){
	  if(frm.bookImg.value.match(FileImgFilter)){
		  
	  }else{
		  alert("이미지는 다음 파일만 업로드가 가능합니다.\n\n 파일:"  + (extImgArray.join("  ")) + "\n\n 업로드할 파일을 "
				     + " 다시 선택하여 주세요.");
		  return;
	  }
  }
  
  
  
  if (bSubmitCheck) {
     alert("파일 업로드를 시작합니다.");
     frm.submit(); 
   } else {
     alert("다음 파일만 업로드가 가능합니다.\n\n 파일:"  + (extArray.join("  ")) + "\n\n 업로드할 파일을 "
     + " 다시 선택하여 주세요.");
   }

}

function gkgkgkgk(bookFile){
	
	var FileFilter = /\.(txt)$/i;
	if(bookFile.value.match(FileFilter)){
		let html="<td>txt설정</td><td>기존 줄바꿈 삭제<input type='checkbox' onclick='kokoko()' id='linener' name='linener'>"
			+"<br>라인글자수<input  type='number' value='30' class='numOfOneLine' name='numOfOneLine' onblur='lineText()'><br>"
			+"줄바꿈<input type='number' value='30' class='lineOfOnePage' name='lineOfOnePage' onblur='pageText()'>"
		+"</td>"
			$("#setting").html(html);
		$("#line").val("2");
	}else{
		$("#line").val("3");
		$("#setting").html("");
	}
	
}

function kokoko(){
	alert("check박스?!");
	 if($("#linener").is(":checked")){
	 		$("#line").val("1");
	 		alert("1");
	 	}else{
	 		$("#line").val("2");
	 		alert("2");
	 	}
	
}

function image(){
	
}

function lineText(){
	var lineText =$(".numOfOneLine").val();
	if(lineText<30||lineText>50){
		alert("111");
		$(".numOfOneLine").val(30);
	}
}

function pageText(){
	var pageText =$(".lineOfOnePage").val();
	if(pageText<30||pageText>50){
		alert("111");
		$(".lineOfOnePage").val(30);
	}
}

var upload = document.getElementsByName("bookImg")[0],
holder = document.getElementById('holder');

upload.onchange = function (e) {
e.preventDefault();

var file = upload.files[0],
reader = new FileReader();
reader.onload = function (event) {
	var img = new Image();
	img.src = event.target.result;
	img.width = 280;
	img.height = 412
	holder.innerHTML = '';
	holder.appendChild(img);
	};
reader.readAsDataURL(file);
return false;
};
</script>
</body>
</html>