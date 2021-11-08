<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>/guestbook/fileupload02_process.jsp</title>
</head>
<body>
<%
//cos.jar 패키지를 통한 멀티파일업로드
MultipartRequest multi = 
	new MultipartRequest(request, "E:\\Java_workspace\\6.jspSpring\\jspServlet\\src\\main\\webapp\\images"
			, 5*1024*1024
			, "UTF-8"
			, new DefaultFileRenamePolicy()
			);
String name1 = multi.getParameter("name1");
String subject1 = multi.getParameter("subject1");

String name2 = multi.getParameter("name2");
String subject2 = multi.getParameter("subject2");

String name3 = multi.getParameter("name3");
String subject3 = multi.getParameter("subject3");

//폼 페이지에서 전송되어 서버에 업로드된 여러 개의 파일을 가져오도록
//MultipartRequest 객체 타입의 getFilenames() 메소드를 통해
// Enumeration 객체 타입에 저장
Enumeration files = multi.getFileNames();
// Enumeration 객체 타입에 저장된 파일을 하나씩 가져옴
files.nextElement();
%>
<table border="1">
	<tr>
		<th>이름</th>
		<th>제목</th>
	</tr>
	<tr>
		<td><%=name1 %></td><td><%=subject1 %></td>
	</tr>
	<tr>
		<td><%=name2 %></td><td><%=subject2 %></td>
	</tr>
	<tr>
		<td><%=name3 %></td><td><%=subject3 %></td>
	</tr>
</table>
</body>
</html>