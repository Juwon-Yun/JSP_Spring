<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<title><tiles:insertAttribute name="title"/></title>
</head>
<body>
<tiles:insertAttribute name="header" ignore="true"/>
<tiles:insertAttribute name="aside" ignore="true"/>
<tiles:insertAttribute name="body" ignore="true"/>
<tiles:insertAttribute name="footer" ignore="true"/>
</body>
</html>