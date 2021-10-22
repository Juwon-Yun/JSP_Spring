<%@page import="java.util.Enumeration"%>
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
	//getAttributeNames() 메소드 : 속성의 이름 목록을 구함(juwon, 29 => juwon가 구해짐)
	Enumeration<String> attrEnum = application.getAttributeNames();
	while(attrEnum.hasMoreElements()){
		String name = attrEnum.nextElement();
		//getAttribute(name) 메소드 : 이름이 name인 속성의 값을 구함
		Object value = application.getAttribute(name);
%>
	application 속성 : <b><%=name %></b>, <%=value %><br>
<%	
	}
%>
</body>
</html>