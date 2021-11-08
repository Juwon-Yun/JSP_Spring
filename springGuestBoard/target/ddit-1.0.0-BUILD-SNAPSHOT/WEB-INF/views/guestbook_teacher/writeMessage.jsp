<%@page import="kr.or.ddit.guestbook.service.WriteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.or.ddit.guestbook.vo.GuestbookMessageVO"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>방명록에 메시지를 남김</title>
</head>
<body>
<!-- /guestbook/writeMessage.jsp -->
<jsp:useBean id="message" class="kr.or.ddit.guestbook.vo.GuestbookMessageVO">
	<jsp:setProperty name="message" property="*" />
</jsp:useBean>
<%
// GuestbookMessageVO message = new GuestbookMessageVO();
// int messageId = request.getParameter("messageId")==null?0:
// 	Integer.parseInt(request.getParameter("messageId"));

// message.setMessageId(messageId);
// message.setGuestName(request.getParameter("guestName"));
// message.setPassword(request.getParameter("password"));
// message.setMessage(request.getParameter("message"));

// out.print("message : " + message.toString());

WriteMessageService writeService = WriteMessageService.getInstance();
writeService.write(message);
%>
방명록에 메시지를 남겼습니다.<br />
<a href="list.jsp">[목록보기]</a>
</body>
</html>








