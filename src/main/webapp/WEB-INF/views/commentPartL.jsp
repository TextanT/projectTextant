<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>comment</title>


<style type="text/css">
/* .coInner {width:90%; height:95%; margin:0 auto;} */

/* .disNone {display: none;} */

/* .coShow {overflow-y:scroll;} */
/* .height80 {height: 85%;} */
/* .height70 {height: 66.5%;} */

/* .moreSee {margin: 30px 1% 10px 1%;  */
/* 	width:98%; height:25px; line-height:25px; */
/* 	background-color:#dbc3a6;  */
/* 	border-style:none; */
/* 	border-radius:3px;} */
/* .moreSee:hover{ */
/* 	-webkit-box-shadow:2px 2px 5px #aaa; */
/* 	-moz-box-shadow:2px 2px 5px #aaa; */
/* 	-o-box-shadow:2px 2px 5px #aaa; */
/* 	-ms-box-shadow:2px 2px 5px #aaa; */
/* 	box-shadow:2px 2px 5px #aaa; }	 */
	
/* .innerComment >div {margin: 5px;}	 */
/* .buttonOption{ */
/* 	color:#999; */
/* 	margin-left:5px; */
/* 	width:65px; height:22px; line-height:22px; */
/* 	background-color:white;  */
/* 	border:1px solid #999; */
/* 	border-radius:5px;} */
	
/* .ellipsis100{width:270px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;} */
/* .elVisible{width:100%; overflow:visible;}	 */
			
</style>

</head>
<body>
<div id="coInner_L" class="coInner">
		
	<div id="coWrite_L" class="coWrite">
		<!-- 현재페이지 댓글 보기 -->
		<span id="infoOne_L"></span>
		<a href="#" class="openCoWrite toggle"><h5 class="btnEffect"> 덧글쓰기 </h5></a>
			
			<!--서버에 넘겨야 할 것들 -->  
			<input type="hidden" id="bookArticleNum" name="bookArticleNum" value="${bookArticleNum}">
			<input type="hidden" id="pageR" name="page" value="1">
			<input type="hidden" id="loginCheck" name="loginCheck" value="${id}">
			<input type="hidden" id="nextPageR" name="nextPageR" value="1">
			<input type="hidden" id="pageListCount" name="pageListCount">
			<input type="hidden" id="pageCountBlock" name="pageCountBlock">
			<input type="hidden" id="pageCut" name="pageCut">
			<input type="hidden" id="pageSize" name="pageSize">
			<input type="hidden" id="commentTo" name="commentTo">
			<input type="hidden" id="conet" name="conet">
			<input type="hidden" id="commentTop" name="commentTop" value="0">
			<input type="hidden" id="commentCheck" name="commentCheck" value="0">
	
			<table id="coWriteForm_L" class="disNone toggleChild coWriteForm">
				<tr>
					<c:if test="${id != null}"><td>${id} 님</td></c:if>
					<c:if test="${id == null}"><td>게스트 님</td></c:if>
				</tr>
				<c:if test="${id != null}">
					<tr>	
						<td class="coWriteBtn_widthL">
							<textarea rows="7" id="coPlace" class="coPlace"></textarea>
						</td>
						<td class="coWriteBtn_widthR">
							<input type="submit" value="입력" id="coWriteBtn_L" class="coWriteBtn">
						</td>
					</tr>
				</c:if>
				<c:if test="${id == null}">
					<tr>
						<td class="coWriteBtn_widthL">
							<textarea rows="7" cols="70" class="coPlace" placeholder="로그인 후 덧글을 입력해주세요"></textarea>
						</td>
						<td class="coWriteBtn_widthR">
							<input type="button" value="입력" disabled="disabled" class="coWriteBtn">
						</td>
				</c:if>
				<tr>
					<td align="right" class="font7 gray">현재입력byte / 1000 byte</td>
					<td></td>
				</tr>
			</table>
		</div>

		<div id="coShow_L" class="height80 coShow">
			<div id="coShowBox_L"></div>
			<input type="button" class="moreSee" id="moreSee1" value="더보기">
		</div><!-- #coShow -->
			
		<!-- <div align="center"> pageCode</div>-->

