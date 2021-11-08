<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 아이디 오류</title>
</head>
<body>
<%-- <jsp:include page="/menu"/> --%>
<div class="jumbotron">
	<div class="container">
		<h2 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h2>
	</div>	
</div>
<div class="container">
	<p><%=request.getRequestURL() %>?<%=request.getQueryString() %></p>
	<p><a href="/products" class="btn btn-secondary">상품 목록&raquo;</a></p>
</div>
<%-- <jsp:include page="/footer"/> --%>
</body>
</html>