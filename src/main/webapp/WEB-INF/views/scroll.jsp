<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$.ajaxSetup({
	type : "POST",
	async : true,
	dataType : "json",
	error : function(xhr){
		alert("error html = " + xhr.statusText);
	}
});

$(document).ready(function(){
	var html = "";
	$.ajax({	
		url:"/textant/commentCount.text",
//			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
		data:{				
			page:$("#page").val(),
			bookArticleNum:$("#bookArticleNum").val()
		},
		beforeSend : function(){
//				alert("시작전");
		},
		complete: function(){
//				alert("완료후");
		},
		success:function(data){
			
			html+="<div id='commentCount' name='commentCount'>"+"page: "+data[1]+"~"+data[2]+"   전체답글: "+data[0]+"</div>"
			$(".bbb").append(html);
				$("#pageListCount").val(data[0]);
				$("#pageCountBlock").val(data[1]);
				$("#pageCut").val(data[3]);
				$("#pageSize").val(data[5]);
				comentRead(data);
		}					
	}); 
	
	var commentNumBer="";
	$(".commentWrite").on("mousedown", function() {
		commentNumBer = 0;
		$("#commentTo").val(commentNumBer);
		commentNumBer = $(".conetText").val();
		$("#conet").val(commentNumBer);
	});
	

});
function comentRead(read){
			var html = "";
	$.ajax({	
		url:"/textant/commentRead.text",
//			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
		error : function(xhr){
			 $("#scrollView").attr("type", "hidden");
		},
		data:{				
			page:$("#page").val(),
			nextPage:$("#nextPage").val(),
			pageListCount:read[0],
			pageCountBlock:read[1],
			pageCut:read[3],
			bookArticleNum:read[4],
			commentNum:0
		},
		beforeSend : function(){
//				alert("시작전");
		},
		complete: function(){
//				alert("완료후");
		},
		success:function(data){
			
			 $.each(data, function(index,item) {
				 var commentNum=item.commentNum;
				 var commentCount=item.commentCount;
			 html+="<div>"+item.conet+"</div>"
			 +"<input type='checkbox' class='comment"+commentNum+"' name='chk' onClick='kokoko("+commentNum+","+commentCount+")' value='"+commentNum+"'>답글: "+data[index].commentCount+"<br/>"
			 +"<input id='nextToPage"+commentNum+"' type='hidden' name='nextToPage"+commentNum+"' value='1'>"	
			 +"<input id='commentGroup"+commentNum+"' type='hidden' name='commentGroup' value='0'>"
			 +"<div class='fon"+commentNum+"'></div><hr>"
			 });
		 	
			 
			 $(".aaa").append(html);
			 
			 var num=$("#nextPage").val()
			 num++;
			 var nextPageNum = $("#nextPage").val(); 
			 var pageCutNum = $("#pageCut").val();
			 if(nextPageNum==pageCutNum){
				 $("#scrollView").attr("type", "hidden");
			 }
			 $("#nextPage").val(num);
		}					
	});
	
	
};

function commentGet(){
			var html="";
	$.ajax({	
		url:"/textant/commentRead.text",
//			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
		data:{				
			page:$("#page").val(),
			nextPage:$("#nextPage").val(),
			pageListCount:$("#pageListCount").val(),
			pageCountBlock:$("#pageCountBlock").val(),
			pageCut:$("#pageCut").val(),
			bookArticleNum:$("#bookArticleNum").val(),
			commentNum:0
		},
		beforeSend : function(){
//				alert("시작전");
		},
		complete: function(){
//				alert("완료후");
		},
		success:function(data){
		
			 $.each(data, function(index,item) {
				 var commentNum=item.commentNum;
				 var commentCount=item.commentCount;

			 html+="<div>"+item.conet+"</div>"
			 +"<input type='checkbox' class='comment"+commentNum+"' name='chk' onClick='kokoko("+commentNum+","+commentCount+")' value='"+commentNum+"'>답글: "+data[index].commentCount+"<br/>"
			 +"<input id='nextToPage"+commentNum+"' type='hidden' name='nextToPage"+commentNum+"' value='1'>"	
			 +"<input id='commentGroup"+commentNum+"' type='hidden' name='commentGroup' value='0'>"
			 +"<div class='fon"+commentNum+"'></div><hr>"
			 });
			 
		
			 $(".aaa").append(html);
			 
			 var num=$("#nextPage").val()
			 num++;
			 
			 
			 var nextPageNum = $("#nextPage").val(); 
			 var pageCutNum = $("#pageCut").val();
			 if(nextPageNum==pageCutNum){
				 $("#scrollView").attr("type", "hidden");
			 }
			 $("#nextPage").val(num);
		}					
	}); 
};