</div><!-- #coInner -->				


<script>

	//ajax, 스크립트 시작하기 

	$.ajaxSetup({
		type:"POST",
		async:true,
		dataType:"json",
	});
	
	var commentGood=1;
	var commentBad=2;
	
	$(document).ready(function(){
		
		$('#moreSee1').click(function(){
			commentGet_L();
		});
		
		
// 		var commentEnter=""; // 답글 쓰기: enter로 넘기기
// 	 	$('.coPlace').keydown(function(event){
// 	 		  if(event.keyCode == 13){
// 	 			 commentEnter = 0;
// 	 	 		$("#commentTo").val(commentEnter);
// 	 	 		commentEnter = $(".coPlace").val();
// 	 	 		$("#conet").val(commentEnter);
// 	 	 		$(".coWriteBtn").trigger('click');
// 	 		  }
// 	 		});
	 	
	 	var commentNumber="";
	 	$(".coWriteBtn").on("mousedown", function() {
			commentNumber = 0;
	 		$("#commentTo").val(commentNumber);
	 		commentNumber = $(".coPlace").val();
	 		$("#conet").val(commentNumber);
	 	});
	 	
	 	$(".coWriteBtn").click(function (){ //답글 쓰기 
			commentWrite();
		});
	});
	
	function commentCount_L(){
		$.ajax({
			url:"/textant/commentCount.comment",
			type:"POST",
			async:true,
			dataType:"json",
			data:{
				page:$("#pageR").val(),
				bookArticleNum:$("#bookArticleNum").val()
			},
			error : function(xhr){
				alert("error html = " + xhr.statusText);
			},
			success: function(json){

				
				setTimeout(function() {
					let currPage = $(".sample-docs").turn("page");
					let nowPage = (Math.floor(currPage/2))*2;
					
					let html="<span id='nowP_L'>현재페이지 : <span class='lager'>"+nowPage+"</span><i>p</i> ┃ " 
					+json.pageCountBlock+"<i>p</i> ~ "+nowPage+"<i>p</i>&nbsp;&nbsp;&nbsp;댓글 <span class='lager'>"
					+json.pageListCount+"</span>개</span>";
					
					$("#nowP_L").remove();
					$("#infoOne_L").append(html);
					
					$("#pageListCount").val(json.pageListCount);
					$("#pageCountBlock").val(json.pageCountBlock);
					$("#pageCut").val(json.pageCut);
					$("#pageSize").val(json.pageSize);
					
					
				}, 10);
				
				commentRead_L(json);
			},
		});
	}
	
	
	//////////////////////////////전체 댓글 읽어오기
	function commentRead_L(read){
		let html= "";
		$.ajax({
			url:"/textant/commentRead.comment",
			type:"POST",
			async:true,
			dataType:"json",
			data:{
				page:$("#pageR").val(),
				nextPage:$("#nextPageR").val(),
				pageListCount:read.pageListCount,
				pageCountBlock:read.pageCountBlock,
				pageCut:read.pageCut,
				bookArticleNum:read.bookArticleNum,
				commentNum:0,
				commentDelete:0
			},
			error : function(xhr){
// 				alert("이 영역에는 덧글이 없습니다.");
			},
			complete: function(){	
				commentDelete($("#pageR").val(),$("#nextPageR").val(),read.pageListCount,read.pageCountBlock,read.pageCut,read.bookArticleNum,0,1)
				
				var num=$("#nextPageR").val();
				 num++;
				 var nextPageNum = $("#nextPageR").val(); 
				 var pageCutNum = $("#pageCut").val();
				 
				 if(nextPageNum==pageCutNum){
					 $("#moreSee1").attr("type", "hidden");
				 }else{
					 $("#moreSee1").attr("type", "button");
				 }
				 
				 $("#nextPageR").val(num);
				 
				 $(".close1").on("click",function(){
				 		$("#coShowBox_L").empty();
				 		$("#nextPageR").val(1);
					});

			},
			success: function(data){
				 $.each(data, function(index,item) {
					 let commentNum=item.commentNum;
					 let commentCount=item.commentCount;
					 let commentGroup=item.commentGroup;
					 
					 html +='<div class="commentDelete'+commentNum+'  coTotalForm">'+
					 '<table id="formTbl_L">'+
						'<tr id="inFormTbl_L">'+
							'<td rowspan="4" width="30px"><div id="profileImg"></div></td>'+
							'<td colspan="2" ><!--<i class="font7">'+item.commentNum+'</i><br>--><p class="ellipsis100 font9">'+item.conet+'</p></td>'+
						'</tr>'+
						'<tr>'+
							'<td class="font7 gray6" colspan="2" align="right"><a href="#" id="ellipsisView">더보기 ▼</a></td>'+
						'</tr>'+
						'<tr>'+
							'<td class="font7 gray6" colspan="2">'+item.nickName+'님 ┃'+item.writeDate+'┃'+
							'<img src="/textant/resources/img/heart.png" alt="좋아요" style="width:12px; height:12px;"> (<span class="comGoodCount'+commentNum+'">'+item.commentGood+'</span>) ┃  '+
							'<img src="/textant/resources/img/broken-heart.png" alt="싫어요" style="width:12px; height:12px; opacity:0.5;"> (<span class="comBadCount'+commentNum+'">'+item.commentBad+'</span>)┃ '+
							'<a href="#" id="showReCo'+commentNum+'" class="comment'+commentNum+'" name="chk" onClick="commentReply('+commentNum+','+commentCount+')"><!--댓글보기('+data[index].commentCount+')</a>--></td>'+
						'</tr>'+
						
						'<tr>'+
							'<td id="funcLine" class="font7 gray6" colspan="2" align="right">'+
								'<input id="commentDeleteButton'+commentNum+'" type="hidden" onclick="commentDeleteOk('+commentNum+','+commentGroup+')" value="삭제"> ┃'+
								'<a href="#" class="commentGood'+commentNum+'" onclick="commentGoodOrBad('+commentNum+','+commentGood+')">좋아요</a> ┃'+ 
								'<a href="#" class="commentBad'+commentNum+'" onclick="commentGoodOrBad('+commentNum+','+commentBad+')">싫어요</a> ┃'+
								'<a href="#" class="reportComment" id="reportComment'+commentNum+'" onclick="reportComment('+commentNum+')">신고하기</a> ┃'+
	//	 						'<a href="#" id="reCoWrite'+commentNum+'" class="toggle2" onclick="commentReplyWrite('+commentNum+')">댓글쓰기</a>'+
								"<input type='checkbox' id='c"+commentNum+"' class='comment"+commentNum+"' name='chk' onClick='commentReply("+commentNum+","+commentCount+")' value='"+commentNum+"'><label for='c"+commentNum+"' class='commentCount"+commentNum+"'><span></span>답글보기: "+data[index].commentCount+"</label>"+
								'<input id="nextToPage'+commentNum+'" type="hidden" name="nextToPage'+commentNum+'" value="1">'+	
								'<input id="commentGroup'+commentNum+'" type="hidden" name="commentGroup" value="0">'+
							'</td>'+
						'</tr></table><hr><div class="innerReply'+commentNum+'"></div></div>'
				 });
				$("#coShowBox_L").append(html);
			}
		});
		
	};
	
