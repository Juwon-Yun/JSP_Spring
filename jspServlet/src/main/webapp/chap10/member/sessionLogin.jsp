<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id") == null ?
			"noId" : request.getParameter("id");
	String password = request.getParameter("password") == null ?
			"noPassword" : request.getParameter("password");
	
	if(id.equals("a001")){
		session.setAttribute("MEMBERID", id);
		session.setAttribute("PASSWORD", password);
%>
		로그인에 성공했습니다.<br/>
		<a href="setSessionTimeout.jsp">타임아웃설정</a><br/>
		<a href="sesstionLoginCheck.jsp">로그인여부검사</a><br/>
		<a href="sessionlogout.jsp">로그아웃</a><br/>
<%
	}else{
%>
		로그인에 실패했습니다.		
<%
	}
%>

</body>
</html>