<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
입력한 값은 <%=request.getParameter("data") %>입니다.
	<input type="button" value="reinput" onclick="location.href='redirectTest.jsp'">
	<input type="button" value="exit" onclick="location.href='redirectTest.jsp'">
</body>
</html>