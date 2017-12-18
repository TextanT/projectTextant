<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 업로드</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
.fileDrop {
	width: 400px;
	height: 150px;
	border: 1px dotted blue;
	margin: auto,0;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="container">
<form action="/textant/Member_Icon_Edit" method="post">
	
	 <div class='fileDrop'></div>
	 	<input type="button" value="모두삭제"/>
	 <div class='uploadedList'></div>	
	 <input type="submit" value="등록">
	 <input type="reset" value="취소">
</form>
</div>
<script>
// 글쓰기 취소시에 업로드 되어있는 파일 삭제
   $("input[type=reset]").on("click", function(){	 
	   allDeleteFiles();	
	});
	
$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();		
	});
	
$(".fileDrop").on("drop", function(event){
	event.preventDefault();	
	var files = event.originalEvent.dataTransfer.files;				
	var formData = new FormData();
	$.each(files,function(index,item){
		formData.append("multiFile", item);
	});		
	
	$.ajax({
		  url: '/textant/uploadAjax.text',
		  data: formData,
		  dataType:'json',		  
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			  var str ="";				 
			  alert(data);				  
			  $.each(data,function(index, fileName){					  					 
				  if(checkImageType(fileName)){						 
					  str ="<div><img src='displayFile2.text?fileName="+fileName+"'/>"	
						  +"<small class='human' data-src='"+fileName+"'>X</small>"
						  +"<input type='hidden' name='fileNames' value='"+getImageLink(fileName)+"'></div>";
				  }else{
				 	  str ="<div>"+ getOriginFname(fileName)
						  +"<small class='human' data-src='"+fileName+"'>X</small>"
						  +"<input type='hidden' name='fileNames' value='"+fileName+"'></div>";
				  }
				  
				  $(".uploadedList").append(str);
			  });				 
		  },
		  error : function(xhr){
				alert("error html = " + xhr.statusText);
		  }			  
		});	
});

$(".uploadedList").on("click", "small", function(event){			
	var that = $(this);
   $.ajax({
	   url:"/textant/deleteFile.text",
	   type:"post",
	   data: {
		   fileName:$(this).attr("data-src")
	   },
	   dataType:"text",		 
	   success:function(result){
		   if(result == 'deleted'){				   
			   that.parent("div").remove();
			   alert("삭제성공");
		   }
	   }
   });
});

$("input[type=button]").on("click", function(event){			
 	allDeleteFiles();
});

function allDeleteFiles(){
	var files=[];
	$.each($(".human"),function(index,item){
		files.push($(this).attr("data-src"));						
	});	

   jQuery.ajaxSettings.traditional = true;
   $.ajax({
	   url:"/textant/deleteAllFiles.text",
	   type:"post",
	   data: {files: files},
	   dataType:"text",		  
	   success:function(result){
		   if(result == 'deleted'){
			   $(".uploadedList").children().remove();
			   alert("삭제성공");
		   }
	   }
   });
}

function checkImageType(fileName){	
	var pattern = /.jpg|.gif|.png/i;		
	return fileName.match(pattern);		
}

function getImageLink(fileName){
	if(!checkImageType(fileName)){
		return;
	}	
	var front = fileName.substr(0,12);
	var end = fileName.substr(14);			
	return front + end;	
}

function getOriginFname(fileName){
	if(checkImageType(fileName)){
		return;
	}
	
	var idx = fileName.indexOf("_") + 1 ;
	return fileName.substr(idx);	
}
</script>

</body>
</html>