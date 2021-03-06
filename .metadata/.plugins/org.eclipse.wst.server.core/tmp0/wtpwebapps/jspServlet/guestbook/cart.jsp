<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.guestbook.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%	
	String cartId = session.getId();
%>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
		
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">장바구니</h1>
			</div>
		</div>
		
		<div class="container">
			<div class="row">
				<table width="100%;">
					<tr>
						<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
						<td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기</a></td>
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
				<%
					int sum = 0;
					//장바구니인 cartlist에 등록된 모든상품을 가져옴.
					List<Product> cartlist = (List<Product>)session.getAttribute("cartlist");
					if(cartlist == null){
						cartlist = new ArrayList<>();
					}
					//cartlist에 등록된 모든 상품을 하나씩 가져와서 출력
					for(int i = 0; i < cartlist.size(); i++){
						Product product = cartlist.get(i);
						// 금액 = 상품의 가격 * 수량
						int total = product.getUnitprice() * product.getQuantity();
						sum = sum + total;
						
					%>
					<tr>
						<td><%=product.getProductId() %> - <%=product.getPname()%></td>
						<td><fmt:formatNumber value='<%=product.getUnitprice() %>' pattern="#,###"/>원</td>
						<td><%=product.getQuantity() %></td>
						<td><fmt:formatNumber value='<%=total %>' pattern="#,###"/>원</td>
						<td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a></td>
					</tr>
					<%	
					}//end for
					%>
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><fmt:formatNumber value='<%=sum %>' pattern="#,###"/>원</th>
						<th></th>
					</tr>
			</table>
			<a href="./products.jsp" class="btn btn-secondary">&laquo;쇼핑 계속하기</a>
		</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>