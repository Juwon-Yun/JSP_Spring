<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>책 상세보기</title>
</head>
<body>
<!-- 
	컨트롤러에서 mav 객체에 data라는 이름으로 DB검색 결과를 넣었으므로
	mav.addObject("data", detailMap);
	${data.TITLE} 형식으로 사용하게 됨
 -->

	<h1>책 상세, ${bookId}</h1>
	<p>제목 : ${data.TITLE}</p>
	<p>카테고리 : ${data.CATEGORY}</p>
<%-- 	<p>가격 : <fmt:formatNumber value="${data.PRICE}" pattern="#,###"/></p> --%>
	<p>가격 : <fmt:formatNumber value="${data.PRICE}" type="number" maxFractionDigits="3" /></p>
	<p>입력일 : <fmt:formatDate value="${data.INSERT_DATE}" pattern="yyyy/MM/dd hh시 mm분 ss초" /></p>
					<!-- 		String bookId		 -->
	<p><a href="/update?bookId=${bookId}">수정</a></p>
	<form action="/delete" method="post">
		<input type="text" name="bookId" value="${bookId}">
		<input type="submit" value="삭제 ">
	</form>	
	<p><a href="/list">목록으로</a></p>
</body>
</html>