<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
input[type="checkbox"]{
    display: none;
}
.reportComment{
    display: none;
}
</style>
<script>
$.ajaxSetup({
	type : "POST",
	async : true,
	dataType : "json",
// 	error : function(xhr){
// 		alert("error html = " + xhr.statusText);
// 	}
});
var commentGood=1;
var commentBad=2;
$(document).ready(function(){
	commentListWrite();

	var commentNumBer="";
	$(".commentWrite").on("mousedown", function() {
		commentNumBer = 0;
		$("#commentTo").val(commentNumBer);
		commentNumBer = $(".conetText").val();
		$("#conet").val(commentNumBer);
	});
	
	var commentSearchBer="";
	$(".commentSearchButton").on("mousedown", function() {
		commentSearchBer = 0;
		commentSearchBer = $(".commentSearchText").val();
		$("#commentSearch").val(commentSearchBer);
	});
	
	$(".commentSearchButton").on("click", function() {
		getCommentSearchRead(1)
	});
	
	var commentEnter="";
 	$('.commentSearchText').keydown(function(event){
 		  if(event.keyCode == 13){
 			 commentEnter = 0;
 			commentEnter = $(".commentSearchText").val();
 			$("#commentSearch").val(commentEnter);
 	 		$(".commentSearchButton").trigger('click');
 		  }
 		});

	
});
function commentListWrite() {
	var html = "";
	$.ajax({	
		url:"/textant/commentTotalCount.comment",
//			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
		data:{				
			page:$("#page").val(),
			bookArticleNum:$("#bookArticleNum").val()
		},
		success:function(data){
			html+="<div id='commentCount' name='commentCount'>전체답글: "+data.totalCount+"</div>"
			
			
			$(".commentCount").append(html);
			$("#pageSize").val(data.pageSize);
			$("#bookTotalPage").val(data.bookTotalPage);
			
				commentRead(data.totalCount);
		}					
	}); 
	}
function commentRead(commentTotalCount){
			var html = "";
	$.ajax({	
		url:"/textant/commentTotalRead.comment",
		data:{				
			commentTotalCount:commentTotalCount,
			page:$("#page").val(),
			bookArticleNum:$("#bookArticleNum").val(),
			commentNum:0,
			commentDelete:0,
			commentSearchCheak:0,
			commentSearchList:$("#commentSearchList").val(),
			commentSearch:$("#commentSearch").val()
		},
		complete: function(){
			commentTotalDelete($("#page").val(),commentTotalCount,$("#bookArticleNum").val(),0,1,0,$("#commentSearchList").val(),$("#commentSearch").val())
			
		},
		success:function(data){
				$("#commentTotalCount").val(commentTotalCount);
			 $.each(data, function(index,item) {
				 var commentNum=item.commentNum;
				 var commentCount=item.commentCount;
				 var commentGroup=item.commentGroup;
			 html+="<div class='commentDelete"+commentNum+"'><div>"+item.nickName+"</div>"
			 +"<input id='commentDeleteButton"+commentNum+"' type='hidden' onclick='commentDeleteOk("+commentNum+","+commentGroup+")' value='삭제'>"
			 +"<div>답글: "+item.conet+"</div>"			 
			 +"<input type='checkbox' id='c"+commentNum+"' class='comment"+commentNum+"' name='chk' onClick='commentReply("+commentNum+","+commentCount+")' value='"+commentNum+"'><label for='c"+commentNum+"' class='commentCount"+commentNum+"'><span></span>답글달기: "+data[index].commentCount+"</label><br/>"
			 +"<input type='button' class='commentGood"+commentNum+"' onclick='commentGoodOrBad("+commentNum+","+commentGood+")' value='좋아요"+item.commentGood+"'>"
			 +"<input type='button' class='commentBad"+commentNum+"' onclick='commentGoodOrBad("+commentNum+","+commentBad+")' value='싫어요"+item.commentBad+"'>"
			 +"<input type='button' class='reportComment' id='reportComment"+commentNum+"' onclick='reportComment("+commentNum+")'><label for='reportComment"+commentNum+"'><span></span>신고하기</label>"
			 +"<input id='nextToPage"+commentNum+"' type='hidden' name='nextToPage"+commentNum+"' value='1'>"	
			 +"<input id='commentGroup"+commentNum+"' type='hidden' name='commentGroup' value='0'>"
			 +"<div class='fon"+commentNum+"'></div><hr></div>"
			 });
			 html+=data[0].pageCode
			 $(".commentList").append(html);
		}					
	});
	
};

