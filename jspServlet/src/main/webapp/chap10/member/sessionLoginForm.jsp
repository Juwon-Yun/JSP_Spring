<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("MEMBERID");
	if(id == null){
		id = "";
	}
	String password = (String)session.getAttribute("PASSWORD");
	if(password==null){
		password = "";
	}
%>
<form action="/chap10/member/sessionLogin.jsp" method="post">
	아이디<input type="text" name="id" size="10" value="<%=id%>">
	암 호<input type="password" name="password" size="10" value="<%=password%>">
	<input type="submit" value="로그인">
</form>

</body>
</html>