function kokoko(commentNum,commentCount){
	console.log(commentCount);
	var num=commentCount/$("#pageSize").val();
	var number=Math.ceil(num);
	 if($(".comment"+commentNum).is(":checked")){
		 $.ajax({	
				url:"/textant/commentRead.text",
				error : function(xhr){
					alert("읽어들일 코맨트 업엉ㅋ");
					html="<div>답글을 남겨주세요.</div>"
					  +"<input class='conetToText' name='conetToText' type='text'>"
					  +"<input class='commentToWrite' type='submit' value='채팅'>"
					  $(".fon"+commentNum).append(html);
				},
				data:{		
					page:$("#page").val(),
					nextPage:$("#nextToPage"+commentNum).val(),
					pageListCount:commentCount,
					pageCountBlock:$("#pageCountBlock").val(),
					pageCut:number,
					bookArticleNum:$("#bookArticleNum").val(),
					commentNum:commentNum
				},
				beforeSend : function(){

				},
				complete: function(){
					 var commentNumBer="";
						$(".commentToWrite").on("mousedown", function() {
							commentNumBer = 1;
							$("#commentTo").val(commentNumBer);
							commentNumBer = $(".conetToText").val();
							$("#conet").val(commentNumBer);
							commentNumBer = commentNum;
							$("#commentTop").val(commentNumBer);
						});
				},
				success:function(data){
					var html="<hr>";
					 $.each(data, function(index,item) {
						 var commentNum=item.commentNum;
						 var commentCount=item.commentCount;
					 html+="<div>답글에답글: "+item.conet+"</div>"
					 +"<hr>"
					 });
					 $(".fon"+commentNum).append(html);
					 html="<input class='scrollViewTo' id='scrollViewTo' type='button' onclick='commentToGet("+commentNum+","+commentCount+")' value='더보기' style='width:380px;'>"
						  +"<input class='conetToText' name='conetToText' type='text'>"
						  +"<input class='commentToWrite' type='submit' value='채팅'>"
						  $(".fon"+commentNum).append(html);
						  
					 var num=$("#nextToPage"+commentNum).val()
					 num++;
					 	
					 var nextPageNum = $("#nextToPage"+commentNum).val();
					 if(nextPageNum==number){
						 $("#scrollViewTo").attr("type", "hidden");
					 }
					 $("#nextToPage"+commentNum).val(num);
					 $("#commentGroup"+commentNum).val(1);
				}					
			}); 
		 
	 	}else{
	 		$("#commentGroup"+commentNum).val(0);
	 		$("#nextToPage"+commentNum).val(1);
	 		$(".fon"+commentNum).empty();
	 	}
	
}

function commentToGet(commentNum,commentCount){
	var num=commentCount/$("#pageSize").val();
	var number=Math.ceil(num);
		 $.ajax({	
				url:"/textant/commentRead.text",

				data:{		
					page:$("#page").val(),
					nextPage:$("#nextToPage"+commentNum).val(),
					pageListCount:commentCount,
					pageCountBlock:$("#pageCountBlock").val(),
					pageCut:number,
					bookArticleNum:$("#bookArticleNum").val(),
					commentNum:commentNum
				},
				beforeSend : function(){

				},
				complete: function(){

				},
				success:function(data){
				
					var html="";
					 $.each(data, function(index,item) {
						 var commentNum=item.commentNum;
					 html+="<div>답글에답글: "+item.conet+"</div>"
					 +"<hr>"
					 });
					 $(html).insertAfter($(".fon"+commentNum).children("hr").last());
					 //$(".fon"+commentNum).children("hr").last().append(html);
					 var num=$("#nextToPage"+commentNum).val()
					 num++;
					 
					 
					 var nextPageNum = $("#nextToPage"+commentNum).val();
					 if(nextPageNum==number){
						 $("#scrollViewTo").attr("type", "hidden");
					 }
					 $("#nextToPage"+commentNum).val(num);
					
				}					
			}); 
		
}


	

</script>
<style>
</style>
<title>Insert title here</title>
</head>
<body>	
	<form action="/textant/scroll.text" method="post">
	<input id="bookArticleNum" type="hidden" name="bookArticleNum" value="1">
	<input id="page" type="hidden" name="page" value="70">
	<input id="nextPage" type="hidden" name="nextPage" value="1">
	<input id='pageListCount' type='hidden' name='pageListCount'>
	<input id='pageCountBlock' type='hidden' name='pageCountBlock'>
	<input id='pageCut' type='hidden' name='pageCut'>
	<input id='pageSize' type='hidden' name='pageSize'>
	<input id='commentTo' type='hidden' name='commentTo'>
	<input id='conet' type='hidden' name='conet'>
	<input id='commentTop' type='hidden' name='commentTop' value='0'>
	
	<div class="bbb"></div>
	<div class="ccc" style="overflow-y:scroll;width:400px;height:500px;">
		<div class="aaa">
		</div>
	<input class="scrollView" id="scrollView" type="button" onclick="commentGet()" value="더보기" style="width:380px;">
	</div>
		<input class="conetText" name="conetText" type="text">
		<input class="commentWrite" type="submit" value="채팅">
	</form>
</body>
</html>