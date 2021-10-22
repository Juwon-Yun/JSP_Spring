<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
// 쿠키저장소(웹브라우저에 있음)로부터 쿠키 목록을 가져와 cookies 객체에 대입
   Cookie[] cookies = request.getCookies();
// null 여부를 확인하지 않고 쿠키를 사용하면 NullPointerException이 발생할 수 있으므로
   if(cookies != null && cookies.length > 0) {
      //쿠키의 개수만큼 반복
      for(int i = 0; i < cookies.length; i++) {
         // 반복하는 도중에 쿠키객체의 이름이 name인 경우
         if(cookies[i].getName().equals("name")){
            Cookie cookie = new Cookie("name","");
           cookie.setMaxAge(0);
            response.addCookie(cookie);
         }
      }  
   }
%>
<html>
<head>
<meta charset="UTF-8">
<title>값 변경</title>
</head>
<body>
name 쿠키 삭제
<a href="/chap09/viewCookies.jsp">쿠키 목록</a>
</body>
</html>
