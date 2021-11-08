<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<title><tiles:insertAttribute name="title"/></title>
<!-- <link rel="stylesheet" href="/resources/css/tiles.css"/> -->
</head>
<body>
<!-- 
	[Spring]  마이바티스(MyBatis) - Mapper Interface 활용
	
	Mapper Interface?
	 - before : Controller => service(serviceImpl) => Dao(Class) => Mapper.xml => DB
	 - after : Contreoller => service(serviceImple) => Mapper(Interface) => Mapper.xml => DB
	
	매핑 파일에있는 SQL Mapping을 사용
	 	
 -->

<tiles:insertAttribute name="header"/>
<!-- <div class="container"> -->
<%-- 	<tiles:insertAttribute name="aside"/> --%>
	<tiles:insertAttribute name="body"/>
<!-- </div> -->
<tiles:insertAttribute name="footer"/>
</body>
</html>