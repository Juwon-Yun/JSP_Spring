<%@page import="kr.or.ddit.chap08.util.Cookies"%>
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
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		if(id.equals(pw)){
			response.addCookie(Cookies.createCookie("AUTH",id,-1));
%>
	<strong>로그인 성공!!!</strong>
<%
		}else{
%>
<script type="text/javascript">
	alert("로그인 실패!!!.");
	history.go(-1);
</script>
<%
		}
%>
로그인에 성공했습니다
<br>
<a href="./loginCheck.jsp">로그인 여부 판단</a>
</body>
</html>