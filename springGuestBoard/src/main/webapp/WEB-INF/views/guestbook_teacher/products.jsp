<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 목록(/guestbook/products.jsp)</title>
</head>
<body>
<c:import url="/guestbook_teacher/menu" />
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 목록</h1>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			<c:forEach items="${list }" var="row">
			<div class="col-md-4">
				<img src="resources/upload/'${row.P_FILENAME }'" style="width:100%" />
				<h3>${row.P_NAME}</h3>
				<p>${row.P_DESCRIPTION }</p>
				<p>${row.P_UNITPRICE }</p>
				<p><a href="/guestbook_teacher/product?id='${row.P_ID}'"
					class="btn btn-secondary" role="button">상세 정보&raquo;></a>
				</p>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
<c:import url="/guestbook_teacher/footer" />
</body>
</html>


