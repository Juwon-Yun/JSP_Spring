package kr.or.ddit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/memberController.rara")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter("id");
		String opt = request.getParameter("opt");
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Gson gson = new Gson();
		PrintWriter out = response.getWriter();
		String jsonData = "";
		if(opt.equals("idCheck")) {
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "jspexam";
		String dbPass = "java";
		
		String sql = "SELECT COUNT(*) as cnt FROM RARAMEMBER WHERE MEMID='"+id+"'";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			jsonData = gson.toJson(rs.getString("cnt"));
			out.print(jsonData);
			System.out.println("jsonData : "+jsonData);
			response.flushBuffer();
		} //end 
		}catch(SQLException e){
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException e){}
			if(stmt != null)try{stmt.close();}catch(SQLException e){}
			if(conn != null)try{conn.close();}catch(SQLException e){}
		}
		}else if(opt.equals("insert")) {
			String name = request.getParameter("name");
			String memid = request.getParameter("memid");
			String ps1Val = request.getParameter("ps1Val");
			String email = request.getParameter("email");
			String emailChk = request.getParameter("emailChk");
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
				String dbUser = "jspexam";
				String dbPass = "java";
				
				String sql = "insert into RARAMEMBER"
						+ "(MEMNAME, MEMID, MEMPASS, MEMMAIL, EMAILYN)"
						+ "VALUES('"+name+"', '"+memid+"', '"+ps1Val+"', '"+email+"', '"+emailChk+"')";
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
				stmt = conn.createStatement();
				int cnt = stmt.executeUpdate(sql);
					jsonData = gson.toJson(cnt);
					out.print(jsonData);
					System.out.println("jsonData : "+jsonData);
					response.flushBuffer();
				}catch(SQLException e){
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}finally{
					if(rs != null)try{rs.close();}catch(SQLException e){}
					if(stmt != null)try{stmt.close();}catch(SQLException e){}
					if(conn != null)try{conn.close();}catch(SQLException e){}
				}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
