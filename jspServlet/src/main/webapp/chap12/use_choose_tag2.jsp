<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>JSTL Choose 태그 2</title>
<!--  /chap12/use_choose_tag2.jsp?start=y -->
<c:if test="${param.start=='y'}">

<script type="text/javascript">
var userInput = prompt("당신의 취미는 무엇인가요?");

location.href="./use_choose_tag2.jsp?like="+userInput;

</script>
</c:if>
</head>
<body>

<!-- 

야구, 배구, 농구 => 스포츠
검은태양, 오징어게임 => 드라마보기
그외에는 => 아몰랑
-->
<c:choose>
	<c:when test="${param.like == '야구' or param.like == '배구' or param.like == '농구'}">
		스포츠
	</c:when>
	<c:when test="${param.like == '검은태양' or param.like == '오징어게임'}">
		드라마보기
	</c:when>
	<c:otherwise>
		아몰랑
	</c:otherwise>
</c:choose>

<c:if test="${param.like == '야구' }">스포츠</c:if>
<c:if test="${param.like == '검은태양' }">드라마보기</c:if>
<!-- c:else 는 존재하지 않기 때문에 밑에 처럼 작성한다. -->
<c:if test="${ (param.like != '야구') and (param.like != '검은태양') }">아몰랑</c:if>

</body>
</html>