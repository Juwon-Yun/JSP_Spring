<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

// /chap11/useELObject02.jsp

// request영역의 request객체에 속성정보를 set
request.setAttribute("name", "개똥이");

// session영역의 session객체에 속성정보를 set
session.setAttribute("name", "김은대");

// application영역의 application객체에 속성정보를 set
application.setAttribute("name", "신용재");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Object02</title>
</head>
<body>

<!-- requset영역의 request 객체의 name이라는 이름의 값을 가져옴 -->
request 객체의 name 속성 : ${name }<br/>

<!-- session영역의 session 객체의 name이라는 이름의 값을 가져옴 -->
session 객체의 name 속성 : ${sessionScope.name }<br/>

<!-- application 영역의 application객체의 name이라는 이름의 값을 가져옴 -->
application 객체의 name 속성 : ${applicationScope.name }<br/>

source : ${param.source} <br/>

주소 : ${pageContext.request.requestURI }<br/>

</body>
</html>