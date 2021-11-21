<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Error 500 page</title>
<style type="text/css">
	#img{
		background-image : url("http://localhost:8400/resources/images/500.jpg");
		background-repeat : no-repeat;
		width: 100vh;
		height: 100vh;
	}
</style>
</head>
<body>
<div>
	<strong>HTTP SERVER ERROR</strong>
	<br>
	<br>
	<br>
	서버 상태가 원활하지 않습니다.
	<br>
	<hr>
	<div id="img"></div>
</div>
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
