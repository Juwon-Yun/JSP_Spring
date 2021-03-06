<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>상품편집(/guestbook/editProduct.jsp)</title>
<script type="text/javascript">
	//상품 삭제 여부를 확인하는 핸들러 함수
	function deleteConfirm(id){
		if(confirm("해당 상품을 삭제합니다!")==true){
			location.href="./deleteProduct.jsp?id="+id;
		}else{
			//삭제취소(아무런 동작도 일어나지 않음)
			return;
		}
	}
</script>
</head>
<body>
<c:import url="/guestbook_teacher/menu" />
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 편집</h1>
	</div>
</div>

<div class="container">
	<div class="row" align="center">
		<c:forEach var="row" items="${list}" varStatus="stat">
		<div class="col-md-4">
			<img src="/resources/images/${row.P_FILENAME }" style="width:100%;" />
			<h3>${row.P_NAME}</h3>
			<p>${row.P_DESCRIPTION}</p>
			<p>${row.P_UNITPRICE}</p>
			<p>
				<c:if test="${param.edit=='update'}">
					<a href="/updateProduct?id=${row.P_ID}" 
						class="btn btn-success" role="button">수정 &raquo;</a>
				</c:if>
				<c:if test="${param.edit=='delete'}">
					<a href="#" onclick="deleteConfirm('${row.P_ID}')" 
						class="btn btn-danger" role="button">삭제 &raquo;</a>
				</c:if>
			</p>
		</div>
		</c:forEach>
	</div>
</div>
<c:import url="/guestbook_teacher/footer" />
</body>
</html>



