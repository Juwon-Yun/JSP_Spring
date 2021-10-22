<%@page import="kr.or.ddit.guestbook.service.MessageListView"%>
<%@page import="kr.or.ddit.guestbook.vo.GuestbookMessageVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.guestbook.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");

//page 파라미터 값을 이용하여 읽어올 페이지 번호를 생성
String pageNumberStr = request.getParameter("page");
int pageNumber = 1;
if(pageNumberStr != null){
	pageNumber = Integer.parseInt(pageNumberStr);
}
	GetMessageListService messageListService =
		GetMessageListService.getInstance();
	
	MessageListView list = messageListService.getMessageList(pageNumber);
	
	out.print("list.getMessageList().size() : " + list.getMessageList().size());
%>
<!-- scope => 영역,
	 var => 키,
	 scope => 벨류 -->
<c:set var ="viewData" value="<%=list %>" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<title>방명록 메시지 목록</title>
</head>
<script src="/js/jquery-3.6.0.min.js"></script>
<body>

<form action="/guestbook/writeMessage.jsp" method="post">
	이름 : <input type="text" name="guestName" placeholder="이름을 입력해주세요"
			required /> <br />
	비밀번호 : <input type="password" name="password" required /> <br />
	메시지 : <textarea name="message" rows="3" cols="30" required></textarea><br/>
	<input type="submit" name="insertMessage" value="메시지 남기기" />	<br/>
	<input type="button" id="chkMessage" value="확인" style="display:none; ">
	<input type="reset" id="chkMessageReset" value="취소" style="display:none; ">
	<input type="text" id="setMessageId" style="display:none; ">
	<input type="text" id="deleteMsg" style="display:none; ">
</form>
<!-- 

[수정]
1. 클릭 시 상단의 폼에 정보가 입력되고 (비밀번호 제외)
   "메시지 남기기" 버튼이 hidden,
   "확인" 및 "취소 버튼이 block"
2. "확인" 클릭 시 해당 정보가 업데이트 되는데, 비밀번호가 일치해야 함
3. "취소" 클릭 시 현재 페이지의 목록으로 되돌아감
   "메시지 남기기" 버튼이 block, "확인" 및 "취소" 버튼이 hidden

[삭제]
1. 클릭 시 비밀번호를 입력하는 요소가 block. 입력한 비밀번호가 일치하면 delete 처리
2. delete 완료 후 현재 페이지의 목록으로 되돌아감

 -->
<table id="messageTable" border="1">
	<!-- var="message" 는 vo(GuestbookMessageVO) -->
	<c:forEach var="message" items="${viewData.messageList }"  varStatus="status">
		<tr>
			<td>
				메세지 번호 : <span>${message.messageId }</span><br/>
				손님 이름 : <span>${message.guestName }</span><br/>
				메세지 : <span>${message.message }</span><br/>
				<input type="button" onclick="updateGuestbook(${message.messageId})" value="수정">
				&nbsp;
				<input type="button" onclick="chkPW(${message.messageId})" value="삭제">
			</td>
		</tr>
	</c:forEach>
</table>
<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
<a href="list.jsp?page=${pageNum}">[${pageNum}]</a>&nbsp;
</c:forEach>
<!-- <a href="list.jsp?page=1">[1]</a>&nbsp; -->
<!-- <a href="list.jsp?page=2">[2]</a>&nbsp; -->
<!-- <a href="list.jsp?page=3">[3]</a>&nbsp; -->
<script type="text/javascript">
	let pw = "";
	
	function updateGuestbook(messageId){
		$('#setMessageId').val(messageId);
		
		$('input[name=insertMessage]').css('display','none');
		$('#chkMessage').css('display','block');
		$('#chkMessageReset').css('display','block');
		
		$.ajax({
			url : '/MessageController.guestbook',
			typa : 'POST',
			data : {
				'opt' : 'update',
				'messageId' : messageId
			},
			success : function(res){
				$('input[name=guestName]').val(res.guestName);
				$('textarea[name=message]').val(res.message);
				pw = res.password;
			},
			error : function(){},
			dataType : 'json'
		});
	};
	
	$('#chkMessage').click(()=>{
		var password = $('input[name=password]').val();
		var messageId = $('#setMessageId').val();
		var guestName = $('input[name=guestName]').val();
		var message = $('textarea[name=message]').val();
	
		if(pw === password){
			$.ajax({
				url: '/MessageController.guestbook',
				type: 'POST',
				data:{
					'opt' : 'update2',
					'messageId' : messageId,
					'guestName' : guestName,
					'message' : message
				},
				success : function(res){
					location.reload();
				},
				error : function(){},
				dataType : 'json'
			});
		}else{
			$('input[name=password]').val("");
			alert("비밀번호가 틀립니다 다시입력해주세요.");
		}
	});
	
	$('#chkMessageReset').click(()=>{
		$('input[name=insertMessage]').css('display','block');
		$('#chkMessage').css('display','none');
		$('#chkMessageReset').css('display','none');
	});
	
	function chkPW(messageId){
		var password = $('#deleteMsg').val();
		$.ajax({
			url : '/MessageController.guestbook',
			typa : 'POST',
			data : {
				'opt' : 'update',
				'messageId' : messageId
			},
			success : function(res){
				var inputString = prompt('해당 방명록의 비밀번호를 입력하세요.');
				if(res.password == inputString){
					deleteGuestbook(messageId);
				}
			},
			error : function(){},
			dataType : 'json'
		});
	};
	
	function deleteGuestbook(messageId){
		$.ajax({
			url : '/MessageController.guestbook',
			typa : 'POST',
			data : {
				'opt' : 'delete',
				'messageId' : messageId
			},
			success : function(res){
				alert("방명록이 정상적으로 삭제되었습니다.");
				location.reload();
			},
			error : function(){},
			dataType : 'json'
		});
	}
	

	
</script>
</body>
</html>