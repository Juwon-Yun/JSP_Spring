<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<h3>Result</h3>

<table>
	<tr>
		<th>유저 ID </th>
		<td>${member.userId}</td>
	</tr>
	<tr>
		<th>유저 이름 </th>
		<td>${member.userName}</td>
	</tr>
	<tr>
		<th>유저 E-Mail </th>
		<td>${member.email}</td>
	</tr>
	<tr>
		<th>유저 비밀번호 </th>
		<td>${member.password}</td>
	</tr>
	<tr>
		<th>유저 소개 </th>
		<td>${member.introduction}</td>
	</tr>
	<tr>
		<th>유저 취미 </th>
		<td> 
		<c:forEach items="${member.hobbyList}" var="row">
			<c:if test="${row eq 1}">Sports</c:if>
			<c:if test="${row eq 2}">Music</c:if>
			<c:if test="${row eq 3}">Chess</c:if>
			<c:if test="${row eq 4}">Cooking</c:if>
		</c:forEach> 
		</td>
	</tr>
	<tr>
		<th>개발자 여부 </th>
		<td>${member.developer}</td>
	</tr>
	<tr>
		<th>외국인 여부 </th>
		<td>${member.foreinger}</td>
	</tr>
	<tr>
		<th>유저 성별 </th>
		<td>
		<c:choose>
			<c:when test="${member.gender eq 1}">Male</c:when>
			<c:when test="${member.gender eq 2}">Female</c:when>
			<c:otherwise>Other</c:otherwise>
		</c:choose>		
		</td>
	</tr>
	<tr>
		<th>유저 국적 </th>
		<td>
		<c:choose>
			<c:when test="${member.nationality eq 1}">Korea</c:when>
			<c:when test="${member.nationality eq 2}">Germany</c:when>
			<c:when test="${member.nationality eq 3}">USA</c:when>
			<c:when test="${member.nationality eq 4}">Japen</c:when>
		</c:choose>		
		</td>
	</tr>
	<tr>
		<th>소유 차량 </th>
		<td>
		<c:forEach items="${member.carList}" var="row">
			<c:if test="${row eq 1}">르노삼성</c:if>
			<c:if test="${row eq 2}">현대</c:if>
			<c:if test="${row eq 3}">기아</c:if>
			<c:if test="${row eq 4}">제네시스</c:if>
			<c:if test="${row eq 5}">테슬라</c:if>
			<c:if test="${row eq 6}">아우디</c:if>
			<c:if test="${row eq 7}">벤츠</c:if>
			<c:if test="${row eq 8}">BMW</c:if>
		</c:forEach>
		</td>
	</tr>
</table>

</body>
</html>