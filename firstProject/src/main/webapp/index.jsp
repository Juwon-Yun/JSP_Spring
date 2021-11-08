<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
// 	response.setIntHeader("Refresh", 5);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나비병원</title>
</head>
<body>
	<div class="container">
		<c:import url="./WEB-INF/view/nav.jsp"/>
		<c:import url="./WEB-INF/view/header.jsp"/>
		<c:import url="./WEB-INF/view/main.jsp"/>
		<c:import url="./WEB-INF/view/footer.jsp"/>
		<c:import url="./WEB-INF/view/copyright.jsp"/>
	</div>
	<script src="./vendor/js/jQuery.js"></script>
	<script src="./js/scripts.js"></script>
</body>
</html>