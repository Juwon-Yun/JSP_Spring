<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#error{color:red; font-size:10pt;}
</style>
<%
	//request 스코프에 담긴 오류메시지 얻어오기.	
	String errMsg = (String)request.getAttribute("errMsg");
	if( errMsg == null ){
		errMsg ="";
	}

%>
</head>
<body>
<form method="post" action="loginOk.jsp">
	아이디<input type="text" name="id"/><br/>
	비밀번호<input type="password" name="pwd"/><br/>
	<div id="error"><%=errMsg %></div>
	<input type="submit" value="로그인"/>
</form>
</body>
</html>