package kr.or.ddit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PageController.nabi")
public class PageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher rd = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");

		String cmd = request.getParameter("cmd");
		if(cmd.equals("home")) {
			rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}else if(cmd.equals("dogbreed")) {
			rd = request.getRequestDispatcher("WEB-INF/page/dogbreed.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
