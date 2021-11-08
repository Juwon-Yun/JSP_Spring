<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>책 목록</title>
<script type="text/javascript">
window.onload = function(){
	function fn_create(){
		location.href="/create";
	}
	let subBtn = document.getElementById('sub');
	let nameTxt = document.getElementsByName('keyword');
	
	subBtn.addEventListener('click',function(event){
		console.log(nameTxt.value);
	});
}
</script>
</head>
<body>
	<h1>책 목록</h1>
	<div>
		<!--  form 태그의 Default HTTP 메소드는  GET임. action을 생략하면 현재 uri를 요청함-->
		<form>
			<input type="text" name="keyword" value="${keyword}">		
			<input id="sub" type="submit" value="검색">		
		 </form>
	</div>
	<table border="1">
		<thead>
			<tr>
				<th>제목</th>
				<th>카테고리</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="row" items="${data}">
			<tr>
				<td>${row.TITLE}</td>
				<td>${row.CATEGORY}</td>
				<td>${row.PRICE}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<input type="button" value="책입력" onclick="fn_create();"/>
	
</body>
</html>