<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	name속성의 값은 입력요소의 이름이고 요청파라미터의 이름이다.
	
	request객체는 JSP에서 기본으로 제공해주는 객체여서 따로 클래스를 import 하지 않아도 된다.
 -->
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String addr = request.getParameter("address");
	String [] pet = request.getParameterValues("pet");
%>

<%=name %><br>
<%=addr %><br>
<%=Arrays.toString(pet) %><br>
<%	
	if(pet != null){
	for(int i = 0; i < pet.length; i++){
	%>
	<%=pet[i] %><br>
	<%
	}
	}
%>
<b>request.getParameterNames() 메소드 사용</b><br>
<%
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()){
		String name2 = (String)paramEnum.nextElement();
	%>
	<%=name2 %><br>
	<%
	}
%>
<b>request.getParameterMap() 메소드 사용</b><br>
<%
	/*
		요청 파라미터의 맵을 구함. 맵은 <파라미터 이름, 값> 쌍으로 구성됨
		{
			"name":"홍길동",
			"address" : "대전",
			"pet":"dog cat pig"
		}
	*/
	Map parameterMap = request.getParameterMap();
	String [] petParam = (String[])parameterMap.get("pet");
	if(petParam != null){
		for(int j = 0; j < petParam.length; j++){
			
	%>
	<%= petParam[j] %><br>
	<%	
		}
	}
%>
</body>
</html>