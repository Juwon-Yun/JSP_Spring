<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	String memberId = request.getParameter("memberId");
	String name = request.getParameter("name");
	
	int updateCount = 0;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	Statement stmt = null;
	
	try{
		//수동 커밋
		// conn.setAutoCommit(false);
		// conn.commit();
		
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "jspexam";
		String dbPass = "java";
		
		String query = "update MEMBER set Name = '"+name+"' "+
					   "where MEMBERID = '"+memberId+"'";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		updateCount = stmt.executeUpdate(query);
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		if(stmt != null) try{stmt.close();}catch(SQLException e){}
		if(conn != null) try{conn.close();}catch(SQLException e){}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<% if(updateCount > 0){%>
	<%=memberId%>의 이름을 <%=name %>(으)로 변경
	<a href="/chap14/viewMemberList.jsp">목록으로</a>
<%}else{%>
	<%=memberId %>아이디가 존재하지 않음
<%} %>
</body>
</html>