<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>BOARD</title>
</head>
<body>
<h3>REGISTER</h3>

<form action="/board/post" method="post">
	<button type="submit" name="register">Register</button>
	<button type="submit" name="modify">Modify</button>
	<button type="submit" name="remove">Remove</button>
</form>

</body>
</html>