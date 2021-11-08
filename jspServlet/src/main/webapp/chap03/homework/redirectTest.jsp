<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="sendredirectTest.jsp" method="get">
입력: <input type="text" name="data" id="data">
	  <input type="submit" value="print">
	  <input type="button" value="exit" onclick="location.href='redirectTest.jsp">
</form>

<%

	if( request.getParameter("key") != null ){

		String key = request.getParameter("key");
	%>
	<script type="text/javascript">
	document.getElementById("data").innerText = "<%=key%>";
<%
	}
%>
</script>
</body>
</html>