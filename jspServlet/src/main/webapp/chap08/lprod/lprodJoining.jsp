<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//읽어올 파라미터의 캐릭터 인코딩을 utf-8로 지정함
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="lprod" class="kr.or.ddit.chap08.LprodVO" scope="page"/>
<jsp:setProperty name="lprod" property="*"/>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	상품 아이디 : <jsp:getProperty property="lprod_id" name="lprod"/><br/>
	상품 코드 : <jsp:getProperty property="lprod_gu" name="lprod"/><br/>
	상품 명 : <jsp:getProperty property="lprod_nm" name="lprod"/>
</body>
</html>