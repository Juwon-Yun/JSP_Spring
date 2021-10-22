<%@page import="kr.or.ddit.chap10.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO mvo = (MemberVO)session.getAttribute("memberVo");
	String name = mvo.getMemName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[type='text']").attr("disabled", "disabled");
	// readonly : form 전송 가능
	// disabled : form 전송 불가
	$('#updateBtn').on('click', function(){
		$("input[type='text']").removeAttr("disabled");
	});

});
</script>
</head>
<body>
	<%=name %>님의 마이페이지 목록입니다.
	<br/>
	아이디 : <input type="text" name="memId" value="<%=mvo.getMemId()%>" /><br/>
	비밀번호 : <input type="text" name="memPass" value="<%=mvo.getMemPass()%>"/><br/>
	이름 : <input type="text" name="memName" value="<%=mvo.getMemName()%>"/><br/>
	주민번호1 : <input type="text" name="memRegno1" value="<%=mvo.getMemRegno1()%>"/><br/>
	주민번호2 : <input type="text" name="memRegno2"value="<%=mvo.getMemRegno2()%>"/><br/>
	생일 : <input type="text" name="memBir" id="datepicker" value="<%=mvo.getMemBir()%>"/><br/>
	우편번호 : <input type="text" name="zipcode" value="<%=mvo.getMemZip()%>"/><br/>
	주소1 : <input type="text" name="addr1" value="<%=mvo.getMemAdd1()%>"/><br/>
	상세주소 : <input type="text" name="addr2" value="<%=mvo.getMemAdd2()%>"/><br/>
	연락처 : <input type="text" name="memHometel" value="<%=mvo.getMemHometel()%>"/><br/>
	이메일 : <input type="text" name="memMail" value="<%=mvo.getMemMail()%>"/><br/>
	<button id="updateBtn">수정</button>
</body>
</html>