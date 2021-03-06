<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 상세 정보</title>
<script type="text/javascript">
	//장바구니에 등록하기 위한 핸들러 함수
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			//폼 문의 action 속성 값을 실행
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 정보</h1>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src='/resources/upload/${result.P_FILENAME }' style="width:100%;" />
			</div>
			<div class="col-md-6">
				<h3>상품명</h3>
				<p>상세설명</p>
				<p><b>상품 코드 : </b><span class="badge badge-danger">${result.P_ID }</span></p>
				<p><b>제조사 : </b>${result.P_MANUFACTURER }</p>
				<p><b>분류 : </b>${result.P_CATEGORY }</p>
				<p><b>재고 수 : </b> <fmt:formatNumber value='${result.P_UNITSINSTOCK }' pattern="#,###" /></p>
				<h4><fmt:formatNumber value='${result.P_UNITPRICE }' pattern="#,###" />원</h4>
				<p>
					<form name="addForm" action='/addCart?id=${result.P_ID }' method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
						<a href="/cart" class="btn btn-warning">장바구니 &raquo;</a>
						<a href="/products" class="btn btn-secondary">상품 목록 &raquo;</a>
					</form>
				</p>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>




