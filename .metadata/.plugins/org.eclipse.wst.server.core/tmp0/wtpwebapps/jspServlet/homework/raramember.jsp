<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>라라마켓</title>
<link rel="stylesheet" href="/css/raramember.css"/>
</head>
<body>
<table border="1">
	<tr>
		<td>*이름</td>
		<td>
		<input type="text" value="" size="13" id="name">
		<span>한글로 5글자 이내로 입력해 주세요.</span>
		</td>
	</tr>
	<tr>
		<td>*아이디</td>
		<td>
		<input type="text" value="" size="13">
		<input type="button" value="중복 확인">
		<div>
		영문, 숫자를 조합하여 6~20자 이내로 입력<br>
		(대소문자 구별, 한글/특수문자 사용 불가)
		</div><br>
		<div>(아이디 중복 확인 결과 표기)</div>
		</td>
	</tr>
	<tr>
		<td>*비밀번호</td>
		<td>
		<input type="text" value="" placeholder="비밀번호 입력" size="13">
		<input type="text" value="" placeholder="비밀번호 입력" size="13">
		<div>영문, 숫자 특수문자를 8~20자 이내로 입력</div>
		</td>
	</tr>
	<tr>
		<td>*이메일</td>
		<td>
		<input type="text" value="" size="13">@
		<input type="text" value="" size="13">
		<select>
			<option>직접 입력</option>
			<option>직접 입력</option>
			<option>직접 입력</option>
			<option>직접 입력</option>
		</select>
		</td>
	</tr>
</table>
<input type="checkbox"> 메일 수신(이벤트, 신상품 등 고객님께 혜택이 되는 소식을 알려드립니다)

<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/raramember.js"></script>
</body>
</html>