<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 시간</title>
</head>
<body>

<!-- 
	
	
	웹과 관련된 코드는 webapps 폴더의 하위 폴더에 위치시켜야 함.
	파일을 UTF-8 인코딩으로 저장해야 함
	실행할 때마다(F5) 결과가 다르므로 time.jsp는 동적 자원에 해당함
	실행할 때마다(F5) 결과가 왜 다를까? 웹 브라우저에 주소를 입력할 때마다 tomcat이
						 JSP를 매번 실행하기 때문에...
						 
	
 -->

지금 : <%=new Date() %>





</body>
</html>