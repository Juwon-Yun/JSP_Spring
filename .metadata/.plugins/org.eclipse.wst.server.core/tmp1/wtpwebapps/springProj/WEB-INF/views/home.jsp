<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>HOME</title>
</head>
<body>
<h1>HOME.jsp</h1>
<br><br>
<h1>컨트롤러 응답 연습 <br/></h1>
1. 리턴 타입이 Void 일 때 <br>
<a href="/goHome0101">요청 경로와 동일한 뷰</a><br>
<a href="/goHome0102">요청 경로와 동일한 뷰2</a>
<br><br><br>
2. 리턴 타입이 String 일 때 <br>
<a href="/goHome0201">반환값이 뷰를 가리킴1</a><br>
<a href="/sub/goHome0202">반환값이 뷰를 가리킴2</a>
<br><br><br>
3. 반환값이 redirect:로 시작하면 리다이렉트 방식으로 처리<br>
<a href="/goHome0204">리다이렉트 방식1</a><br>

</body>
</html>