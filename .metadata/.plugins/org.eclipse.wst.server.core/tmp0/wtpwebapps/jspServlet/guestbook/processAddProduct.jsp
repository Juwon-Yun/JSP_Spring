<%@page import="kr.or.ddit.util.JdbcUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	String filename = "";
	// 웹 어플리케이션상의 절대 경로
	String realFolder = "E:\\Java_workspace\\6.jspSpring\\jspServlet\\src\\main\\webapp\\images";
	
	String encType = "UTF-8";
	
	//최대 업로드될 파일의 크기 5Mb
	int maxSize = 5 * 1024 * 1024;
	
	//업로드 처리(cos.jar) 패키지 사용
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	Long stock;
	
	if(unitPrice.isEmpty()){
		price = 0;
	}else{
		price = Integer.valueOf(unitPrice);
	}
	
	if(unitsInStock.isEmpty()){
		stock = 0L;		
	}else{
		stock = Long.valueOf(unitsInStock);
	}
	// 파라미터 목록에서 파일 객체 인 경우....
	Enumeration files = multi.getFileNames();
	// 파일 객체의 이름을 가져옴
	String fname = (String)files.nextElement();
	// 파일 객체의 이름에 해당되는 실제 파일명을 가져옴
	String fileName = multi.getFilesystemName(fname);
	
	//DB Insert 처리
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:ddit");
		String sql = "insert into PRODUCT values(?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.setString(2, name);
		pstmt.setInt(3, price);
		pstmt.setString(4, description);
		pstmt.setString(5, category);
		pstmt.setString(6, manufacturer);
		pstmt.setLong(7, stock);
		pstmt.setString(8, condition);
		pstmt.setString(9, fileName);
		
		pstmt.executeUpdate();
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		JdbcUtil.close(pstmt);
		JdbcUtil.close(conn);
	}
	//상품 목록으로 이동
	// sendRedirect 
	response.sendRedirect("products.jsp");
%>
<!-- <script type="text/javascript"> -->
<!--  	location.href="products.jsp?rslt=ok"; -->
<!-- </script> -->