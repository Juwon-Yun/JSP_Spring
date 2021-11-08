<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>체크박스 데이터가 boolean 타입인 경우</title>
</head>
<body>
	<form action="/board/registerCheckbox05Post" method="post">
		<!-- value를 false 로 줌  -->
		외국인여부 : <input type="checkbox" name="foreigner" value="false"> <br>
		<input type="submit" value="registerCheck05">
	</form>
</body>
</html>