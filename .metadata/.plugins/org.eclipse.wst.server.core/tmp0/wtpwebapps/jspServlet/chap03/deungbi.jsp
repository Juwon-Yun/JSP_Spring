<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!

	int seq(int start,int dif, int n){
		int cnt = 1;
		int ans = start;
		while(true){
			cnt += 1;
			ans *= dif;
			if(cnt == n){
				return ans;
			}
		}
	}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div{
		border-color: 3px;
	}
</style>
</head>
<body>
<%
	int start = 2;
	int dif = 3;
	int n = 100;
	int result = seq(start, dif, n);

%>
	<div>
		<p>초항 : <%=start %></p>
		<br>
		<br>
		<p>공비 : <%=dif%></p>
		<br>
		<br>
		<p>최대항 : <%=n %></p>
		<br>
		<br>
		<p>결과 : <%=result %></p>
	</div>

</body>
</html>