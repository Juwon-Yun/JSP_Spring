<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//추가할 쿠키 정보를 담고 있는 Cookie 객체를 생성함, URLEncoder 클래스를 사용해서 쿠키값을 인코딩함
	Cookie cookie = new Cookie("name", URLEncoder.encode("이준석", "utf-8"));
	//응답 데이터에 쿠키를 추가함. 쿠키 생성은 서버에서 해주기 때문에 response 객체의 header에 저장해서 응답해줌
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<title>쿠키 생성</title>
</head>
<body>
	<!-- 웹브라우저(클라이언트)의 쿠키 저장소에 쿠키가 저장되어 있음 -->
	<%=cookie.getName() %>쿠키의 값 = "<%=URLDecoder.decode(cookie.getValue(),"utf-8") %>"
	<br/>
	<a href="/chap09/viewCookies.jsp">쿠키 목록</a>
</body>
</html>