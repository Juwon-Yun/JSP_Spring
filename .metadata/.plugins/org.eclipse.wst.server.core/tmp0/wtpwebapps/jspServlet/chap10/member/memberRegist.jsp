<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>


<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/jquery-ui.js"></script>

<link rel="stylesheet" href="/css/jquery-ui.css">

<script type="text/javascript">
function openHomeSearch(){
   new daum.Postcode({
      oncomplete:function(data){
		$('[name=zipcode]').val(data.zonecode);
		$('[name=addr1]').val(data.address);
		$('[name=addr2]').val(data.buildingName);
      }
   }).open();
}


$(function(){
    $("#datepicker").datepicker();
  });
  
</script>
</head>
<body>


	<form action="./memberRegistOK.jsp" method="post">
	아이디 : <input type="text" name="memId" value="a001"/><br/>
	비밀번호 : <input type="text" name="memPass" value="asdfasdf"/><br/>
	이름 : <input type="text" name="memName" value="김은대"/><br/>
	주민번호1 : <input type="text" name="memRegno1" value="111111"/><br/>
	주민번호2 : <input type="text" name="memRegno2"value="1111118"/><br/>
	생일 : <input type="text" name="memBir" id="datepicker" value=""/><br/>
	우편번호 : <input type="text" name="zipcode" value=""/><br/>
	<button type="button" onclick="openHomeSearch()">검색</button>
	<br/>
	주소1 : <input type="text" name="addr1" value=""/><br/>
	상세주소 : <input type="text" name="addr2" value=""/><br/>
	연락처 : <input type="text" name="memHometel" value=""/><br/>
	이메일 : <input type="text" name="memMail" value=""/><br/>
	<input type="submit" value="확인">
	<input type="reset" value="취소">
	</form>
</body>
</html>

