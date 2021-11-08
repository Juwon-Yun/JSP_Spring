<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL의 수치연산자</title>
</head>
<body>

<!-- /chap11/numCalc.jsp -->
<!-- 

숫자 타입과 객체를 수치 연산자와 함께 사용하면 객체가 숫자로 형변환된 후 연산을 수행함

 -->
${"10"+1 }<br/>
${"10"-1 }<br/>
${"10"*2 }<br/>
${"10"/2 }<br/>
${"10"+"20" }<br/>

<!-- 
숫자로 변환할 수 없는 객체와 수치 연산자는 함께 사용할 수 없음.
 -->
<%-- ${"50" + "억"}<br/> --%>
${"50"}억<br/>

<!-- 오라클은 null+1 = null 이지만 EL은 null + 1 = 1 이다. -->
${null+1}<br/>

<!-- null / 100 = 0, EL표기법에서는 null은 0으로 처리 -->
${null/100}<br/>

<!-- Infinity -->
${1/null}<br/>

<!-- 자바에서는 1 but, EL은 1.5.. 왜냐하면, Double로 변환 후 연산 수행 -->
${3/2}<br/>

<%
	String str = "2021";
	request.setAttribute("str2", "2021");
%>
<!-- flase -->
${str=="2021"}<br/>
${str.compareTo("2021")==0}<br/>
<!-- true (request 객체에 담아서 꺼내 써야한다.)-->
${str2}<br/>
${str2=="2021" }<br/>
</body>
</html>