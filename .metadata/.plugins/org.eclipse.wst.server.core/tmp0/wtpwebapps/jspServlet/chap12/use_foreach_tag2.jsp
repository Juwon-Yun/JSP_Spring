<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>foreach 연습</title>
</head>
<body>
<!-- 
	배열, List, Map, Collection, Iterator, Enumration
	
	var : 변수 
	begin : 시작 인덱스
	end ; 종료 인덱스 
 -->
 

 <!-- 1부터 100까지의 합 -->
 <c:forEach var="j" begin="1" end="100">
 	<c:set var="sum" value="${sum+j}"/>
 </c:forEach>
 <br/>
 결과(1부터 100까지의 합) : ${sum}
 

<br>
<c:forEach var="i" begin="3" end="3">
	<c:forEach var="j" begin="1" end="9">
		${i} X ${j} = ${i*j}<br>
	</c:forEach>
</c:forEach>


 <%
 	Map<String, Object> map = new HashMap<>();
 	map.put("memId", "a001");
 	map.put("memName", "미역은대");
 	map.put("today", new java.util.Date());
 	
 %>
<c:set var="intArray" value="<%=new int[]{90, 80, 95, 85, 75} %>" scope="page">

</c:set>

 <c:set var="data" value="<%=map %>"/>
	 <c:forEach items="${data }" varStatus="stat">
 		${stat.count}&nbsp;${data.memId }&nbsp;
 		${data.memName }&nbsp;${data.today }<br>
 	</c:forEach>
 
 <br>
 
 <c:set var="gaeddong" value="<%=map %>"/>
 	${gaeddong.memId }<br/>
 	${gaeddong.memName }<br/>
 	${gaeddong.today }<br/>
 
 <!-- 
 items의 값으로 사용되는 것들..
 배열, Map, Collection(ex:List), Iterator, Enumeration
 
 index = 0 부터의 순서
 count = 1 부터의 순서 (루프의 순서)
 
 
  -->
 
 <h2>int형 배열</h2>
 <c:forEach var="i" items="${intArray }" begin="2" end="4" varStatus="stat">
 	${stat.index } : ${stat.count } : ${i }<br/>
 	end : ${stat.end } <br/>
 	step : ${stat.step } <br/>
 	
 </c:forEach>
</body>
</html>