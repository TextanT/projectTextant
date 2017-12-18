
//************** 오른쪽 슬라이드 닫기. (열기는 commentPartR에 )
$(function(){
// 	$(".open1").click(function(){
// 		$(".RightWrap").animate({right:170},500,"swing") 
// 		if(".open1") event.stopImmediatePropagation();
// 	});

	$(".close1").click(function(){
		$(".RightWrap").animate({right:-500},500,"swing")
		if(".close1") event.stopImmediatePropagation();
	});

	//event.stopImmediatePropagation();
}); 


//*******************왼쪽 슬라이드 
$(function() {
	$(".open2").click(function(){
		$(".LeftWrap").animate({width:'toggle'},500,"swing")
		
		commentCount_L();
	});
	if(".open2")event.stopImmediatePropagation();
});

//////// 토글, 스윙 부딛힘
//$(function(){
//	$(".close2").click(function(){
//		$(".LeftWrap").animate({left:-500},500,"swing")
		//event.stopImmediatePropagation();
//	});
	//event.stopImmediatePropagation();
//}); 


//********************** '전체 댓글' 보기
	function wrapWindowByMask(){
		var bgHeight = $(document).height();  
		var bgWidth = $(window).width();  

		$('#modalBg').css({'width':bgWidth,'height':bgHeight});  

		$('#modalBg').fadeIn(1000);      
		$('#modalBg').fadeTo("slow",0.5);    

		$('.totalCom').show();
	}

	$(document).ready(function(){
		$('.open3').click(function(e){
			e.preventDefault();
			wrapWindowByMask();
		});
		
		$('.totalCom .close3').click(function (e) {  
		    //링크 기본동작은 작동하지 않도록 한다.
		    e.preventDefault();  
		    $('#modalBg, .totalCom').hide();  
		});      
		
		$('#modalBg').click(function () {  
		    $(this).hide();  
		    $('.totalCom').hide();  
		});      
		
		
		$.ajax({
			url: "/textant/commentTotalCount.comment",
			type: "GET",
			dataType: "json",
			data:{
				page:$("#page").val(),
				bookArticleNum:$("#bookArticleId").val()
			},
			success: function(json){
				$("#totalComCount").append("<small> &nbsp;&nbsp;&nbsp;답글&nbsp;" +json.totalCount+"&nbsp;개</small>");
			}
		});
	});

	
//******************* 댓글쓰기 폼 보이기/숨기기에 따른, 댓글 내용 영역 사이즈 조절
$(function() {
	$(".toggle").click(function(){
		$("#coWriteForm").toggleClass("disNone");
		
		if($("#coShow").hasClass('height80')){
			$("#coShow").removeClass('height80').addClass('height70');
		}else{
			$("#coShow").removeClass('height70').addClass('height80');
		}
		
	});
	if(".toggle") event.stopImmediatePropagation();
});
$(function() {
	$(".toggle").click(function(){
		$("#coWriteForm_L").toggleClass("disNone");
		
		if($("#coShow_L").hasClass('height80')){
			$("#coShow_L").removeClass('height80').addClass('height70');
		}else{
			$("#coShow_L").removeClass('height70').addClass('height80');
		}
		
	});
	if(".toggle") event.stopImmediatePropagation();
});
$(function() {
	$(".toggle2").click(function(){
		$(".toggleChild2").toggle();
	});
	if(".toggle2")event.stopImmediatePropagation();
});


//******************* nav pop-up toggle
$(function() {
	$(".navPopBtn").click(function(){
		$("#nav-pop").toggle();
	});
	if(this)event.stopImmediatePropagation();
});


//**********************북마크 내용 보기
	function wrapWindowByMask1(){
		var bgHeight = $(document).height();  
		var bgWidth = $(window).width();  

		$('#modalBg').css({'width':bgWidth,'height':bgHeight});  
		$('#modalBg').fadeIn(1000);      
		$('#modalBg').fadeTo("slow",0.5);    

		$('.Bookmark').show();
	}

	$(document).ready(function(){
		$('.openBookmark').click(function(e){
			e.preventDefault();
			wrapWindowByMask1();
		});
		$('.Bookmark .close4').click(function (e) {  
		    e.preventDefault();  
		    $('#modalBg, .Bookmark').hide();  
		});       

		$('#modalBg').click(function () {  
		    $(this).hide();  
		    $('.Bookmark').hide();  
		});      
	});
	
	
	//**********************별점주기 보기
	$(document).ready(function(){
		$('#starClick').click(function(e){
			e.preventDefault();
			$('#starCounting').show();
		});
		$('#statComp').click(function (e) {  
		    e.preventDefault();  
		    $('#starCounting').hide();  
		});       
	});	
//
//
//	//******************* 책 내용 이미지로 보기- 텍스트로 보기 전환
//	let bookType = "txt";
//	bookType = '${bookType}';
//	 
//	let pageNum =3;
//	let maxPage = 9999;
//	maxPage = '${totalPageNum}';
//
//	$(document).ready(function(){
//				if(bookType=="txt"){
//					for(let i = 1; i <= maxPage; i++){
//						$(".sample-docs").append('<div style="width:100%;height:100%;text-align: center;"><embed width="95%" height="100%" type="text/html" src="displayFile.text?fileName=${fileName}&pageNum='+i+'&fileType='+bookType+'"></embed></div>');
//					}
//				}else if(bookType=="jpg"){
//					for(let i = 1; i <= maxPage; i++){
//				        
//					$(".sample-docs").append('<img class="leftPage" alt="" src="displayFile.text?fileName=${fileName}&pageNum='+ i +'&fileType='+bookType+'"/>');
//					}		
//				}		
//			});
//
//	$('#goText').click(function(){
//		location.href="read.text?fileName=${fileName}&bookType=txt";
//	});
//
//	$('#goJpg').click(function(){
//		location.href="read.text?fileName=${fileName}&bookType=jpg";
//	});
//
