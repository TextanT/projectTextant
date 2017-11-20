<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE>
<html>
<head>
	<title>Home</title>
	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  <style>
    body{
        background: url(/textant/resources/christmas-1911637_1920.jpg);
    }
    
    </style>
</head>
<body>
<%-- ${fileName} --%>
<!-- 	<div class="plus">확대</div>   -->
	<br/>
	<div class="fileDrop" style="width: 1200px;height: 900px;float:left;">
<!-- 	<img src='displayFile.text?fileName=1' width="49%" style="border: black solid 1px; margin-right: 0; padding-right: 0;"/> -->
<!-- 	<img src='displayFile.text?fileName=2' width="49%" style="border: black solid 1px; margin-left: 0; padding-left: 0;"/>	</div> -->
	<img class="leftPage" width="49%" height="880px" alt="" style="border: black solid 1px; margin-right: 0; padding-right: 0;overflow: hidden; cursor: pointer;"/>
	<img class="rightPage" width="49%" height="880px" alt="" style="border: black solid 1px; margin-right: 0; padding-right: 0;overflow: hidden; cursor: pointer;"/>
	</div>
	<a href="#" onclick="history.back()" style="float: left;">뒤로</a>
	<br/>
	
	
<script>
   let pageNum =1;
   let maxPage = 9999;
   maxPage = '${totalPageNum}';
//    $(".leftPage").
    $(document).keydown(function(event) {
		if (event.keyCode == '37') {
// 		alert('좌측 화살키를 누르셨습니다.');
			pageNum -= 2;
			if(pageNum<=0){
				alert("처음 페이지 입니다");
				pageNum +=2;
			} else {
				event.preventDefault();
        	    $(".leftPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+pageNum);
            	$(".rightPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+(pageNum+1));	
			}
		}
		else if (event.keyCode == '39') {
			
			pageNum += 2;
			if(pageNum>maxPage){
				alert("마지막 페이지 입니다");
				pageNum -=2;
			} else{
				event.preventDefault();
	            $(".leftPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+pageNum);
	            $(".rightPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+(pageNum+1));	
			}
            
// 		alert('우측 화살키를 누르셨습니다.');
		}
    });


    $(document).ready(function(){
//     	let pageNum = 1;
    	$(".leftPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+pageNum);
    	$(".rightPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+(pageNum+1));
//         pageNum = pageNum+2;
    	$(".leftPage").on("click",function(event){
    		pageNum -= 2;
    		if(pageNum<=0){
    			alert("처음 페이지 입니다");
    			pageNum +=2;
    		} else {
    			event.preventDefault();
                $(".leftPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+pageNum);
                $(".rightPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+(pageNum+1));	
    		}
            
        });
    	
		$(".rightPage").on("click",function(event){
			pageNum += 2;	
            event.preventDefault();
            if(pageNum>maxPage){
				alert("마지막 페이지 입니다");
				pageNum -=2;
			} else{
				event.preventDefault();
	            $(".leftPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+pageNum);
	            $(".rightPage").attr("src","displayFile.text?fileName="+'${fileName}'+"&pageNum="+(pageNum+1));	
			}
            
        });
    });
    
    $(".plus").on("click",function(event){
        let fileDrop = document.getElementById(".fileDrop");
    	fileDrop.style.width="1200px";
        fileDrop.style.height="800px";
    })
        
</script>
</body>
</html>