// 	//말줄임표 처리된 덧글 더보기 
// 	$(document).on("click", "#formTbl_L tr:nth-child(2) a",  function(){

// 		var parent = $(this).closest('table');
		
// 		if($('#inFormTbl_L p').hasClass('ellipsis100')){
// 			parent.find('.ellipsis100').removeClass('ellipsis100').addClass('elVisible');
// 		} else {
// 			parent.find('.elVisible').removeClass('elVisible').addClass('ellipsis100');
// 		}
// 	});
	
	
	////////////////////////// 메인 덧글에 대한 기능 
	
	
// 	function commentWrite(){ //답글 쓰기 
// 		let commentNum="";
// 		let scrollCommentTopCount="";
// 		let scrollResetDivision="";
		
// 		$.ajax({
// 			url:"/textant/commentWrite.comment",
// 			data:{
// 				page:$("#pageR").val(),
// 				commentTo:$("#commentTo").val(),
// 				commentTop:$("#commentTop").val(),
// 				commentCheck:$("#commentCheck").val(),
// 				conet:$("#conet").val(),
// 				depth:$("#depth").val(),
// 				bookArticleNum:$("#bookArticleNum").val(),
// 				commentGroup:$("#commentGroup").val()
// 			},
// 			error : function(xhr){
// 				alert("내용이 없거나, 500자 이상 입니다. 확인해주세요   " + xhr.statusText);
// 			},
// 			complete: function(){
// 	 			if(scrollResetDivision!=0){
// 	 			$(".commentCount"+commentNum).html("<span></span>답글달기: "+scrollCommentTopCount);	
// 	 			$("#commentCount"+commentNum).attr("onClick","commentReply("+commentNum+","+commentCount+")");
// 	 			commentReply(commentNum,scrollCommentTopCount);
// 	 			}
// 	 		},
// 			success: function(data){
// 				if(data.ScrollResetDivision == 1){
// 					commentNum = $("#commentTop").val();
// 					scrollCommentTopCount = data.scrollCommentTopCount;
// 					scrollResetDivision = data.ScrollResetDivision;
// 					$(".innerReply"+commentNum).empty();
// 					$("#nextToPage"+commentNum).val(1);
// 					$("#commentGroup"+commentNum).val(0);
// 					$(".coPlace").val("");
// 					$(".commentToText"+commentNum).val("");
					
