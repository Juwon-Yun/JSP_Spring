<%@page import="java.sql.*"%>
<%@page import="kr.or.ddit.util.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//cos.jar를 사용하여 파일 처리
	String fileName = "";
	String realFolder = "E:\\Java_workspace\\6.jspSpring\\jspServlet\\src\\main\\webapp\\images";
	//인코딩 타입
	String encType = "UTF-8";
	//최대 업로드될 파일의 크기 5Mb
	int maxSize = 5 * 1024 * 1024;
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String productId		= multi.getParameter("productId");
	String pname			= multi.getParameter("name");
	String unitprice		= multi.getParameter("unitPrice");
	String description 		= multi.getParameter("description");
	String category			= multi.getParameter("category");
	String manufacturer		= multi.getParameter("manufacturer");
	String unitsinstock		= multi.getParameter("unitsInStock");
	String condition		= multi.getParameter("condition");
	
	int price = Integer.parseInt(unitprice);
	int stock = Integer.parseInt(unitsinstock);
	
	//업로드가 완료된 첨부파일의 이름 정보 추출
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	//업로드된 파일의 실제 파일명을 가져옴
	fileName = multi.getFilesystemName(fname);
	
	//Database 테이블로 update
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:ddit");	
		String sql =  "Select * from product where P_ID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery(); 
		// id에 해당하는 상품이 있을때만 update 처리 
		if(rs.next()){
			// 1) 요청 파라미터 중에서 이미지 파일이 있으면 실행
			if(fileName != null){
				sql = "	update product " 
					+ " set " 
					+ " P_NAME = ?,"
					+ " P_UNITPRICE = ?,"
					+ " P_DESCRIPTION = ?,"
					+ " P_CATEGORY = ?,"
					+ " P_MANUFACTURER = ?,"
					+ " P_UNITSINSTOCK = ?,"
					+ " P_CONDITION = ?,"
					+ " P_FILENAME = ?"
					+ " where P_ID = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,pname);
				pstmt.setString(2,unitprice);
				pstmt.setString(3,description);
				pstmt.setString(4,category);
				pstmt.setString(5,manufacturer);
				pstmt.setString(6,unitsinstock);
				pstmt.setString(7,condition);
				pstmt.setString(8,fileName);
				pstmt.setString(9,productId);
				pstmt.executeUpdate();
				
			// 2) 요청 파라미터 중에서 이미지 파일이 없으면 실행
			}//end if
		}
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(conn);
	}
	response.sendRedirect("editProduct.jsp?edit=update");
%>