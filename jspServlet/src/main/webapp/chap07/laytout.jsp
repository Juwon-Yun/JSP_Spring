<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table style="width: 400px; border: 1px solid gray; cellPadding:0px; cellspacing:0px;" border="1">
	<tr >
		<td colspan="2">
			<jsp:include page="/chap07/module/top.jsp" flush="false"></jsp:include>
		</td>
	</tr>
	<tr>
		<td style="width: 100px; valign:top; ">
			<jsp:include page="/chap07/module/left.jsp" flush="false"></jsp:include>
		</td>
		<td style="width:300px; valign:top;">
		<!-- 내용 부분 : 시작 -->
		레이아웃1
		<br><br><br>
		<!-- 내용 부분 : 끝 -->
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<jsp:include page="/chap07/module/bottom.jsp" flush="false"></jsp:include>
		</td>
	</tr>
</table>
</body>
</html>