// 				}else if(data.ScrollResetDivision == 0){
// 					$("#nowP").empty();
// 					$("#coShowBox").empty();
// 					$("#nextPageR").val(1);
// 					$(".coPlace").val("");
// 					$(".commentToText"+commentNum).val("");
// 					commentCount()
// 				}else{
// 					alert("로그인 하셔야 가능한 서비스 입니다");
// 				}
// 			},
// 		});
// 	}
	
	

	
// 	function commentGet_L(){ //메인 "더보기"
// 		let html="";
// 		$.ajax({	
// 			url:"/textant/commentRead.comment",
// 			data:{				
// 				page:$("#pageR").val(),
// 				nextPage:$("#nextPageR").val(),
// 				pageListCount:$("#pageListCount").val(),
// 				pageCountBlock:$("#pageCountBlock").val(),
// 				pageCut:$("#pageCut").val(),
// 				bookArticleNum:$("#bookArticleNum").val(),
// 				commentNum:0,
// 				commentDelete:0
// 			},
// 			complete: function(){
				
// 				commentDelete($("#pageR").val(),$("#nextPageR").val(),$("#pageListCount").val(),$("#pageCountBlock").val(),$("#pageCut").val(),$("#bookArticleNum").val(),0,1)
				 
// 				let num=$("#nextPageR").val()
// 				 num++;
							 
// 				let nextPageNum = $("#nextPageR").val(); 
// 				let pageCutNum = $("#pageCut").val();
// 				if(nextPageNum==pageCutNum){
// 					 $("#moreSee").attr("type", "hidden");
// 				 }else{
// 					 $("#moreSee").attr("type", "button");
// 				 }
// 				 $("#nextPageR").val(num);
// 			},
// 			success:function(data){
			
// 				 $.each(data, function(index,item) {
// 					 let commentNum=item.commentNum;
// 					 let commentCount=item.commentCount;
// 					 let commentGroup=item.commentGroup;
					 
