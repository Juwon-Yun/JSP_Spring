<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.guestbook.vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	// 고유한 세션 내장 객체의 아이디를 가져옴
	String cartId = session.getId();
	
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipcode = "";
	String shipping_addressName = "";
	
	// 쿠키 객체의 쿠키 정보를 얻어옴
	Cookie [] cookies = request.getCookies();
	
	//쿠키가 있다면
	if(cookies != null){
		for(int i = 0; i < cookies.length; i++){
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if(n.equals("Shipping_cartId")){
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			}else if(n.equals("Shipping_name")){
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			}else if(n.equals("Shipping_shippingDate")){
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			}else if(n.equals("Shipping_country")){
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			}else if(n.equals("Shipping_zipcode")){
				shipping_zipcode = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			}else if(n.equals("Shipping_addressName")){
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			}
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">주문 정보</h1>
	</div>
</div>

<div class="container col-8 alert alert-info">
	<div class="text-center">
		<h1>영수증</h1>	
	</div>
	<div class="row justify-content-between">
		<div class="col-4" align="left">
			<strong>배송 주소</strong>
			<br>
			성명: <%=shipping_name %><br/>
			우편번호: <%=shipping_zipcode %><br/>
			주소: <%=shipping_addressName %>(<%=shipping_country %>)<br/>
		</div>
		<div class="col-4" align="right">
			<p><em>배송일 : <%=shipping_shippingDate %></em></p>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품</th>
					<th class="text-center">#</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					int sum = 0;
					//세션에 저장된 장바구니 정보를 얻어옴
					List<Product> cartlist = (ArrayList<Product>)session.getAttribute("cartlist");
					if(cartlist != null){
						cartlist = new ArrayList<>();
					}
					//장바구니에 담긴 상품리스트를 하나씩 출력
					for(int i = 0; i < cartlist.size(); i++){
						Product product = cartlist.get(i);
						// 금액 = 가격 * 수량
						int total = product.getUnitprice() * product.getQuantity();
						// 총금액 산출(누적)
						sum = sum + total;
				%>
					<tr>
						<td class="text-center"><em><%=product.getPname()%></em></td>
						<td class="text-center"><%=product.getQuantity()%></td>
						<td class="text-center"><%=product.getUnitprice()%></td>
						<td class="text-center"><%=total%>원</td>
					</tr>
				<%
 					}
				%>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td class="text-right"><strong>총액: </strong> </td>
						<td class="text-center text-danger"> <strong><%=sum %></strong> </td>
					</tr>
			</table>
			<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-secondary" role="button">이전</a>
			<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>