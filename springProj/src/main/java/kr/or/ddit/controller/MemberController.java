package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

		
		// register?userId=hongkd&password=1234
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public String registerByParameter(String userId, String password) {
			
			logger.info("userId => " + userId + "   password => " + password);
			
			return "success";
		}
		
		@RequestMapping(value = "/member/list", method = RequestMethod.GET)
		public String memberList() {
			
			logger.info("member/list");
			
			return "/member/list";
		}
		/*
			HTML 폼 필드명과 컨트롤러 매개변수명이 일치하면 요청 데이터를 받는다.
			HTML 폼 필드가 여러 개일 때 컨트롤러 매개변수의 위치와 상관없다.
			HTML 폼 필드값이 숫자일 경우 컨트롤러 매개변수의 타입을 int 타입으로 받아도 자동 형변환이 된다.
			(String으로 넘어오는게 default)
		 */
		// 요청 URI : /register01
		// 파라미터 key값과 @RequestParam의 변수값이 같아야한다.
		@RequestMapping(value = "/register01", method = RequestMethod.POST)
		public String register01(@RequestParam String userId, int coin, String password, Model model) {
			
			logger.info("userId : " + userId );
			logger.info("password : " + password );
			logger.info("coin : " + coin );
			
			// model 객체의 name은 userId이고, value는 세균맨
			// request.setAttribute("userId", userId);
			
			Map<String, Object> map = new HashMap<>();
			map.put("userId", userId);
			map.put("password", password);
			map.put("coin", coin);
			
			model.addAttribute("userId", userId);
			model.addAttribute("password", password);
			model.addAttribute("coin", coin);
			model.addAttribute("map", map);
			
			//forwarding
			return "member/register01";
		}
}
