<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<!-- errorNullPointer.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>errorNullPointer 에러 발생</title>
<style type="text/css">
	img{
		width: 500px;
		height: 500px;
		border-radius: 20px;
	}
</style>
</head>
<body>
<strong>errorNullPointer</strong>
<br><br>
errorNullPointer
<img src="/images/null.png">
</body>
</html>
<!-- 
	만약 에러 페이지의 길이가 512바이트 보다 작다면,
	인터넷 익스플로러는 이 페이지가 출력하는 에러 페이지를 출력하지 않고
	자체적으로 제공하는 'HTTP 오류 메시지' 화면을 출력한다.
	인터넷 익스플로러에서도 에러 페이지 내용을 올바르게 출력하려면
	응답 결과에 이 주석과 같은 내용을 포함시켜서
	에러 데이터가 512 바이트를 넘도록 해야한다.
 -->