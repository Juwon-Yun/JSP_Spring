<%@page import="kr.or.ddit.chap08.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	response.addCookie(Cookies.createCookie("AUTH", "", 0));
%>
로그아웃 하였습니다.<br>
<a href="/chap09/emp/loginForm.jsp">로그인화면으로 이동</a>
</body>
</html>