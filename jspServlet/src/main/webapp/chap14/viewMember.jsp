<%@page import="oracle.net.aso.i"%>
<%@page import="kr.or.ddit.chap14.IMemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 상세 정보</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String memberId = request.getParameter("memberId");
	
	int updateCount = 0;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String password = "";
	String name = "";
	String email ="";
	IMemberVO imemberVo = new IMemberVO();
	try{
		//수동 커밋
		// conn.setAutoCommit(false);
		// conn.commit();
		
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "jspexam";
		String dbPass = "java";
		
		String query = "select * from member where memberid = '"+memberId+"'";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		
		rs = stmt.executeQuery(query);
		
		if(rs.next()){
			imemberVo.setMemberid(memberId);
			imemberVo.setPassword(rs.getString("PASSWORD"));
			imemberVo.setName(rs.getString("NAME"));
			imemberVo.setEmail(rs.getString("EMAIL"));
			
%>
<c:set var="vo" value="<%=imemberVo %>" />
		<table border="1">
		<tr>
			<th>아이디</th><td><span id="spanId">${vo.memberid}</span></td>
		</tr>
		<tr>
			<th>비밀번호</th><td>${vo.password}</td>
		</tr>
		<tr>
			<th>이름</th><td><span id="spanName">${vo.name}</span></td>
		</tr>
		<tr>
			<th>이메일</th><td>${vo.email}</td>
		</tr>
		</table>
		<input type="button" value="목록" id="goList">
		<input type="button" value="수정" id="updateBtn"> 
<%
		}else{
			out.print(memberId +"에 해당되는 회원정보가 없습니다");
		}
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException e){}
		if(stmt != null) try{stmt.close();}catch(SQLException e){}
		if(conn != null) try{conn.close();}catch(SQLException e){}
	}
	
%>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	var link = "/chap14/viewMemberList.jsp";

	$('#goList').on('click', function(){
		location.href=link;
	});
	
	$('#updateBtn').on('click', function(){
		var memberId = $('#spanId').text();
		var name = $("#spanName").text();
		location.href="/chap14/update/updateForm.jsp?memberId="+memberId+"&name="+name;
	});
	
});
</script>
</body>
</html>