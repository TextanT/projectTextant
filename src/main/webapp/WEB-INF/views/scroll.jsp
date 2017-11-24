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
	$.ajax({	
		url:"/textant/commentCount.text",
//			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
		data:{				
			page:$("#page").val()
		},
		beforeSend : function(){
//				alert("시작전");
		},
		complete: function(){
//				alert("완료후");
		},
		success:function(data){
			var html;
			html+="<div id='commentCount' name='commentCount'>"+"page: "+data[1]+"~"+data[2]+"   전체답글: "+data[0]+"</div>"
			$(".bbb").append(html);
			
				$("#pageListCount").val(data[0]);
				$("#pageCountBlock").val(data[1]);
				$("#pageCut").val(data[3]);
				comentRead(data);
		}					
	}); 
});
function comentRead(read){
	$.ajax({	
		url:"/textant/commentRead.text",
//			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
		data:{				
			page:$("#page").val(),
			nextPage:$("#nextPage").val(),
			pageListCount:read[0],
			pageCountBlock:read[1],
			pageCut:read[3]
		},
		beforeSend : function(){
//				alert("시작전");
		},
		complete: function(){
//				alert("완료후");
		},
		success:function(data){
			var html;
			 $.each(data, function(index,item) {
					 html+="<div>"+item.conet+"</div>"
		        });
			 
			 $(".aaa").append(html);
			 
			 var num=$("#nextPage").val()
			 num++;
			 $("#nextPage").val(num);
		}					
	}); 
};

function commentGet(){
	$.ajax({	
		url:"/textant/commentRead.text",
//			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
		data:{				
			page:$("#page").val(),
			nextPage:$("#nextPage").val(),
			pageListCount:$("#pageListCount").val(),
			pageCountBlock:$("#pageCountBlock").val(),
			pageCut:$("#pageCut").val()
		},
		beforeSend : function(){
//				alert("시작전");
		},
		complete: function(){
//				alert("완료후");
		},
		success:function(data){
			if(data==null){
				alert("성공");
			}
			var html;
			 $.each(data, function(index) {
					 html+="<div>"+data[index].conet+"</div>"
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
</script>
<style>
</style>
<title>Insert title here</title>
</head>
<body>
	<input id="page" type="hidden" name="page" value="5">
	<input id="nextPage" type="hidden" name="nextPage" value="1">
	<input id='pageListCount' type='hidden' name='pageListCount'>
	<input id='pageCountBlock' type='hidden' name='pageCountBlock'>
	<input id='pageCut' type='hidden' name='pageCut'>

	<div class="bbb"></div>
	<div class="ccc" style="overflow-y:scroll;width:400px;height:500px;">
		<div class="aaa">
		</div>
	<input class="scrollView" id="scrollView" type="button" onclick="commentGet()" value="더보기" style="width:380px;">
	</div>
	<form action="/textant/scroll.text" method="post">
		<input name="page" type="text">
		<input name="conet" type="text">
		<input class="commentWrite" type="submit" value="채팅">
	</form>
</body>
</html>