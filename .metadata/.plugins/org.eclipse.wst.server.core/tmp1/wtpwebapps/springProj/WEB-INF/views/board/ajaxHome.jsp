<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<p><input type="text" id="boardNo" name="boardNo" value="1"> </p>
<p><input type="text" id="title"  name="title" value="제목"> </p>
<p> <textarea rows="10" cols="10" name="content" id="content"></textarea> </p>
<p> <input type="text" name="writer" id="writer" value="개똥이"> </p>
<input type="button" id="putBtn" value="전송">

<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#putBtn').click(()=>{
		var boardNo = $('#boardNo').val();
		var title = $('#title').val();
		var content = $('#content').val();
		var writer = $('#writer').val();
		
		// 배열
		var boardObject = {
			no : boardNo,
			tit : title,
			cont : content,
			wri : writer
		};
	
		// JSON.stringify => 배열을 JSON데이터로 바꿔줌
		// type => get, post, put(post와 유사, 데이터가 Requestbody에 들어간다)
		// data => 보낼 데이터
		// contentType => 보내는 데이터의 타입
		
		// dataType => 받는쪽 데이터의 타입
		$.ajax({
			url : '/board/'+boardNo,
			type:'put',
			data : JSON.stringify(boardObject),
			success : function(res){
				console.log(res);
			},
			contentType : 'application/json;charset=utf-8'
			
		});
		
	});
})
</script>
</body>
</html>