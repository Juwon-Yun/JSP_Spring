<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>JSTL의 if 태그 연습</title>
</head>
<body>
<!-- http://localhost:8100/chap12/use_if_tag.jsp?name=ddit -->
<c:if test="${param.name == 'ddit'}">
	문자열 ddit : name 파라미터의 값이 ${param.name}입니다.
</c:if>

<br><br>

<!-- var(변수명) value(값) scope(영역) -->

<!-- 
*scope : 영역
 - page, request, session, application
 -->
<%
String name = request.getParameter("name");
%>
<c:set var="ddit" value="ddit" scope="request"/>
<c:if test="${param.name == ddit}">
	name 파라미터의 값이 ${ddit}입니다.<br>
	<%=name %>
</c:if>
</body>
</html>