<%@page import="java.util.Map"%>
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
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String gubun = request.getParameter("gender");
	String major = request.getParameter("major");
%>

<table border="1" style="width: 500px; height: 150px;">
	<tr>
		<td colspan="2" style="height: 100px; text-align: center; font-size: 1.2em;font: bold;"> 
			학생정보
		</td>
	</tr>
	<tr>
		<td style="width:50px">이름</td>
		<td><%=name%></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><%=gubun%></td>
	</tr>
	<tr>
		<td>전공</td>
		<td> <%=major%>
	</tr>
	<tr>
		<td>취미</td>
		<td>
<%
		Map paramHobby = request.getParameterMap();
		String [] hobbies = (String[])paramHobby.get("hobby");
		if(hobbies != null){
		
			for(int i = 0; i < hobbies.length; i++){
%>
		<%=hobbies[i]%>
<%
		}
	}
%>
		 </td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="submit" value="회원정보 보내기" disabled="disabled">
			<input type="reset" value="다시 쓰기" disabled="disabled">
		</td>
	</tr>
</table>


</body>
</html>