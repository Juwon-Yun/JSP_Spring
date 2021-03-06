<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%	
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
</head>
<body>
<%-- ${sessionScope.cartlist } --%>
<%-- 	<jsp:include page="/menu"/> --%>
		
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">장바구니</h1>
			</div>
		</div>
		
		<div class="container">
			<div class="row">
				<table width="100%;">
					<tr>
						<td align="left"><a href="/deleteCart?cartId=${id}" class="btn btn-danger">삭제하기</a></td>
						<td align="right"><a href="/shippingInfo?cartId=${id}" class="btn btn-success">주문하기</a></td>
					</tr>
				</table>
			</div>
		</div>
		<div style="padding-top: 50px;">
			<table class="table table-hover">
				<tr>
					<td>상품</td>				
					<td>가격</td>				
					<td>수량</td>				
					<td>소계</td>				
					<td>비고</td>				
				</tr>
			<c:forEach items="${sessionScope.cartlist }" var="Product">
					<tr>
						<td>${Product.productId} - ${Product.pname}</td>
						<td><fmt:formatNumber value='${Product.unitprice}' pattern="#,###"/>원</td>
						<td>${Product.quantity}</td>
						<td><fmt:formatNumber value='${Product.unitprice * Product.quantity}' pattern="#,###"/>원</td>
						<td><a href="/removeCart?id=${Product.productId }" class="badge badge-danger">삭제</a></td>
					</tr>
					<c:set var="sum" value="${sum + Product.unitprice * Product.quantity}"/>
			</c:forEach>
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><fmt:formatNumber value='${sum}' pattern="#,###"/>원</th>
						<th></th>
					</tr>
			</table>
			<a href="/products" class="btn btn-secondary">&laquo;쇼핑 계속하기</a>
		</div>
<%-- 	<jsp:include page="/footer"/> --%>
</body>
</html>