<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="/vendor/js/jQuery.js"></script>
</head>
<script type="text/javascript">
$(function(){
});
</script>
<body>
	<form action="/first/member.do?chs=login" method="get">
		아이디:<input type="text" name="id">
		비번호:<input type="password" name="password">
	</form>
</body>
</html>