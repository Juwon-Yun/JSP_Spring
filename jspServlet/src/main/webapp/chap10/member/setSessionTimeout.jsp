<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션의 유효 시간을 설정(초단위)
	session.setMaxInactiveInterval(60*60);
%>

<script type="text/javascript">
	alert("세션의 유효 시간을 1시간으로 설정했습니다.");
	history.go(-1);
</script>