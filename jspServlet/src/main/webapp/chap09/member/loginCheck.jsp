<%@page import="kr.or.ddit.chap08.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookies cookies = new Cookies(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 여부 검사</title>
</head>
<body>
<%
	if(cookies.exists("AUTH")){
%>
아이디"<%=cookies.getValue("AUTH") %>"로 로그인 한 상태<br>
<a href="/chap09/member/logout.jsp">로그아웃</a>
<%
	}else{
%>
로그인하지 않은 상태
<%		
	}
%>		
</body>
</html>