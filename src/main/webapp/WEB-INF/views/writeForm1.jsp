<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>글쓰기</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<style>
h3 {
	text-align: center;
	margin: 0 auto;
}

.fileDrop {
	width: 50%;
	height: 300px;
	border: 1px dotted blue;
	margin: 0 auto;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}

small:hover {
	cursor: pointer;
}
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="col-md-3 col-sm-2"></div>
<div class="col-md-6 col-sm-8">
<form action="/textant/write.text" method="post" enctype="multipart/form-data"><!-- enctype="multipart/form-data"을 일시적으로 빼놓았다  -->
<input type="hidden" name="pageNum" value="${pageNum}"/>
<div class= "storedFilesClass"></div>
	<table border="2" class = "table table-bordered">  
		<tr>
 			 <td>글쓴이 :</td><td>${id}</td>
 		</tr>
 		<tr>	 
		 <td>제목 : </td><td><input style="width:100%" type="text" name="title"></td>			 
		</tr>
		<tr>
		  <td colspan="2"> <textarea style="width:100%" rows="20" name="content" ></textarea></td>
	    </tr> 	    
	    <tr>
	      <td>첨부 : </td><td>
	      <input type="file" id="textFile" name="textFile"></div>
	
	</div>
	</td>
	    </tr>
	    <tr>
	      <td><input type="submit" value="글쓰기"></td>
	      <td><input type="reset" value="글쓰기취소" onclick="history.back()"></td>	      	 
	    </tr>		
	</table>	
</form>
</div>
<!-- <script>
function send(){
	form = document.formSend;
	form.array.value = storedFiles;
	form.submit();
	}


		let storedFiles = new Array();
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});
		
		$("input[type=reset]").on("click", function(event) {
			let files = [];
			$.each($(".human"), function(index, item) {
				// 			files[index]=$(this).attr("data-src");
				files.push($(this).attr("data-src"));
			});
			$.ajax({
				url : "/bbs/deleteAllFiles.bbs",
				type : "post",
				data : {
					files : files
				},
				dataType : "text",
				success : function(result) {
					if (result == 'deleted') {
						allDelete();
					}
				}
			});
		});
		
		$(".fileDrop")
				.on(
					"drop",
					function(event) {
						event.preventDefault();//기본 이벤트를 막는다. 브라우저의 처음 이벤트는 이미지파일이 들어왔을때 그 이미지파일을 열어준다.
// 						event.originalEvent는 순수한 원래의 DOM이벤트를 가지고 옴
// 						JQuery를 사용할 경우 순수한 DOM이벤트가 아님
// 						dataTransfer는 이벤트와 같이 전달된 데이터를 의미
// 						그 안에 포함된 파일 데이터를 찾아내기 위해 dataTransfer.files를 사용함
						let files = event.originalEvent.dataTransfer.files;
// 						var file = files[0];
// 						파일 이름을 바로 알아낼 수 있음
// 						file.name;
// 						alert(file.name + "입니다");
						let formData = new FormData();
						$.each(files, function(index, item) {
							formData.append("multiFile", item);
						});
						
						

						$.ajax({
								url : '/bbs/uploadAjax.bbs',
								data : formData,
								// 			  복수개를 업로드시 
								dataType : 'json',
								//아래 두개가 false가 되면 multipart form데이터가 된다.
								processData : false,
								contentType : false,
								//processData : 데이터를 일반적인 query string으로 변환할것인지를 결정, 기본값은 true,
								//'application/x-www-form-urlencoded' 타입으로 전송, 다른 형식으로 데이터를
								//보내기 위하여 자동 변환하고 싶지 않은 경우는 false로 지정
								//contentType : false 는
								//기본값은 'application/x-www-form-urlencoded', 파일의 경우 'multipart/form-data'
								//형식으로 전송하기 위해서false
								type : 'POST',
								success : function(data) {
									let str = "";
									let sf = "";
									alert(data);
									$.each(
											data,
											function(index,
													fileName) {
												if (checkImageType(fileName)) {
													str = "<div><a href=displayFile.bbs?fileName=" + getImageLink(fileName) + ">"//s_가 없는 파일
															+ "<img src='displayFile.bbs?fileName=" + fileName + "'/>"
															+ "</a><small class='human' data-src='"+fileName+"'>X</small></div>";
// 													storedFiles.push(getImageLink(fileName));
// 													storedFiles.push(fileName);
// 													alert(storedFiles);
													sf = '<input type="hidden" name="fileNames" value="' + getImageLink(fileName) + '"/>'
// 														+ '<input type="hidden" name="fileNames" value="' + fileName + '"/>';

//								 	 				 이미지 파일일 경우에는 이름에 s_ 가 포함되어있으므로 테이블에 바로 입력하면
//								 	 				 다운로드시 썸네일 파일을 다운로드 받게됨...이름에 s_ 제거하고 테이블에 입력
// 														  +"<input type='hidden' name='fileNames' value='"+getImageLink(fileName)+"'></div>";
													
												} else {
													str = "<div><a href='displayFile.bbs?fileName=" + fileName + "'>"
															+ getOriginalName(fileName) + "</a>"
															+ "<small class='human' data-src='"+fileName+"'>X</small></div>";
													storedFiles.push(fileName);
													alert(storedFiles);
													sf = '<input type="hidden" name="fileNames" value="' + fileName + '"/>';
												
												}
													$(".uploadedList").append(str);
													$(".storedFilesClass").append(sf);
													
											});
						},
						error : function(xhr) {
							alert("error html = "
									+ xhr.statusText);
						}
					});
		});
	
		$(".uploadedList").on("click", "small", function(event) {
			let that = $(this);
			$.ajax({
				url : "/bbs/deleteFile.bbs",
				type : "post",
				data : {
					fileName : $(this).attr("data-src")
				},
				dataType : "text",
				success : function(result) {
					if (result == 'deleted') {
// 						alert("fileName" + fileName); 존재하지 않음
						alert(that.attr("data-src"));
						let delFile = that.attr("data-src")
						storedFiles.splice(storedFiles.indexOf(delFile),1);
						
						$('input[value="'+delFile+'"]').remove();
						
						if(checkImageType(delFile)){
							
							let front = delFile.substr(0, 12);
							let end = delFile.substr(14);//s_를 없애기 위해
												
							storedFiles.splice(storedFiles.indexOf(front+end),1);
							$('input[value="'+front+end+'"]').remove();
						
						}
						alert(storedFiles);
						that.parent("div").remove();
						alert("삭제성공");
					}
				}
			});
		});
	
