<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="../js/validation.js"></script>
<title></title>
</head>
<body>
<%
// response.setIntHeader("Refresh", 5);
%>
<!-- 
	fmt : bundle => 태그 몸체에서 사용할 리소스 번들을 지정함
	fmt : message => 메세지를 출력
	fmt : setBundle => 특정 메세지 번들을 사용할 수 있도록 로딩함
	
	위치 : src/bundle/message.properties 및 src/bundle/message_en.properties
 -->
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<!-- 번들의 식별자(bundle.message) -->
<fmt:bundle basename="bundle.message">

<!-- 동적 -->
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3"><fmt:message key="title"/></h1>
	</div>
</div>
<div class="container">
	<div class="text-right">
		<a href="?language=ko">Korea</a> |
		<a href="?language=en">English</a>&nbsp;
	</div>
	<!-- enctype="multipart/form-data" multi로 데이터 처리하려면 필수 -->
	<form action="processAddProduct.jsp" name="newProduct" class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="productId"/></label>
			<div class="col-sm-3">
				<input type="text" name="productId" class="form-control" id="productId"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="pname"/></label>
			<div class="col-sm-3">
				<input type="text" name="name" class="form-control" id="name"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
			<div class="col-sm-3">
				<input type="text" name="unitPrice" class="form-control" id="unitPrice"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="description"/></label>
			<div class="col-sm-3">
				<textarea name="description" rows="2" cols="50" class="form-control"></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
			<div class="col-sm-3">
				<input type="text" name="manufacturer" class="form-control"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="category"/></label>
			<div class="col-sm-3">
				<input type="text" name="category" class="form-control"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
			<div class="col-sm-3">
				<input type="text" name="unitsInStock" class="form-control" id="unitsInStock"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="condition"/></label>
			<div class="col-sm-3">
				<input type="radio" name="condition" value="New" /><fmt:message key="condition_New"/>
				<input type="radio" name="condition" value="Old" /><fmt:message key="condition_Old"/>
				<input type="radio" name="condition" value="Refurbished" /><fmt:message key="condition_Refurbished"/>
			</div>
		</div>
		<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productImage"/></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="button" class="btn btn-primary" value="<fmt:message key="button"/>" onclick="CheckAddProduct()"/>
			</div>
		</div> 
	</form>
</div>
<!-- 번들의 범위를 지정한다 -->
</fmt:bundle>
<jsp:include page="footer.jsp"/>
</body>
</html>