// 					 html +='<div class="commentDelete'+commentNum+'  coTotalForm">'+
// 					 '<table id="formTbl">'+
// 						'<tr id="inFormTbl">'+
// 							'<td rowspan="4" width="30px"><div id="profileImg"></div></td>'+
// 							'<td colspan="2" ><!--<i class="font7">'+item.commentNum+'</i><br>--><p class="ellipsis100 font9">'+item.conet+'</p></td>'+
// 						'</tr>'+
// 						'<tr>'+
// 							'<td class="font7 gray6" colspan="2" align="right"><a href="#" id="ellipsisView">더보기 ▼</a></td>'+
// 						'</tr>'+
// 						'<tr>'+
// 							'<td class="font7 gray6" colspan="2">'+item.nickName+'님 ┃'+item.writeDate+'┃'+
// 							'<img src="/textant/resources/img/heart.png" alt="좋아요" style="width:12px; height:12px;"> (<span class="comGoodCount'+commentNum+'">'+item.commentGood+'</span>) ┃  '+
// 							'<img src="/textant/resources/img/broken-heart.png" alt="싫어요" style="width:12px; height:12px; opacity:0.5;"> (<span class="comBadCount'+commentNum+'">'+item.commentBad+'</span>)┃ '+
// 							'<a href="#" id="showReCo'+commentNum+'" class="comment'+commentNum+'" name="chk" onClick="commentReply('+commentNum+','+commentCount+')"><!--댓글보기('+data[index].commentCount+')</a>--></td>'+
// 						'</tr>'+
						
// 						'<tr>'+
// 							'<td id="funcLine" class="font7 gray6" colspan="2" align="right">'+
// 								'<input id="commentDeleteButton'+commentNum+'" type="hidden" onclick="commentDeleteOk('+commentNum+','+commentGroup+')" value="삭제"> ┃'+
// 								'<a href="#" class="commentGood'+commentNum+'" onclick="commentGoodOrBad('+commentNum+','+commentGood+')">좋아요</a> ┃'+ 
// 								'<a href="#" class="commentBad'+commentNum+'" onclick="commentGoodOrBad('+commentNum+','+commentBad+')">싫어요</a> ┃'+
// 								'<a href="#" class="reportComment" id="reportComment'+commentNum+'" onclick="reportComment('+commentNum+')">신고하기</a> ┃'+
// 	//	 						'<a href="#" id="reCoWrite'+commentNum+'" class="toggle2" onclick="commentReplyWrite('+commentNum+')">댓글쓰기</a>'+
// 								"<input type='checkbox' id='c"+commentNum+"' class='comment"+commentNum+"' name='chk' onClick='commentReply("+commentNum+","+commentCount+")' value='"+commentNum+"'><label for='c"+commentNum+"' class='commentCount"+commentNum+"'><span></span>답글보기: "+data[index].commentCount+"</label>"+
// 								'<input id="nextToPage'+commentNum+'" type="hidden" name="nextToPage'+commentNum+'" value="1">'+	
// 								'<input id="commentGroup'+commentNum+'" type="hidden" name="commentGroup" value="0">'+
// 							'</td>'+
// 						'</tr></table><hr><div class="innerReply'+commentNum+'"></div></div>'
// 				 });
// 				$("#coShowBox").append(html);
// 			}					
// 		}); 
// };
	
	/////////////////////////공통 기능 

	//로그인한 유저가 쓴 글에만 '삭제' 버튼 보이기
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
				beforeSend : function(){
				},
				complete: function(){
					
				},
				success:function(data){
				
					$.each(data, function(index,item) {
						 var commentNum=item.commentNum;
					 	$("#commentDeleteButton"+commentNum).attr("type", "button");
					 });
					
					
				}					
			});
	}
	
	
