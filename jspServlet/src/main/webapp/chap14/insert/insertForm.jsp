<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
<script type="text/javascript">
function fn_chk(){
	var frm = document.getElementById('frm');
	var id = frm.memberId.value;
	var password = frm.password.value;
	var name = frm.name.value;
	var email = frm.email.value;
	
	console.log(id, password, name, email);
	
	// false가 리턴되면 submit이 안됨
	if( id=="" ){
		alert("아이디를 입력해주세요");
		return false;
	}
	if( password=="" ){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	if( name=="" ){
		alert("이름을 입력해주세요");
		return false;
	}
	if( email=="" ){
		alert("이메일을 입력해주세요");
		return false;
	}
	
	return true;
}
</script>
</head>
<body>
<form action="/chap14/insert/insert.jsp" id="frm" method="post" onsubmit="return fn_chk()">
<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="memberId" size="10" /></td>
			<td>비밀번호</td>
			<td><input type="text" name="password" size="10" /></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" size="10" /></td>
			<td>이메일</td>
			<td><input type="text" name="email" size="10" /></td>
		</tr>
		<tr>
			<td colspan="4"><input type="submit" value="입력"></td>
		</tr>
	</table>
</form>
</body>
</html>