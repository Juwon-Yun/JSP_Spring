<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옵션 선택 화면</title>
</head>
<body>
<form action="view.jsp"  method="get">

보고 싶은 페이지 선택: 
	<!-- 사용자의 선택에 따라서 다른 요청 결과를 보여주고 싶을때 forward를 쓴다 -->
	<select name="code">
		<option value="A">A 페이지</option>
		<option value="B">B 페이지</option>
		<option value="C">C 페이지</option>
	</select>

	<input type="submit" value="이동"/>
</form>
</body>
</html>