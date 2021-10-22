<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage = "/chap06/error/viewErrorMessage.jsp" %>
<!-- page디렉티브의 errorPage 속성의 값으로 오류 처리 jsp를 지정함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%try{%> --%>
name 파라미터 값: <%=request.getParameter("name").toUpperCase() %>
<%-- <%}catch(Exception e){ %>--%><br><br>
name 파라미터가 없습니다.
<%-- <%} %> --%>
</body>
</html>