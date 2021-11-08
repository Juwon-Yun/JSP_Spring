package kr.or.ddit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewController.nabi")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher rd = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		String cmd = request.getParameter("cmd");
		if(cmd.equals("nav")) {
			rd = request.getRequestDispatcher("WEB-INF/view/nav.jsp");
			rd.forward(request, response);
		}
		if(cmd.equals("copyright")) {
			rd = request.getRequestDispatcher("WEB-INF/view/copyright.jsp");
			rd.forward(request, response);
		}
		if(cmd.equals("navbar")) {
			rd = request.getRequestDispatcher("WEB-INF/view/navbar.jsp");
			rd.forward(request, response);
		}
		if(cmd.equals("dogmain")) {
			rd = request.getRequestDispatcher("WEB-INF/view/dogmain.jsp");
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
