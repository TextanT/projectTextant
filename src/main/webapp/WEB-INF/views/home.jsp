<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<style>
	ul{
	list-style: none;
	}
	ul a{
	text-decoration: none;
	}
	</style>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<ul>
<c:forEach var="files" items="${fileList}">
	<li><a href="/textant/read.text?fileName=${files}"><c:out value="${files}"/></a></li>
</c:forEach>
</ul>
<br/>
<a href="/textant/write.text">글쓰기</a>
<br/>
</body>
</html>
