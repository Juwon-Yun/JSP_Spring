<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELignored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>

<%
	request.setAttribute("RequestAttribute","request 내장객체");
%>
${requestScope.RequestAttribute}
</body>
</html>