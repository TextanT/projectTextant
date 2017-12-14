<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>comment</title>


<style type="text/css">
#coInner {width:95%; height:95%; margin:0 auto;}
.disNone {display: none;}
#coShow {overflow-y:scroll;}
.height80 {height: 80%;}
.height70 {height: 60%;}
#moreSee {margin-top: 30px; width:100%;}
</style>

</head>
<body>
<div id="coInner">
		
	<div id="coWrite">
		<!-- 현재페이지 댓글 보기 -->
		<span id="infoOne"></span>
		
		<form>	
			<h4><a href="#" class="openCoWrite toggle"> 덧글쓰기 </a></h4>
			
			<!--서버에 넘겨야 할 것들 -->  
			<input type="hidden" id="bookArticleNum" name="bookArticleNum" value="1">
			<input type="hidden" id="page" name="page" value="1">
			<input type="hidden" id="nextPage" name="nextPage" value="1">
			<input type="hidden" id="pageListCount" name="pageListCount">
			<input type="hidden" id="pageCountBlock" name="pageCountBlock">
			<input type="hidden" id="pageCut" name="pageCut">
			<input type="hidden" id="pageSize" name="pageSize">
			<input type="hidden" id="commentTo" name="commentTo">
			<input type="hidden" id="content" name="content">
			<input type="hidden" id="commentTop" name="commentTop" value="0">
			<input type="hidden" id="commentCheck" name="commentCheck" value="0">
	
			<table id="coWriteForm" class="disNone toggleChild">
				<tr>
					<c:if test="${id != null}"><td>${id} 님</td></c:if>
					<c:if test="${id == null}"><td>게스트 님</td></c:if>
				</tr>
				<c:if test="${id != null}">
					<tr>	
						<td class="coWriteBtn_widthL">
							<textarea rows="5" id="coPlace" class="coPlace"></textarea>
						</td>
						<td class="coWriteBtn_widthR">
							<input type="submit" value="입력" id="coWriteBtn" class="coWriteBtn">
						</td>
					</tr>
				</c:if>
				<c:if test="${id == null}">
					<tr>
						<td>
							<textarea rows="5" cols="70" class="coPlace" placeholder="로그인 후 덧글을 입력해주세요"></textarea>
						</td>
						<td class="coWriteBtn_width">
							<input type="submit" value="입력" disabled="disabled" class="coWriteBtn">
						</td>
				</c:if>
				<tr>
					<td align="right" class="font7 gray">현재입력byte / 1000 byte</td>
					<td></td>
				</tr>
			</table>
			</form>
		</div>

		<div id="coShow" class="height80">
			<div id="coShowBox"></div>
			<input type="button" class="moreSee" id="moreSee" value="더보기">
		</div><!-- #coShow -->
			
		<!-- <div align="center"> pageCode</div>-->

</div><!-- #coInner -->				


