<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)session.getAttribute("MEMBERID");
	boolean login = memberId == null ? false : true;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//session객체의 속성에 값이 있으면 로그인이 되어있다는 의미. true
	if(login){
%>
	아이디"<%=memberId %>"로 로그인 한 상태
<%		
	}else{
%>
	로그인하지 않은 상태
<%		
	}
%>
<br/>
<a href="/chap10/member/sessionLoginForm.jsp">되돌아가기</a>
<a href="javascript:history.back();">뒤로가기</a>
</body>
</html>