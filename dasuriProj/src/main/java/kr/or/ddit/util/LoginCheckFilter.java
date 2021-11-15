package kr.or.ddit.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

// 서블릿 클래스
public class LoginCheckFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession(false);
		
		httpRequest.setCharacterEncoding("UTF-8");

		boolean login = false;
		
		
		if(session != null) {
			if(session.getAttribute("EMPVO") != null) {
				login = true;
			}
		}
		
		if(login) {
			chain.doFilter(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("/emp/loginForm");
			rd.forward(request, response);
		}
		
	}

	@Override
	public void destroy() {}
	
}
