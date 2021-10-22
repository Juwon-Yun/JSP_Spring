<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>쿠키 목록</title>
</head>
<body>
쿠키 목록<br>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0) {
		for(int i = 0; i < cookies.length; i++) {
%>
			<%=cookies[i].getName() %> =
			<!-- 인코딩해서 값을 저장했으므로, 디코딩해서 값을 읽음 -->
			<%=URLDecoder.decode(cookies[i].getValue(), "utf-8") %><br>
<%			
		//JSESSIONID : 톰캣 컨테이너에서 세션을 유지(HttpsResponse)하기 위해 발급하는 키
		}
	} else {
%>
	쿠키가 존재하지 않습니다.
<%		
	}
%>
<br/>
<a href="/chap09/modifyCookie.jsp">쿠키값 변경</a>
<a href="/chap09/deleteCookie.jsp">쿠키 삭제</a>
</body>
</html>