// 		배열을 직렬화해서 전송함
		$.ajaxSettings.traditional = true;
// 		직렬화 하고 보내는 것이 정석!
		
		$("input[type=button]").on("click", function(event) {
			let files = [];
			$.each($(".human"), function(index, item) {
				// 			files[index]=$(this).attr("data-src");
				files.push($(this).attr("data-src"));
			});
			$.ajax({
				url : "/bbs/deleteAllFiles.bbs",
				type : "post",
				data : {
					files : files
				},
				dataType : "text",
				success : function(result) {
					if (result == 'deleted') {
						allDelete();
					}
				}
			});
		});

		function allDelete(){
			storedFiles.splice(0);
			$(".storedFilesClass").children().remove();
			alert(storedFiles);
			$(".uploadedList").children().remove();
			alert("삭제성공");
		}

		function checkImageType(fileName) {

			// 		/i는 대소문자 구분 하지 말라는 뜻임
			let pattern = /.jpg|.gif|.png|.jpeg/i;
			return fileName.match(pattern);
		}

		function getImageLink(fileName) {
			if (!checkImageType(fileName)) {
				return;
			}
			let front = fileName.substr(0, 12);
			let end = fileName.substr(14);//s_를 없애기 위해
			alert(fileName + " <-fileName : front+end-> " + front + end);
			return front + end;
		}

		function getOriginalName(fileName) {
			if (checkImageType(fileName)) {
				return;
			}

			let idx = fileName.indexOf("_") + 1;
			return fileName.substr(idx);
		}
	</script> -->
</body>
</html>