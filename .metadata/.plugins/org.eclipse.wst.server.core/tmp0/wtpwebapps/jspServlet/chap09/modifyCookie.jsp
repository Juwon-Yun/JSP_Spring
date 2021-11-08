<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>값 변경</title>
</head>
<body>
name 쿠키의 값을 변경합니다.
<%
// 쿠키저장소(웹브라우저에 있음)로부터 쿠키 목록을 가져와 cookies 객체에 대입
   Cookie[] cookies = request.getCookies();
// null 여부를 확인하지 않고 쿠키를 사용하면 NullPointerException이 발생할 수 있으므로
   if(cookies != null && cookies.length > 0) {
      //쿠키의 개수만큼 반복
      for(int i = 0; i < cookies.length; i++) {
         // 반복하는 도중에 쿠키객체의 이름이 name인 경우
         if(cookies[i].getName().equals("name")){
            // 값을 JSP프로그래밍으로 변경(인코딩 처리)
            Cookie cookie = new Cookie("name",
                  URLEncoder.encode("JSP프로그래밍", "utf-8"));
            //쿠키를 생성할 때처럼 변경인 경우에도 서버에서 변경되므로
            //response객체의 헤더에 저장되어 응답됨
            response.addCookie(cookie);
         }
      }  
   }
%>

</body>
</html>