<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="styleSheet" href="/resources/css/bootstrap.min.css">
<title>업로드된 파일 정보 뷰</title>
</head>
<body>

<div class="container">
	<div class="row" align="center">
	<c:forEach items="${list}" var="i" varStatus="stat">
		<div class="col-md-4">
			<h3>${i}</h3>
			<img alt="" src="/resources/upload/${i}"><br>
		</div>
	</c:forEach>
	</div>
</div>
</body>
</html>