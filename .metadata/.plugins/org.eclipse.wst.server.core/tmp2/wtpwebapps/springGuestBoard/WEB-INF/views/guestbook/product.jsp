<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 상세 정보</title>
</head>
<body>
<jsp:include page="/menu"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 정보</h1>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img alt="" src='/resources/images/${map.P_FILENAME}' style="width: 100%;">
			</div>
			<div class="col-md-6">
				<h3>${map.P_NAME }</h3>
				<p>${map.P_DESCRIPTION}</p>
				<p><b>상품코드: </b><span class="badge badge-danger">${map.P_ID}</span></p>
				<p><b>제조사: </b> ${map.P_MANUFACTURER}</p>
				<p><b>분류: </b> ${map.P_CATEGORY}</p>
				<p><b>제고 수: </b> <fmt:formatNumber value='${map.P_UNITSINSTOCK}' pattern="#,###"/>개</p>
				<h4><fmt:formatNumber value='${map.P_UNITPRICE }' pattern="#,###"/>원</h4>
				<form name="addForm" action="/addCart?id=${map.P_ID}" method="post">
					<a href="#" class="btn btn-info" id="addSession">상품 주문&raquo;</a>					
					<a href="/cart?cartId=${map.P_ID}" class="btn btn-warning" >장바구니&raquo;</a>					
					<a href="/products" class="btn btn-secondary" >상품 목록&raquo;</a>					
				</form>				
			</div >
		</div>
	</div>
</div>
<jsp:include page="/footer"/>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/script.js"></script>
</body>
</html>