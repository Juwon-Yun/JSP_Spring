<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)session.getAttribute("MEMBERID");
	String name = (String)session.getAttribute("NAME");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저장된 세션의 정보 확인</title>
</head>
<body>
회원 ID : <%=memberId %>
<br>
회원이름 : <%=name %>
<br>
<a href="setMemberInfo.jsp">되돌아가기</a>
<a href="closeSession.jsp">세션 종료</a>
</body>
</html>