<script>
	$.ajaxSetup({
		type:"POST",
		async:true,
		dataType:"json",
	});
	$(document).ready(function(){
		$('#moreSee').click(function(){
			commentGet_R();
		});
	});
	
	
	function commentGet_R(){ //"메인 더보기"
		
		let html="";
		$.ajax({	
			url:"/textant/commentRead.comment",
			data:{				
				page:$("#page").val(),
				nextPage:$("#nextPage").val(),
				pageListCount:$("#pageListCount").val(),
				pageCountBlock:$("#pageCountBlock").val(),
				pageCut:$("#pageCut").val(),
				bookArticleNum:$("#bookArticleNum").val(),
				commentNum:0,
				commentDelete:0
			},
			complete: function(){
				
				commentDelete($("#page").val(),$("#nextPage").val(),$("#pageListCount").val(),$("#pageCountBlock").val(),$("#pageCut").val(),$("#bookArticleNum").val(),0,1)
				 
				let num=$("#nextPage").val()
				 num++;
							 
				let nextPageNum = $("#nextPage").val(); 
				let pageCutNum = $("#pageCut").val();
				 if(nextPageNum==pageCutNum){
					 $("#scrollView").attr("type", "hidden");
				 }
				 $("#nextPage").val(num);
			},
			success:function(data){
			
				 $.each(data, function(index,item) {
					 let commentNum=item.commentNum;
					 let commentCount=item.commentCount;
					 let commentGroup=item.commentGroup;
					 
					 html +='<div class="commentDelete'+commentNum+'">'+
					 '<table border="1" class="padding10">'+
						'<tr>'+
						'<td rowspan="4" width="30px">+ profilePicture+</td>'+
						'<td colspan="2" ><i class="font7">'+item.commentNum+'</i><br><p class="ellipsis100">'+item.conet+'</p></td>'+
					'</tr>'+
					'<tr>'+
						'<td class="font7" colspan="2" align="right">더보기 ▼</td>'+
					'</tr>'+
					'<tr>'+
						'<td class="font7" colspan="2">'+item.nickName+'┃'+item.writeDate+'┃'+' ♥ ('+item.commentGood+') ┃  (☞'+item.commentBad+') ┃ '+
						'<a href="#" id="showReCo'+commentNum+'" class="comment'+commentNum+'" name="chk" onClick="commentReply('+commentNum+','+commentCount+')">댓글보기('+data[index].commentCount+')</a></td>'+
					'</tr>'+
					
					'<tr>'+
						'<td class="font7" colspan="2" align="right">'+
							'<input id="commentDeleteButton'+commentNum+'" type="hidden" onclick="commentDeleteOk('+commentNum+','+commentGroup+')" value="삭제"> ┃'+
							'<a href="#" class="commentGood'+commentNum+'" onclick="commentGoodOrBad('+commentNum+','+commentGood+')">좋아요</a> ┃'+ 
							'<a href="#" class="commentBad'+commentNum+'" onclick="commentGoodOrBad('+commentNum+','+commentBad+')">싫어요</a> ┃'+
							'<a href="#" class="reportComment" id="reportComment'+commentNum+'" onclick="reportComment('+commentNum+')">신고하기</a> ┃'+
							'<a href="#" id="reCoWrite" class="toggle2">댓글쓰기</a>'+
							'<input id="nextToPage'+commentNum+'" type="hidden" name="nextToPage'+commentNum+'" value="1">'+	
							'<input id="commentGroup'+commentNum+'" type="hidden" name="commentGroup" value="0">'+
						'</td>'+
					'</tr></table></div>'
				 });
				$("#coShowBox").append(html);
			}					
		}); 
};
	
	
	$(".coWriteBtn").click(function(){ //답글 쓰기 
		let commentNum="";
		let scrollCommentTopCount="";
		let scrollResetDivision="";
		
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
			error : function(xhr){
				alert("error html = " + xhr.statusText);
			},
			success: function(data){
				if(data.ScrollResetDivision != 0){
					commentNum = $("#commentTop").val();
					scrollCommentTopCount = data.scrollCommentTopCount;
					scrollResetDivision = data.ScrollResetDivision;
					
					//$(".fon"+commentNum).empty();
					$("#nextToPage"+commentNum).val(1);
					$("#commentGroup"+commentNum).val(0);
					$(".coPlace").val("");
					$(".commentToText"+commentNum).val("");
					
				}else{
					$("#nowP").empty();
					$("#coShowBox").empty();
					$("#nextPage").val(1);
					$(".coPlace").val("");
					$(".commentToText"+commentNum).val("");
					commentInfo();
				}
			},
			complete: function(){
				if(scrollResetDivision != 0){
					$(".comment"+commentNum).html("댓글보기("+scrollCommentTopCount+")");	
					$("#reCoWrite"+commentNum).attr("onClick","commentReply("+commentNum+","+commentCount+")");
					commentReply(commentNum,scrollCommentTopCount);
				}
				
			}
		});
	});
	
	//오른쪽 댓글보기 창에 대한,전체 댓글 정보 가져오기
	function commentInfo(){
		let currPage = $(".sample-docs").turn("page");
		let nowPage = (Math.floor(currPage/2))*2;
		
		let html="<span id='nowP'>"+json.pageCountBlock+"p ~ "+nowPage+"p ┃   현재페이지 : "+nowPage+"p ┃   댓글 "+json.pageListCount+"개</span>";
		$("#nowP").remove();
		$("#infoOne").append(html);
		
		$("#pageListCount").val(json.pageListCount);
			$("#pageCountBlock").val(json.pageCountBlock);
			$("#pageCut").val(json.pageCut);
			$("#pageSize").val(json.pageSize);
			
			commentRead(json);
		
	};
	
	
	//ellipsisView//답글 text-overflow:ellipsis 더보기 
	
	//commentReply('+commentNum+','+commentCount+')//답글의 답글보기
	/*
	function commentReply(commentNum,commentCount){ 
// 	console.log(commentCount);
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
					page:$("#page").val(),
					nextPage:$("#nextToPage"+commentNum).val(),
					pageListCount:commentCount,
					pageCountBlock:$("#pageCountBlock").val(),
					pageCut:number,
					bookArticleNum:$("#bookArticleNum").val(),
					commentNum:commentNum,
					commentDelete:0
				},
				beforeSend : function(){
				},
				complete: function(){
					commentDelete($("#page").val(),$("#nextToPage"+commentNum).val(),commentCount,$("#pageCountBlock").val(),number,$("#bookArticleNum").val(),commentNum,1)
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
					 +"<div>이것은 답글의 답글 ★: "+item.conet+"</div>"			
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
	*/
	
	//commentReplyWrite('+commentNum+')답글의 답글 쓰기
	/*
	 $(".fon"+commentNum).append(html);
					 html="<input class='scrollViewTo' id='scrollViewTo"+commentNum+"' type='button' onclick='commentToGet("+commentNum+","+commentCount+")' value='더보기' style='width:380px;'>"
						  +"<input class='conetToText"+commentNum+"' name='conetToText' type='text'>"
						  +"<input class='commentToWrite"+commentNum+"' type='button' onclick='commentWrite()' value='쓰기'>"
						  $(".fon"+commentNum).append(html);
	*/
	
	
	
	
	function GoodBad(commentNum,commentGoodOrBad){ //좋아요 싫어요
		
		$.ajax({	
			url:"/textant/commentGoodOrBad.comment",
			data:{				
				commentNum:commentNum,
				commentGoodOrBad:commentGoodOrBad
			},
			success:function(data){
				var Count =data.commentGoodOrBadAllCount;
				var check=data.commentGoodOrBadAllCheck;
				
				if(Count!=0){
					if(check==1){
							$(".comGoodCount"+commentNum).text(Count);	
						
					}else{
						setTimeout(function() {
							$(".comBadCount"+commentNum).text(Count);						
						},500);
						
					}
				}else if(check==1){
					alert("이미 싫어요를 누르셨습니다.");
				}else if(check==2){
					alert("이미 좋아요를 누르셨습니다.");
				}
				 
			}					
		}); 
	}
	//reportComment('+commentNum+')//신고하기
	
	//commentDeleteOk('+commentNum+','+commentGroup+')//삭제하기
	
	
</script>
</body>
</html>