<%@page import="kr.or.ddit.chap08.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	if(id.equals(password)){
		response.addCookie(Cookies.createCookie("AUTH",id,-1));
	}else{
%>
<script type="text/javascript">
	alert("로그인에 실패하였습니다.");
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