<%@page import="kr.or.ddit.chap08.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	Cookies cookies = new Cookies(request);
	if(cookies.exists("AUTH")){
%>
아이디" <%=cookies.getValue("AUTH") %> "로 로그인 한 상태<br/>
<a href="/chap09/emp/logout.jsp">로그아웃</a>
<%
	}else{
%>
로그인하지 않은 상태
<%		
	}
%>		
<body>

</body>
</html>