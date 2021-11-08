<%@page import="kr.or.ddit.guestbook.service.WriteMessageService"%>
<%@page import="kr.or.ddit.guestbook.vo.GuestbookMessageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>방명록에 메세지를 남김</title>
</head>
<body>
	<jsp:useBean id="message" class="kr.or.ddit.guestbook.vo.GuestbookMessageVO">
		<jsp:setProperty name ="message" property="*" />
	</jsp:useBean>
	
<%
// 	GuestbookMessageVO message2 = new GuestbookMessageVO();
// 	int messageId = request.getParameter("messageId")==null?0:
// 		Integer.parseInt(request.getParameter("messageId"));
	
// 	message2.setMessageId(messageId);
// 	message2.setGuestName(request.getParameter("guestName"));
// 	message2.setPassword(request.getParameter("password"));
// 	message2.setMessage(request.getParameter("message"));
	
// 	out.print("message :" + message2.toString());
	
	WriteMessageService writeService = WriteMessageService.getInstance();
	writeService.write(message);
%>
방명록에 메시지를 남겼습니다.<br />
<a href="list.jsp">[목록보기]</a>

</body>
</html>