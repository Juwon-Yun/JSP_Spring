<%@page import="kr.or.teacher.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String cartId = session.getId();
%>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
</head>
<body>
<c:import url="/guestbook_teacher/menu"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">장바구니</h1>
	</div>
</div>
<div class="container">
	<div class="row">
		<table width="100%;">
			<tr>
				<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>"
				  class="btn btn-danger">삭제하기</a></td>
				<td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId%>"
				  class="btn btn-success">주문하기</a></td>
			</tr>
		</table>
	</div>
	<div style="padding-top:50px;">
		<table class="table table-hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
		<c:forEach var="product" items="${cartList }">
			<tr>
				<td>${product.productId } - ${product.pname }</td>
				<td>${product.unitPrice }</td>
				<td>${product.quantity }</td>
				<td>${product.unitPrice * product.quantity }</td>
				<td><a href="/removeCart?id=${product.productId }" 
						class="badge badge-danger">삭제</a></td>
			</tr>
		</c:forEach>
			<tr>
				<th></th><th></th><th>총액</th><th>${sum }</th><th></th>
			</tr>
		</table>
		<a href="/products" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
	</div>
	<hr />
</div>

<c:import url="/guestbook_teacher/footer"/>
</body>
</html>


