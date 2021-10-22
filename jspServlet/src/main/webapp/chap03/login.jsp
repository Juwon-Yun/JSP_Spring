<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("memberId");
	if( id != null && id.equals("madvirus") ){
		String value = "최가현";	
		String encodedValue = URLEncoder.encode(value, "utf-8");
		response.sendRedirect("/chap03/index.jsp?name="+value);
	}else{

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인에 실패</title>
</head>
<body>
잘못된 아이디입니다.
</body>
</html>
<%
	}
%>