function getCommentRead(pageNum){
	var html = "";
$.ajax({	
url:"/textant/commentTotalRead.comment",
	
data:{				
	commentTotalCount:$("#commentTotalCount").val(),
	page:pageNum,
	bookArticleNum:$("#bookArticleNum").val(),
	commentNum:0,
	commentDelete:0,
	commentSearchCheak:0,
	commentSearchList:$("#commentSearchList").val(),
	commentSearch:$("#commentSearch").val()
},
complete: function(){
	commentTotalDelete(pageNum,$("#commentTotalCount").val(),$("#bookArticleNum").val(),0,1,0,$("#commentSearchList").val(),$("#commentSearch").val())
	
},
success:function(data){
	 $.each(data, function(index,item) {
		 var commentNum=item.commentNum;
		 var commentCount=item.commentCount;
		 var commentGroup=item.commentGroup;
	 html+="<div class='commentDelete"+commentNum+"'><div>"+item.nickName+"</div>"
	 +"<input id='commentDeleteButton"+commentNum+"' type='hidden' onclick='commentDeleteOk("+commentNum+","+commentGroup+")' value='삭제'>"
	 +"<div>답글: "+item.conet+"</div>"			 
	 +"<input type='checkbox' id='c"+commentNum+"' class='comment"+commentNum+"' name='chk' onClick='commentReply("+commentNum+","+commentCount+")' value='"+commentNum+"'><label for='c"+commentNum+"' class='commentCount"+commentNum+"'><span></span>답글달기: "+data[index].commentCount+"</label><br/>"
	 +"<input type='button' class='commentGood"+commentNum+"' onclick='commentGoodOrBad("+commentNum+","+commentGood+")' value='좋아요"+item.commentGood+"'>"
	 +"<input type='button' class='commentBad"+commentNum+"' onclick='commentGoodOrBad("+commentNum+","+commentBad+")' value='싫어요"+item.commentBad+"'>"
	 +"<input type='button' class='reportComment' id='reportComment"+commentNum+"' onclick='reportComment("+commentNum+")'><label for='reportComment"+commentNum+"'><span></span>신고하기</label>"
	 +"<input id='nextToPage"+commentNum+"' type='hidden' name='nextToPage"+commentNum+"' value='1'>"	
	 +"<input id='commentGroup"+commentNum+"' type='hidden' name='commentGroup' value='0'>"
	 +"<div class='fon"+commentNum+"'></div><hr></div>"
	 });
	 html+=data[0].pageCode
	 $(".commentList").html(html);
}					
});

};

function getCommentSearchRead(pageNum){
	var html = "";
$.ajax({	
url:"/textant/commentTotalRead.comment",
error : function(xhr){
	 $(".commentList").empty();;
},	
data:{				
	commentTotalCount:$("#commentTotalCount").val(),
	page:pageNum,
	bookArticleNum:$("#bookArticleNum").val(),
	commentNum:0,
	commentDelete:0,
	commentSearchCheak:1,
	commentSearchList:$("#commentSearchList").val(),
	commentSearch:$("#commentSearch").val()
},
complete: function(){
	
	commentTotalDelete(pageNum,$("#commentTotalCount").val(),$("#bookArticleNum").val(),0,1,1,$("#commentSearchList").val(),$("#commentSearch").val())
	
},
success:function(data){
	 $.each(data, function(index,item) {
		 var commentNum=item.commentNum;
		 var commentCount=item.commentCount;
		 var commentGroup=item.commentGroup;
	 html+="<div class='commentDelete"+commentNum+"'><div>"+item.nickName+"</div>"
	 +"<input id='commentDeleteButton"+commentNum+"' type='hidden' onclick='commentDeleteOk("+commentNum+","+commentGroup+")' value='삭제'>"
	 +"<div>답글: "+item.conet+"</div>"			 
	 +"<input type='checkbox' id='c"+commentNum+"' class='comment"+commentNum+"' name='chk' onClick='commentReply("+commentNum+","+commentCount+")' value='"+commentNum+"'><label for='c"+commentNum+"' class='commentCount"+commentNum+"'><span></span>답글달기: "+data[index].commentCount+"</label><br/>"
	 +"<input type='button' class='commentGood"+commentNum+"' onclick='commentGoodOrBad("+commentNum+","+commentGood+")' value='좋아요"+item.commentGood+"'>"
	 +"<input type='button' class='commentBad"+commentNum+"' onclick='commentGoodOrBad("+commentNum+","+commentBad+")' value='싫어요"+item.commentBad+"'>"
	 +"<input type='button' class='reportComment' id='reportComment"+commentNum+"' onclick='reportComment("+commentNum+")'><label for='reportComment"+commentNum+"'><span></span>신고하기</label>"
	 +"<input id='nextToPage"+commentNum+"' type='hidden' name='nextToPage"+commentNum+"' value='1'>"	
	 +"<input id='commentGroup"+commentNum+"' type='hidden' name='commentGroup' value='0'>"
	 +"<div class='fon"+commentNum+"'></div><hr></div>"
	 });
	 html+=data[0].pageCode
	 $(".commentList").html(html);
	 $("#commentCount").html("전체답글: "+data[0].totalCount);
	 
}					
});

};


