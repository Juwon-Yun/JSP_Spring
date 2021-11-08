<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page errorPage = "/chap06/error/viewErrorMessage.jsp" %> --%>
<!-- page디렉티브의 errorPage 속성의 값으로 오류 처리 jsp를 지정함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- readParameter.jsp -->
<!-- 
	NullPointException이 발생하면 WAS는 자체적으로 error 페이지를 생성하는 대신 errorPage 속성에
	지정한 JSP를 실행하여 error 화면을 생성함
 -->
 <!--
 	<오류처리 우선순위>
 	1. page 디렉티브의 errorPage 속성
 	2. web.xml의 exception-type
 	3. web.xml의 error-code
 	4. 기본오류
  -->
name 파라미터 값: <%=request.getParameter("name").toUpperCase() %>
</body>
</html>