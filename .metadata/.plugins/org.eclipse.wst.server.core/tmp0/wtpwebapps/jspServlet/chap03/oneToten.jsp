<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int sum = 0;
	for(int i = 1; i <= 10; i++){
		sum = sum + i;
	}
%>
1 부터 10까지의 합은 <%=sum %>입니다.
<br>
<%
	//한 개 이상의 스크립트릿 코드 블록을 포함할 수 있음
	int sum2 = 0;
	for(int i = 11; i <= 20; i++){
		sum2 = sum2 + i;
	}
%>
11 부터 20까지의 합은 <%=sum2 %>입니다.


</body>
</html>