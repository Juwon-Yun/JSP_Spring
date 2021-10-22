package kr.or.ddit;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.vo.MemberVo;

@WebServlet("/first/member.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberVo mvo;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String chs = request.getParameter("chs");
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		if(chs.equals("login")) {
			mvo.setName(name);
			mvo.setPassword(password);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
