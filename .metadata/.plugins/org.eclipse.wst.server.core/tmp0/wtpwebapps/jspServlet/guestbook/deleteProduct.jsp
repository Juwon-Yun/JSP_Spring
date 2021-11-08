<%@page import="java.sql.*"%>
<%@page import="kr.or.ddit.util.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String productId = request.getParameter("id");
	Connection conn = null;
	PreparedStatement pstmt = null;
try{
	conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:ddit");	
	String sql =  "delete from product where P_ID = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	// id에 해당하는 상품이 있을때만 update 처리 
	pstmt.executeQuery();
}catch(SQLException e){
	e.printStackTrace();
}finally{
	JdbcUtil.close(pstmt);
	JdbcUtil.close(conn);
}
response.sendRedirect("editProduct.jsp?edit=delete");
%>

