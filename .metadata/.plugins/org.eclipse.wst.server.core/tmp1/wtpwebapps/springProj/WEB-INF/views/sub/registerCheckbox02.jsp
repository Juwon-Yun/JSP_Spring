<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>체크박스 요소</title>
</head>
<body>

<form action="/board/registerCheckbox" method="post">
	<p>회원 ID : <input type="text" name="memId" value="a001"> </p>
	<p>회원 이름: <input type="text" name="memName" value="김은대"> </p>
	<!-- 
		MemberVO안에 있는 addressVo의 필드
		
		중첩된 자바 Beans 라고 한다	
	 -->
	<p>우편번호 : <input type="text" name="addressVo.postCode"></p>
	<p>주소 : <input type="text" name="addressVo.location"></p>
	
	hobbyList : <br>
	<input type="checkbox" name="hobbyList" id="hobbyList1" value="Sports">
	<label for="hobbyList1">Sports</label><br>
	<input type="checkbox" name="hobbyList" id="hobbyList2" value="Music">
	<label for="hobbyList2">Music</label><br>
	<input type="checkbox" name="hobbyList" id="hobbyList3" value="Movie">
	<label for="hobbyList3">Movie</label><br><br>
	
	<p>
		<input type="button" id="btnAdd" value="+">&nbsp;
		<input type="button" id="btnDel" value="-">
	</p>
	
	<div id="divCard">
		<p>
			카드 1 - 번호 : <input type="text" name="cardList[0].no" value="123456"><br>
			카드 1 - 유효 연월 : <input type="text" name="cardList[0].validMonth" value="25/10"><br>
		</p>	
	</div>
	
	<input type="submit" value="registerCheckbox02">
		
</form>
<div style="display: none;"> 
	<span>카드 1 - 번호 : </span><input type="text" name="cardList[0].no" value=""><br>
    <span>카드 1 - 유효 연월 : </span><input type="text" name="cardList[0].validMonth" value=""><br>
    <br>
</div>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	let counter = 0;
	let textcounter = 1;
	$('#btnAdd').click((i)=>{
		counter = counter + 1;
		textcounter = textcounter + 1;
		var varClone = $('body > div').clone();
		varClone.css('display', 'block');
		varClone.children('input').eq(0).attr('name', "cardList["+counter+"].no");
		varClone.children('span').eq(0).text('카드 '+textcounter+ '- 번호 : ');
		varClone.children('input').eq(1).attr('name', "cardList["+counter+"].validMonth");
		varClone.children('span').eq(1).text('카드 '+textcounter+ '- 유효 연월 : ');
		$('#divCard').append(varClone); 
	});
	
	$('#btnDel').click(()=>{
		$('#divCard > div').last().remove();
		if(counter != 0 || textcounter != 0){
			if(counter == 0 || textcounter == 1){
				return;
			}
			counter = counter - 1;
			textcounter =  textcounter - 1;
		}
	});
	
});
</script>
</body>
</html>