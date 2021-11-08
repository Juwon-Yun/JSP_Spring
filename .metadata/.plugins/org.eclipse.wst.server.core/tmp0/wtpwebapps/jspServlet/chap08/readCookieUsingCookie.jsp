<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.ddit.chap08.util.Cookies" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookies 사용 예</title>
</head>
<%
	Cookies cookies = new Cookies(request);
%>
<body>

name 쿠키 = <%= cookies.getValue("name") %><br/>
<%if (cookies.exists("id")) {%>
id 쿠키 = <%=cookies.getValue("id") %><br/>
<%	} %>

</body>
</html>