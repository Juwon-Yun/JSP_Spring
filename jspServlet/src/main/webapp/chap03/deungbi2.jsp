<%@page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!

	public static BigInteger ddd(BigInteger R, BigInteger A, BigInteger S, BigInteger N){
		BigInteger cnt = new BigInteger("1");
		BigInteger max = new BigInteger("100");
		
		while (true){
			A = A.multiply(R);
			S = S.add(A);
			N = N.add(cnt);
			if(N.compareTo(max) == -1) break;
		}
		return S;
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
	BigInteger R = new BigInteger("3");
	BigInteger A = new BigInteger("2");
	BigInteger S = A;
	BigInteger N = new BigInteger("2");
	BigInteger sum = ddd(R, A, S, N);
%>
<%=sum %>
</body>
</html>