// 	function commentDeleteOk(commentNum,commentGroup){ //삭제하기
// 		var commentCountNum ="";
// 		$.ajax({	
// 			url:"/textant/commentDelete.comment",
// 			data:{		
// 				commentNum:commentNum,
// 				commentGroup:commentGroup
// 			},
// 			beforeSend : function(){
// 			},
// 			complete: function(){
// 				if(commentGroup!=0){
// 					$(".commentCount"+commentGroup).html("<span></span>답글달기: "+commentCountNum);	
// 					$("#commentCount"+commentGroup).attr("onClick","commentReply("+commentGroup+","+commentCountNum+")");
// 					commentReply(commentGroup,commentCountNum);
// 					}
// 			},
// 			success:function(data){
// 				commentCountNum =data;
// 				if(commentGroup!=0){
// 					$(".innerReply"+commentGroup).empty();
// 					$("#nextToPage"+commentGroup).val(1);
// 					$("#commentGroup"+commentGroup).val(0);
// 				}else{
// 					$("#nowP").empty();
// 					$("#coShowBox").empty();
// 					$("#nextPageR").val(1);
// 					commentCount();
// 				}
// 			}					
// 		});
// 	}
	
	
// 	function commentGoodOrBad(commentNum,commentGoodOrBad){  // 좋아요 싫어요
	
// 	$.ajax({	
// 		url:"/textant/commentGoodOrBad.comment",
// 		data:{				
// 			commentNum:commentNum,
// 			commentGoodOrBad:commentGoodOrBad
// 		},
// 		success:function(data){
// 			var AllCheckCount =data.commentGoodOrBadAllCount;
// 			var coodBadCheck=data.commentGoodOrBadAllCheck;
// 			if(AllCheckCount!=0){
// 				if(coodBadCheck==1){
// 					setTimeout(function() {
// 						$(".comGoodCount"+commentNum).text(AllCheckCount);
// 					},100);
					
// 				}else{
// 					setTimeout(function() {
// 						$(".comBadCount"+commentNum).text(AllCheckCount);
// 					},100);
// 				}
// 			}else if(coodBadCheck==1){
// 				alert("이 글에 이미 '싫어요'를 누르셨습니다.");
// 			}else if(coodBadCheck==2){
// 				alert("이 글에 이미 '좋아요'를 누르셨습니다.");
// 			}
			 
// 		}					
// 	}); 
// }
// 	function reportComment(commentNum){ //신고하기 
// 		$.ajax({	
// 			url:"/textant/reportComment.comment",
// 			data:{		
// 				commentNum:commentNum
// 			},
// 			beforeSend : function(){
// 			},
// 			complete: function(){
				
// 			},
// 			success:function(data){
// 				if(data==1){
// 					alert("정상적으로 신고 되었습니다");
// 				}else if(data==0){
// 					alert("이미 신고 하셨습니다");
// 				}else{
// 					alert("로그인 하셔야 가능한 서비스 입니다");
// 				}
				
// 			}					
// 		});
// 	}
	
	
// 	//////////////////////////////덧글의 답글에 대한 기능 
	

// function commentReply(commentNum,commentCount){  //덧글의 답글 보기와 쓰기
// 	var num=commentCount/$("#pageSize").val();
// 	var number=Math.ceil(num);
// 	var loginCheck=$("#loginCheck").val();
// 	 if($(".comment"+commentNum).is(":checked")){
// 		 $.ajax({	
// 			url:"/textant/commentRead.comment",
// 			error : function(xhr){
// 				var loginCheckOk="";
				
// 				$(".innerReply"+commentNum).append("답글이 없습니다.");
				
// 				if (loginCheck == "") {
// 					alert("로그인 하셔야 가능한 서비스 입니다");
					
// 				}else{
					
// 					loginCheckOk+="<div>답글을 남겨주세요.</div><br>"
// 						  +"<input class='conetToText"+commentNum+"' name='conetToText' type='text'>"
// 						  +"<input class='commentToWrite"+commentNum+" buttonOption' type='button' onclick='commentWrite()' value='쓰기'>"
// 						  $(".innerReply"+commentNum).append(loginCheckOk);
// 				}
// 			},
// 			data:{		
// 				page:$("#pageR").val(),
// 				nextPage:$("#nextToPage"+commentNum).val(),
// 				pageListCount:commentCount,
// 				pageCountBlock:$("#pageCountBlock").val(),
// 				pageCut:number,
// 				bookArticleNum:$("#bookArticleNum").val(),
// 				commentNum:commentNum,
// 				commentDelete:0
// 			},
// 			beforeSend : function(){
// 			},
// 			complete: function(){
// 				commentDelete($("#pageR").val(),$("#nextToPage"+commentNum).val(),commentCount,$("#pageCountBlock").val(),number,$("#bookArticleNum").val(),commentNum,1)
// 				var num=$("#nextToPage"+commentNum).val()
// 				 num++;
				 	
