<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INFO</title>
</head>
<body>
<table style="width:100%; border:1px solid gray; cellpadding:0px; cellspacing:0px" border="1">
<tr>
	<td>제품번호</td>
	<td>XXXX</td>
</tr>
<tr>
	<td>가격</td>
	<td>10,000원</td>
</tr>
</table>
<!-- /chap07/infoSub.jsp?type=A -->
<jsp:include page="infoSub.jsp">
	<jsp:param value="B" name="type"/>
</jsp:include>
<jsp:include page="infoSub.jsp">
	<jsp:param value="A" name="type"/>
</jsp:include>
</body>
</html>