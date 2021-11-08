<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 목록(/guestbook/products.jsp)</title>
</head>
<body>

<%-- <jsp:include page="/menu"/> --%>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 목록</h1>
	</div>
	
	<div class="container">
		<div class="row" align="center" >
		<c:forEach var="row" items="${list }" >
			<div class="col-md-4">
				<img alt="${row.P_FILENAME }" src="/resources/images/${row.P_FILENAME }" style="width: 100%;"/>
				<h3>${row.P_NAME}</h3>
				<p>${row.P_DESCRIPTION}</p>
				<p><fmt:formatNumber value='${row.P_UNITPRICE}' pattern="#,###"/>원</p>
				<p><a href="product?id=${row.P_ID}" class="btn btn-secondary" role="button">상세정보&raquo;</a></p>
			</div>
		</c:forEach>
		</div>
	</div>
</div>
<%-- <jsp:include page="/footer"/> --%>
</body>
</html>