<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//기존 세션은 삭제되고 기본 세선이 재생성된다.
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 종료</title>
</head>
<body>

세션을 종료하였습니다.<br/>
<a href="sessionInfo.jsp">세션정보</a><br/>
<a href="getMemberInfo.jsp">회원세션정보</a>

</body>
</html>