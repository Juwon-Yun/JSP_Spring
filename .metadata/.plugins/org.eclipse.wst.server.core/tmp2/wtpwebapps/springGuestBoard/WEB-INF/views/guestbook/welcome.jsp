<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>/guestbook/welcome.jsp</title>
</head>
<body>
<jsp:include page="/menu"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">웹 쇼핑몰에 오신것을 환영합니다</h1>
	</div>
</div>
<div class="container">
	<div class="text-center">
		<h3>Welcome to web Market!</h3>
		<%	
			// 5초에 한번씩 
			response.setIntHeader("Refresh", 5);
			Date day = new Date();
			String am_pm;
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();
			if(hour / 12 == 0){
				am_pm = "AM";
			}else{
				am_pm = "PM";
				hour = hour - 12;
			}
			String CT = hour + ":" + minute + ":" + second + " " + am_pm;
			out.println("현재 접속 시작 : " + CT + "\n");
					
		%>
	</div>
</div>
<c:import url="/footer">
	<c:param name="id" value="test"></c:param>
</c:import>
</body>
</html>