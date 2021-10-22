<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

    // request 기본 객체는 한 번의 요청(makeTime.jsp + viewTime.jsp)에 대해 유효하게 동작함
	Calendar cal = Calendar.getInstance();
	request.setAttribute("time", cal);
	/* String hour = String.valueOf( cal.get(Calendar.HOUR) );
	String minute = String.valueOf( cal.get(Calendar.MINUTE) );
	String second = String.valueOf( cal.get(Calendar.SECOND) );
	 */
%>
<%-- 
<jsp:forward page="/chap07/to/viewTime.jsp">
	<jsp:param value="<%=hour %>" name="hour"/>	
	<jsp:param value="<%=minute %>" name="minute"/>	
	<jsp:param value="<%=second %>" name="second"/>	
</jsp:forward>
--%>