<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
MultipartRequest multi = 
	new MultipartRequest(request,
		"E:\\update",
		5 * 1024 * 1024,
		"UTF-8",
		new DefaultFileRenamePolicy()
		);
// 파일 최대 크기 : 5MB 설정
// 인코딩 utf-8로 설정
// 파일 이름이 겹치면 자동으로 rename() 해준다
// DefaultFileRenamePolicy : 서버에 동일 파일이 있으면 전송된 파일명
//							 뒤에 숫자를 덧붙여 중복되지 않도록 함

// 폼 페이지에서 전송된 요청 파라미터를 받음
Enumeration params = multi.getParameterNames();
while(params.hasMoreElements()){
	// 요청 파라미터 이름을 변수에 저장  name="params.nextElement()"
	String name = (String)params.nextElement();
	// 해당 파라미터의 value 값을 변수에 저장
	String value = multi.getParameter(name);
	
	out.println(name + " = " + value + "<br/>");
}
out.print("------------------------------<br/>");
// 요청 파라미터 중 파일을 전달받도록 MultipartRequest
// 객체 타입의 getFileNames() 메소드 작성
Enumeration files = multi.getFileNames();
while(files.hasMoreElements()){
	// name은 input태그의 name="filename"의 filename 값을 갖는다
	String name = (String)files.nextElement();
	// 저장 파일 이름
	String filename = multi.getFilesystemName(name);
	// 실제 파일 이름
	String original = multi.getOriginalFileName(name);
	// 파일 콘텐츠 타입
	String type = multi.getContentType(name);
	
	File file = multi.getFile(name);
	out.println("요청 파마리터 이름 : " + name + "<br/>");
	out.println("실제 파일 이름 : " + original + "<br/>");
	out.println("파일 콘텐츠 타입 : " + type + "<br/>");
	if(file != null){
		out.println("파일 크기 : " + file.length());
		out.println("<br/>");
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<title>/guestbook/fileupload01_process.jsp</title>
</head>
<body>

</body>
</html>