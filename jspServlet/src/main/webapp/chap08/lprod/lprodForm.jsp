<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>상품분류 입력</title>
</head>
<body>
	<form name="frm" action="/chap08/lprod/lprodJoining.jsp" method="post">
		<table style="border:1px; width: 50%" cellspacing="0">
			<tr>
				<th>상품분류 아이디</th>
				<td><input type="text" name="lprod_id" placeholder="상품분류 아이디 입력"></td>
			</tr>
			<tr>
				<th>상품분류 코드</th>
				<td><input type="text" name="lprod_gu" placeholder="상품분류 코드 입력하세요"></td>
			</tr>
			<tr>
				<th>상품분류 명</th>
				<td><input type="text" name="lprod_nm" placeholder="상품분류 명 입력하세요"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="입력">&nbsp;
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>


