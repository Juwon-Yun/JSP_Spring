<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>책 정보 수정</title>
</head>
<body>
	<h1>책 수정</h1>
<!-- 	<form action="/update" method="post"> -->
<!-- action을 지우면 URL param( detail?bookId=1 )가 같이 넘어감 -->
	<form method="post">
		<p>제목 : <input type="text" name="title" required value="${data.TITLE}"/></p>
		<p>카테고리 : <input type="text" name="category" required value="${data.CATEGORY}"/></p>
		<p>가격 : <input type="text" name="price" value='<fmt:formatNumber pattern="#,###" value="${data.PRICE }"/>'/></p>
		<input type="submit" name="update" value="수정하기"/>
	</form>
</body>
</html> 