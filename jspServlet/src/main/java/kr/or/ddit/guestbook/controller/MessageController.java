package kr.or.ddit.guestbook.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.guestbook.service.GetMessageListService;
import kr.or.ddit.guestbook.vo.GuestbookMessageVO;

@WebServlet("/MessageController.guestbook")
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int messageId = Integer.parseInt(request.getParameter("messageId"));
		String opt = request.getParameter("opt");
		
		if(opt.equals("update")) {
			GetMessageListService gmls = GetMessageListService.getInstance();
			GuestbookMessageVO vo = new GuestbookMessageVO();
			vo = gmls.getMessageOne(messageId);
			Gson gson = new Gson();
			PrintWriter out = response.getWriter();
			String jsonData = "";
			jsonData = gson.toJson(vo);
			out.print(jsonData);
			response.flushBuffer();
		}else if(opt.equals("update2")) {
			String name = request.getParameter("guestName");
			String message = request.getParameter("message");
			
			GetMessageListService gmls = GetMessageListService.getInstance();
			GuestbookMessageVO vo = new GuestbookMessageVO();
			
			vo.setGuestName(name);
			vo.setMessage(message);
			vo.setMessageId(messageId);
			vo.setPassword("");
			
			int cnt = gmls.updateMessage(vo);
			
			Gson gson = new Gson();
			PrintWriter out = response.getWriter();
			String jsonData = "";
			jsonData = gson.toJson(cnt);
			out.print(jsonData);
			response.flushBuffer();
		}else if(opt.equals("delete")) {
			GetMessageListService gmls = GetMessageListService.getInstance();
			System.out.println(messageId);
			int cnt = gmls.deleteMessage(messageId);
			Gson gson = new Gson();
			PrintWriter out = response.getWriter();
			String jsonData = "";
			jsonData = gson.toJson(cnt);
			out.print(jsonData);
			response.flushBuffer();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
