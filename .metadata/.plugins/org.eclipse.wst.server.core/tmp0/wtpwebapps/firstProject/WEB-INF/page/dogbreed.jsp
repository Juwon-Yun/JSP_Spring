<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
// 	response.setIntHeader("Refresh", 5);
%>
<!DOCTYPE html>
<html>
<head>
<title>나비병원</title>
</head>
<body>
	<div class="container">
		<c:import url="/ViewController.nabi?cmd=nav" />
		<c:import url="/ViewController.nabi?cmd=navbar" />
		<c:import url="/ViewController.nabi?cmd=copyright" />
	</div>
	<script src="./js/treeview-navigation.js"></script>
</body>
</html>