function commentReply(commentNum,commentCount){
	var num=commentCount/$("#pageSize").val();
	var number=Math.ceil(num);
	 if($(".comment"+commentNum).is(":checked")){
		 $.ajax({	
				url:"/textant/commentRead.comment",
				error : function(xhr){
					alert("읽어들일 코맨트 업엉ㅋ");
					html="<div>답글을 남겨주세요.</div>"
						+"<input class='conetToText"+commentNum+"' name='conetToText' type='text'>"
						  +"<input class='commentToWrite"+commentNum+"' type='button' onclick='commentWrite()' value='쓰기'>"
					  $(".fon"+commentNum).append(html);
				},
				data:{		
					page:$("#bookTotalPage").val(),
					nextPage:$("#nextToPage"+commentNum).val(),
					pageListCount:commentCount,
					pageCountBlock:1,
					pageCut:number,
					bookArticleNum:$("#bookArticleNum").val(),
					commentNum:commentNum,
					commentDelete:0
				},
				beforeSend : function(){
					
				},
				complete: function(){
					commentDelete($("#bookTotalPage").val(),$("#nextToPage"+commentNum).val(),commentCount,1,number,$("#bookArticleNum").val(),commentNum,1)

					 
					 
					 var num=$("#nextToPage"+commentNum).val()
					 num++;
					 	
					 var nextPageNum = $("#nextToPage"+commentNum).val();
					 if(nextPageNum==number){
						 $("#scrollViewTo"+commentNum).attr("type", "hidden");
					 }
					 $("#nextToPage"+commentNum).val(num);
					 $("#commentGroup"+commentNum).val(1);
					 var commentNumBer="";
						$(".commentToWrite"+commentNum).on("mousedown", function() {
							commentNumBer = 1;
							$("#commentTo").val(commentNumBer);
							commentNumBer = $(".conetToText"+commentNum).val();
							$("#conet").val(commentNumBer);
							commentNumBer = commentNum;
							$("#commentTop").val(commentNumBer);
						});
						
					
						var commentEnter="";
					 	$('.conetToText'+commentNum).keydown(function(event){
					 		  if(event.keyCode == 13){
					 			 commentEnter = 1;
					 	 		$("#commentTo").val(commentEnter);
					 	 		commentEnter = $(".conetToText"+commentNum).val();
					 	 		$("#conet").val(commentEnter);
					 	 		commentEnter = commentNum;
								$("#commentTop").val(commentEnter);
					 	 		$(".commentToWrite"+commentNum).trigger('click');
					 		  }
					 		});
				},
				success:function(data){
					var html="<hr>";
					 $.each(data, function(index,item) {
						 var commentNum=item.commentNum;
						 var commentCount=item.commentCount;
						 var commentGroup=item.commentGroup;
					html+="<div class='commentDelete"+commentNum+"'><div>"+item.nickName+"</div>"
						+"<input id='commentDeleteButton"+commentNum+"' type='hidden' onclick='commentDeleteOk("+commentNum+","+commentGroup+")' value='삭제'>"
						+"<div>답글: "+item.conet+"</div>"			
						+"<input type='button' class='commentGood"+commentNum+"' onclick='commentGoodOrBad("+commentNum+","+commentGood+")' value='좋아요"+item.commentGood+"'>"
						+"<input type='button' class='commentBad"+commentNum+"' onclick='commentGoodOrBad("+commentNum+","+commentBad+")' value='싫어요"+item.commentBad+"'>"
						+"<hr></div>"
					 });
					 $(".fon"+commentNum).append(html);
					 html="<input class='scrollViewTo' id='scrollViewTo"+commentNum+"' type='button' onclick='commentToGet("+commentNum+","+commentCount+")' value='더보기' style='width:380px;'>"
					  +"<input class='conetToText"+commentNum+"' name='conetToText' type='text'>"
					  +"<input class='commentToWrite"+commentNum+"' type='button' onclick='commentWrite()' value='쓰기'>"
						  $(".fon"+commentNum).append(html);
						  
					 
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
				url:"/textant/commentRead.comment",

				data:{		
					page:$("#bookTotalPage").val(),
					nextPage:$("#nextToPage"+commentNum).val(),
					pageListCount:commentCount,
					pageCountBlock:1,
					pageCut:number,
					bookArticleNum:$("#bookArticleNum").val(),
					commentNum:commentNum,
					commentDelete:0
				},
				complete: function(){
					commentDelete($("#bookTotalPage").val(),$("#nextToPage"+commentNum).val(),commentCount,1,number,$("#bookArticleNum").val(),commentNum,1)
					 var num=$("#nextToPage"+commentNum).val()
					 num++;
					 var nextPageNum = $("#nextToPage"+commentNum).val();
					 if(nextPageNum==number){
						 $("#scrollViewTo").attr("type", "hidden");
					 }
					 $("#nextToPage"+commentNum).val(num);
				},
				success:function(data){
				
					var html="";
					 $.each(data, function(index,item) {
						 var commentNum=item.commentNum;
						 var commentCount=item.commentCount;
						 var commentGroup=item.commentGroup;
					 html+="<div class='commentDelete"+commentNum+"'><div>"+item.nickName+"</div>"
					 +"<input id='commentDeleteButton"+commentNum+"' type='hidden' onclick='commentDeleteOk("+commentNum+","+commentGroup+")' value='삭제'>"
					 +"<div>답글: "+item.conet+"</div>"		
					 +"<input type='button' class='commentGood"+commentNum+"' onclick='commentGoodOrBad("+commentNum+","+commentGood+")' value='좋아요"+item.commentGood+"'>"
					 +"<input type='button' class='commentBad"+commentNum+"' onclick='commentGoodOrBad("+commentNum+","+commentBad+")' value='싫어요"+item.commentBad+"'>"
					 +"<input type='button' class='reportComment' id='reportComment"+commentNum+"' onclick='reportComment("+commentNum+")'><label for='reportComment"+commentNum+"'><span></span>신고하기</label>"
					 +"<hr></div>"
					 });
					 $(html).insertAfter($(".fon"+commentNum).children("div").last());
// 					 $(".fon"+commentNum).children("hr").last().append(html);
// 					 $(".fon"+commentNum).append(html);
					
				}					
			}); 
		
}

function commentGoodOrBad(commentNum,commentGoodOrBad){
	
	$.ajax({	
		url:"/textant/commentGoodOrBad.comment",
//			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
		data:{				
			commentNum:commentNum,
			commentGoodOrBad:commentGoodOrBad
		},
		success:function(data){
			var AllCheckCount =data.commentGoodOrBadAllCount;
			var coodBadCheck=data.commentGoodOrBadAllCheck;
			if(AllCheckCount!=0){
				if(coodBadCheck==1){
					$(".commentGood"+commentNum).val("좋아요"+AllCheckCount);
				}else{
					$(".commentBad"+commentNum).val("싫어요"+AllCheckCount);
				}
			}else if(coodBadCheck==1){
				alert("이미싫어요눌렀엉");
			}else if(coodBadCheck==2){
				alert("이미좋아요눌렀엉");
			}
			 
		}					
	}); 
}

function reportComment(commentNum){
	$.ajax({	
		url:"/textant/reportComment.comment",

		data:{		
			commentNum:commentNum
		},
		success:function(data){
			if(data==1){
				alert("정상적으로 신고 되었습니다");
			}else{
				alert("이미 신고 하셨습니다");
			}
		}					
	});
}
function commentDelete(page,nextPage,pageListCount,pageCountBlock,pageCut,bookArticleNum,commentNum,commentDelete){

	$.ajax({	
			url:"/textant/commentRead.comment",

			data:{		
				page:page,
				nextPage:nextPage,
				pageListCount:pageListCount,
				pageCountBlock:pageCountBlock,
				pageCut:pageCut,
				bookArticleNum:bookArticleNum,
				commentNum:commentNum,
				commentDelete:commentDelete
			},
			success:function(data){
			
				$.each(data, function(index,item) {
					 var commentNum=item.commentNum;
				 	$("#commentDeleteButton"+commentNum).attr("type", "button");
				 });
				
				
			}					
		});
}
function commentTotalDelete(page,commentTotalCount,bookArticleNum,commentNum,commentDelete,commentSearchCheak,commentSearchList,commentSearch){
	
	 $.ajax({	
			url:"/textant/commentTotalRead.comment",

			data:{		
				page:page,
				commentTotalCount:commentTotalCount,
				bookArticleNum:bookArticleNum,
				commentNum:commentNum,
				commentDelete:commentDelete,
				commentSearchCheak:commentSearchCheak,
				commentSearchList:commentSearchList,
				commentSearch:commentSearch
			},
			success:function(data){
			
				$.each(data, function(index,item) {
					 var commentNum=item.commentNum;
				 	$("#commentDeleteButton"+commentNum).attr("type", "button");
				 });
				
				
			}					
		});
}
function commentDeleteOk(commentNum,commentGroup){
	$.ajax({	
		url:"/textant/commentDelete.comment",

		data:{		
			commentNum:commentNum,
			commentGroup:commentGroup
		},
		beforeSend : function(){

		},
		complete: function(){
			if(commentGroup!=0){
				$(".commentCount"+commentGroup).html("<span></span>답글달기: "+commentCount);	
				$("#commentCount"+commentGroup).attr("onClick","commentReply("+commentGroup+","+commentCount+")");
				commentReply(commentGroup,commentCount);
				}
		},
		success:function(data){
			commentCount =data;
			if(commentGroup!=0){
				$(".commentCount"+commentGroup).html("답글: "+commentCount);	
				$(".fon"+commentGroup).empty();
				$("#nextToPage"+commentGroup).val(1);
				$("#commentGroup"+commentGroup).val(0);
			}else{
				$(".commentCount").empty();
				$(".commentList").empty();
				$("#nextPage").val(1);
				commentListWrite()
			}
		}							
	});
}

function commentWrite() {
	var commentNum="";
	var scrollCommentTopCount="";
	var scrollResetDivision="";
	$.ajax({	
		url:"/textant/commentWrite.comment",

		data:{		
			page:$("#page").val(),
			commentTo:$("#commentTo").val(),
			commentTop:$("#commentTop").val(),
			commentCheck:$("#commentCheck").val(),
			conet:$("#conet").val(),
			depth:$("#depth").val(),
			bookArticleNum:$("#bookArticleNum").val(),
			commentGroup:$("#commentGroup").val()
		},
		beforeSend : function(){
			
		},
		complete: function(){
			if(scrollResetDivision!=0){
			$(".commentCount"+commentNum).html("<span></span>답글달기: "+scrollCommentTopCount);	
			$("#commentCount"+commentNum).attr("onClick","commentReply("+commentNum+","+commentCount+")");
			commentReply(commentNum,scrollCommentTopCount);
			}
		},
		success:function(data){
			if(data.ScrollResetDivision!=0){
				commentNum=$("#commentTop").val();
				scrollCommentTopCount=data.scrollCommentTopCount;
				scrollResetDivision=data.ScrollResetDivision;
				$(".fon"+commentNum).empty();
				$("#nextToPage"+commentNum).val(1);
				$("#commentGroup"+commentNum).val(0);
				$(".conetText").val("");
				$(".commentToText"+commentNum).val("");
			}else{
				$(".commentCount").empty();
				$(".commentList").empty();
				$("#nextPage").val(1);
				$(".conetText").val("");
				$(".commentToText"+commentNum).val("");
				commentListWrite()
			}
		}					
	});
	
}
</script>
<style>
</style>
<title>Insert title here</title>
</head>
<body>	
	<input id="bookArticleNum" type="hidden" name="bookArticleNum" value="1">
	<input id="page" type="hidden" name="page" value="1">
	<input id="nextPage" type="hidden" name="nextPage" value="1">
	<input id='pageListCount' type='hidden' name='pageListCount'>
	<input id='pageCountBlock' type='hidden' name='pageCountBlock'>
	<input id='pageCut' type='hidden' name='pageCut'>
	<input id='pageSize' type='hidden' name='pageSize'>
	<input id='commentTo' type='hidden' name='commentTo'>
	<input id='conet' type='hidden' name='conet'>
	<input id='commentTop' type="hidden" name='commentTop' value='0'>
	<input id='commentTotalCount' type="hidden" name='commentTotalCount'>
	<input id='bookTotalPage' type="hidden" name='bookTotalPage'>
	<input id='commentCheck' type="hidden" name='commentCheck' value='1'>
	<input id='commentSearch' type="hidden" name='commentSearch' value="">

	
	<select id='commentSearchList' name='commentSearchList'>
			<option value='1'>내용</option>
			<option value='2'>닉네임</option>
			</select>
			<input class='commentSearchText' name='commentSearchText' type='text'>
			<input class='commentSearchButton' name='commentSearchButton' type='button' value='검색'>
	<div class="commentCount">
	</div>
	<div class="ccc" width:1000px; height:1000px;">
		<div class="commentList">
		</div>
	
	</div>

</body>
</html>