// 				 var nextPageNum = $("#nextToPage"+commentNum).val();
// 				 if(nextPageNum==number){
// 					 $("#scrollViewTo"+commentNum).attr("type", "hidden");
// 				 }
// 				 $("#nextToPage"+commentNum).val(num);
// 				 $("#commentGroup"+commentNum).val(1);
				 
// 				 var commentNumber="";
// 					$(".commentToWrite"+commentNum).on("mousedown", function() {
// 						commentNumber = 1;
// 						$("#commentTo").val(commentNumber);
// 						commentNumber = $(".conetToText"+commentNum).val();
// 						$("#conet").val(commentNumber);
// 						commentNumber = commentNum;
// 						$("#commentTop").val(commentNumber);
// 					});
					
				
// 					var commentEnter="";
// 				 	$('.conetToText'+commentNum).keydown(function(event){
// 				 		  if(event.keyCode == 13){
// 				 			 commentEnter = 1;
// 				 	 		$("#commentTo").val(commentEnter);
// 				 	 		commentEnter = $(".conetToText"+commentNum).val();
// 				 	 		$("#conet").val(commentEnter);
// 				 	 		commentEnter = commentNum;
// 							$("#commentTop").val(commentEnter);
// 				 	 		$(".commentToWrite"+commentNum).trigger('click');
// 				 		  }
// 				 		});
// 			},
// 			success:function(data){
				
// 				var html=" ";
				
// 				 $.each(data, function(index,item) {
// 					 var commentNum=item.commentNum;
// 					 var commentCount=item.commentCount;
// 					 var commentGroup=item.commentGroup;
					 
// 				 html+="<div class='commentDelete"+commentNum+" innerComment'><div style='position:relative;'>"+item.nickName+"&nbsp;<span class='gray6'>님</span>&nbsp;&nbsp;&nbsp;"
// 				 +"<input id='commentDeleteButton"+commentNum+"' type='hidden' onclick='commentDeleteOk("+commentNum+","+commentGroup+")' value='삭제' class='buttonOption' style='position:absolute; right:0px;'></div>"
// 				 +"<div>"+item.conet+"</div>"			
// 				 +"<input type='button' class='commentGood"+commentNum+" buttonOption' onclick='reCommentGoodBad("+commentNum+","+commentGood+")' value='좋아요&nbsp;"+item.commentGood+"'>"
// 				 +"<input type='button' class='commentBad"+commentNum+" buttonOption' onclick='reCommentGoodBad("+commentNum+","+commentBad+")' value='싫어요&nbsp;"+item.commentBad+"'>"
// 				 +"<hr></div>"
// 				 });
				 
// 				 $(".innerReply"+commentNum).append(html);
				 
// // 				 html="<input class='scrollViewTo' id='scrollViewTo"+commentNum+"' type='button' onclick='commentToGet("+commentNum+","+commentCount+")' value='더보기' style='width:380px;'>"
// 				 html= '<input type="button" class="moreSee" id="moreSee'+commentNum+'" onclick="commentToGet('+commentNum+','+commentCount+')" value="더보기">'
				 
// 				 if(loginCheck!=""){
					 
// 					 html+="<input class='conetToText"+commentNum+"' name='conetToText' type='text'>"
// 					  +"<input class='commentToWrite"+commentNum+" buttonOption' type='button' onclick='commentWrite()' value='쓰기'>"
// 					  }
// 				 $(".innerReply"+commentNum).append(html);
// 			}					
// 		}); 
	 
//  	}else{
//  		$("#commentGroup"+commentNum).val(0);
//  		$("#nextToPage"+commentNum).val(1);
//  		$(".innerReply"+commentNum).empty();
//  	}

