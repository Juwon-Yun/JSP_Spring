<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
<%!
String greeting = "Welcome to Web Shopping Mall";
String tagline = "Welcome to web Market";	
%>

<h1><%=greeting %></h1>
<h1><%=tagline %></h1>

<%
	Date day = new java.util.Date();
	String am_pm;
	int hour = day.getHours();
	int mintue = day.getMinutes();
	int second = day.getSeconds();
	if(hour / 12 == 0){
		am_pm = "AM";
	}else{
		am_pm = "PM";
		hour = hour - 12;
	}
	String CT = hour + ":" + mintue + ":" + second + " " + am_pm;
	out.println("현재 접속 시작: " + CT + "\n");
%>
</body>
</html>