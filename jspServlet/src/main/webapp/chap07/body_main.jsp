<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INFO</title>
</head>
<body>
<!-- http://localhost:8100/chap07/body_main.jsp?name=%ED%95%9C%EC%A3%BC%EC%97%B0 -->
include 전 name 파라미터 값: <%=request.getParameter("name") %>
<hr>
<!-- 우선순위 때문에 유제이가 먼저찍히고 한주연이 찍힌다 -->
<jsp:include page="/chap07/body_sub.jsp" flush="false">
	<jsp:param value="유제이" name="name"/>
</jsp:include>
<hr>
include 후 name 파라미터 값: <%=request.getParameter("name") %>
<hr>
</body>
</html>