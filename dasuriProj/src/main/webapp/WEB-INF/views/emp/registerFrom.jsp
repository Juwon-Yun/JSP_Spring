<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>/emp/registerForm.jsp</title>
</head>
<body>
	<h2>Spring Form</h2>
	<form:form modelAttribute="member" method="post" action="/emp/register">
	<form:hidden path="userId"/>
		<table>
<!-- 			<tr> -->
<%-- 				<td> <form:label path="userId">유저ID</form:label></td> --%>
<!-- 				<td> -->
				<!-- 
					path : 폼 항목에 바인딩되는 폼 객체의 프로퍼티를 지정함
					<form:input path="userId"/> path의 값에 객체의 프로퍼티가 존재하지 않으면 에러 발생
				-->
<%-- 					<form:input path="userId"/> --%>
<%-- 					<font color="red"> <form:errors path="userId" /> </font> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<td> <form:label path="userName">이름</form:label></td>
				<td>
					<form:input path="userName"/>
					<font color="red"> <form:errors path="userName"/> </font>
				</td>
			</tr>
			<tr>
				<td> <form:label path="email">MAILID</form:label>E-</td>
				<td>
					<form:input path="email"/>
					<font color="red"> <form:errors path="email"/> </font>
				</td>
			</tr>
			<tr>
				<td> <form:label path="password">비밀번호ID</form:label></td>
				<td>
					<form:password path="password"/>
					<font color="red"> <form:errors path="password"/> </font>
				</td>
			</tr>
			<tr>
				<td> <form:label path="introduction">소개</form:label> </td>
				<td>
					<form:textarea path="introduction"/>
					<font color="red"> <form:errors path="introduction"></form:errors> </font>
				</td>
			</tr>
			<tr>
				<td> <form:label path="hobbyList">취미</form:label> </td>
				<td>
					<!-- items => Model에 들어갈 값을 미리 정함 -->
					<form:checkboxes items="${hobbyMap}" path="hobbyList"/>
					<font color="red"> <form:errors path="hobbyList"></form:errors> </font>
				</td>
			</tr>
			<tr>
				<td> <form:label path="developer">개발자 여부</form:label> </td>
				<td>
					<form:checkbox path="developer" value="Y"/>
					<font color="red"> <form:errors path="developer"/> </font>
				</td>
			</tr>
			<tr>
				<td> <form:label path="foreinger">외국인 여부</form:label> </td>
				<td>
					<form:checkbox path="foreinger" value="false"/>
					<font color="red"> <form:errors path="foreinger"/> </font>
				</td>
			</tr>
			<tr>
				<td> <form:label path="gender">성별</form:label> </td>
				<td>
					<form:radiobuttons path="gender" items="${genderCodeMap}"/>
					<font color="red"> <form:errors path="gender"/> </font>
				</td>
			</tr>
			<tr>
				<td> <form:label path="nationality">국적</form:label> </td>
				<td>
					<form:select path="nationality" items="${nationalityMap}" />
					<font color="red"> <form:errors path="nationality"/> </font>
				</td>
			</tr>
			<tr>
				<td> <form:label path="carList">소유차량</form:label> </td>
				<td>
					<form:select path="carList" items="${carCodeMap}" multiple="true"/>
					<font color="red"> <form:errors path="carList"/> </font>
				</td>
			</tr>
		</table>
		<form:button name="register">등록</form:button>
	</form:form>
</body>
</html>