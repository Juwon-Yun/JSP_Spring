<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3장예제</title>
</head>
<body>
3장의 인덱스 페이지
<%=request.getParameter("name") %>
</body>
</html>