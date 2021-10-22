<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");

String memberId = request.getParameter("memberId");
String password = request.getParameter("password");
String name = request.getParameter("name");
String email = request.getParameter("email");

out.print("memberId => " + memberId +"<br>");
out.print("password => " + password +"<br>");
out.print("name => " + name +"<br>");
out.print("email => " + email +"<br>");
	Connection conn = null;
	PreparedStatement pstmt = null;
	int result = 0;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
	String dbUser = "jspexam";
	String dbPass = "java";
	
	String sql = "insert into member(memberid, password, name, email)" 
			+" values(?, ?, ?, ?)";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, memberId);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, email);
	
	result = pstmt.executeUpdate();
	
	}catch(SQLException e){
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}finally{
		if(pstmt != null)try{pstmt.close();}catch(SQLException e){}
		if(conn != null)try{conn.close();}catch(SQLException e){}
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	if(result > 0){
		out.print("MEMBER 테이블에 레코드 입력 성공");
	}else{
		out.print("데이터 입력 실패");
	}
%>
</body>
</html>