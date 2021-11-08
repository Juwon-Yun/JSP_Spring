<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- http://localhost:8100/chap11/text.jsp?memId=1234&memPwd=1111 -->
${param.memId}<br>
${param.memPwd}<br>
${param.memName}
</body>
</html>