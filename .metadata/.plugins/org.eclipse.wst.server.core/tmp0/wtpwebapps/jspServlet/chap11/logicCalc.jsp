<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logicCalc.jsp</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#btnIn').on('click', function(){
		window.open("/chap10/member/memberRegist.jsp","oWin","width=700, height=700");
	});
});
</script>
</head>
<body>
<button id="btnIn">회원가입및로그인</button>
<h2>EL 논리연산</h2>
${true and true} : ${true and false}<br>
${true or false} : ${false or false}<br>
<br/>
${sessionScope.memberVo.memId }<br>

<c:if test="${sessionScope.memberVo.memId=='a001'}">
	관리자
</c:if>
<c:if test="${sessionScope.memberVo.memId!='a001'}">
	사용자
</c:if>
<c:if test="${sessionScope.memberVo.memId==null}">
	나그네
</c:if>
</body>
</html>