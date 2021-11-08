<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
	session.setAttribute("MEMBERID", "juwon");
	session.setAttribute("NAME", "윤주원");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션에 정보 저장</title>
</head>
<body>
세션에 정보를 저장하였습니다.
<a href="getMemberInfo.jsp">저장된 세션 정보 보기</a>
</body>
</html>