// }

// 	function reCommentGoodBad(commentNum,commentGoodOrBad){  // 좋아요 싫어요
	
// 	$.ajax({	
// 		url:"/textant/commentGoodOrBad.comment",
// 		data:{				
// 			commentNum:commentNum,
// 			commentGoodOrBad:commentGoodOrBad
// 		},
// 		success:function(data){
// 			var AllCheckCount =data.commentGoodOrBadAllCount;
// 			var coodBadCheck=data.commentGoodOrBadAllCheck;
// 			if(AllCheckCount!=0){
// 				if(coodBadCheck==1){
// 					$(".commentGood"+commentNum).val("좋아요"+AllCheckCount);
					
// 				}else{
// 					$(".commentBad"+commentNum).val("싫어요"+AllCheckCount);
// 				}
// 			}else if(coodBadCheck==1){
// 				alert("이 글에 이미 '싫어요'를 누르셨습니다.");
// 			}else if(coodBadCheck==2){
// 				alert("이 글에 이미 '좋아요'를 누르셨습니다.");
// 			}
			 
// 		}					
// 	}); 
// }	
	
	
	
// 	function commentToGet(commentNum,commentCount){ //덧글의 답글의 '더보기'
// 		var num=commentCount/$("#pageSize").val();
// 		var number=Math.ceil(num);
// 			 $.ajax({	
// 					url:"/textant/commentRead.comment",
// 					data:{		
// 						page:$("#pageR").val(),
// 						nextPage:$("#nextToPage"+commentNum).val(),
// 						pageListCount:commentCount,
// 						pageCountBlock:$("#pageCountBlock").val(),
// 						pageCut:number,
// 						bookArticleNum:$("#bookArticleNum").val(),
// 						commentNum:commentNum,
// 						commentDelete:0
// 					},
// 					beforeSend : function(){
// 					},
// 					complete: function(){
// 						commentDelete($("#pageR").val(),$("#nextToPage"+commentNum).val(),commentCount,$("#pageCountBlock").val(),number,$("#bookArticleNum").val(),commentNum,1)
// 						var num=$("#nextToPage"+commentNum).val()
// 						 num++;
						 	
// 						 var nextPageNum = $("#nextToPage"+commentNum).val();
// 						 if(nextPageNum==number){
// 							 $("#scrollViewTo"+commentNum).attr("type", "hidden");
// 						 }
// 						 $("#nextToPage"+commentNum).val(num);
// 					},
// 					success:function(data){
					
// 						var html="";
// 						 $.each(data, function(index,item) {
// 							 var commentNum=item.commentNum;
// 							 var commentCount=item.commentCount;
// 							 var commentGroup=item.commentGroup;
							 
// 							 html+="<div class='commentDelete"+commentNum+" innerComment'><div style='position:relative;'>&nbsp;&nbsp;&nbsp;"+item.nickName+"&nbsp;<span class='gray6'>님</span>&nbsp;&nbsp;&nbsp;"
// 							 +"<input id='commentDeleteButton"+commentNum+"' type='hidden' onclick='commentDeleteOk("+commentNum+","+commentGroup+")' value='삭제' class='buttonOption' style='position:absolute; right:0px;'></div>"
// 							 +"<div>"+item.conet+"</div>"			
// 							 +"<input type='button' class='commentGood"+commentNum+" buttonOption' onclick='reCommentGoodBad("+commentNum+","+commentGood+")' value='좋아요&nbsp;"+item.commentGood+"'>"
// 							 +"<input type='button' class='commentBad"+commentNum+" buttonOption' onclick='reCommentGoodBad("+commentNum+","+commentBad+")' value='싫어요&nbsp;"+item.commentBad+"'>"
// 							 +"<hr></div>"
// 							 });
						 
// 						 $(html).insertAfter($(".innerReply"+commentNum).children("div").last());
// 					}					
// 				}); 
			
// 	}
	
</script>
</body>
</html>