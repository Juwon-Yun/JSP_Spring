package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.vo.BookVo;



// 리턴값이 없어서 매핑된 value 중에 이름이 같은 jsp를 찾아서 실행함
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping( value="/home", method = RequestMethod.GET)
	public void home() {
		logger.info("home");
	}
	
	// 요청 경로(/goHome0101)와 동일한 뷰(/goHome010.jsp)를 가리킴
	@RequestMapping(value = "/goHome0101", method = RequestMethod.GET)
	public void home0101() {
		logger.info("home0101");
	}
	
	// 요청 경로(/goHome0101)와 동일한 뷰(/goHome010.jsp)를 가리킴
	@RequestMapping(value = "/goHome0102", method = RequestMethod.GET)
	public void home0102() {
		logger.info("home0102");
	}
	
	@RequestMapping("/goHome0201")
	public String home0201() {
		logger.info("home0201");
		
		return "goHome0201";
	}

	@RequestMapping(value = "/sub/goHome0202", method = RequestMethod.GET)
	public String home0202() {
		logger.info("home0202");
		
		return "goHome0202";
	}

	@RequestMapping("goHome0204")
	public String home0204() {
		logger.info("home0204");

		return "redirect:/sub/goHome0202";
	}
	
	@RequestMapping("/sub/goHome0205")
	public String home0205() {
		return "goHome0204";
	}
	
	//ResponseBody 어노테이션 : 반환값이 객체 타입이면 JSON 타입으로 자동 변환, ajax 에서 많이쓰인다
	@ResponseBody
	@RequestMapping(value = "/goHome0301", method = RequestMethod.GET)
	public BookVo home0301() {
		logger.info("home0301");
		
		BookVo bookVo = new BookVo();
		bookVo.setBook_id("20211029001");
		bookVo.setTitle("효주이모의 에세이");
		bookVo.setCategory("에세이");
		bookVo.setPrice("10000000000000000");
		bookVo.setInsert_date("2021-10-29");
		
		return bookVo;
	}
	
	// 컬렉션 List 타입 처리
	// 요청 URI : /goHome04
	@ResponseBody
	@RequestMapping(value = "/goHome04", method = RequestMethod.GET)
	public List<BookVo> home04(){
		logger.info("home04");
		
		List<BookVo> list = new ArrayList<>();
		list.add(new BookVo("20211029001", "효주이모의 에세이", "에세이", "10000000000000000", "2021-10-29") );
		list.add(new BookVo("20211029002", "봉형님 행님요", "소설", "30000000000000", "2021-10-29") );
		list.add(new BookVo("20211029003", "보리야 보리밥 먹으러 가자", "에세이", "100000000", "2021-10-29") );
		return list;
	}
	
	// Map 타입
	// 요청 URI : /goHome05
	// 반환값이 Map타입이면 JSON 객체 타입으로 자동 변환됨
	@ResponseBody
	@RequestMapping(value = "/goHome05", method = RequestMethod.GET)
	public Map<String, BookVo> home05(){
		logger.info("home05");
		
		Map<String, BookVo> map = new HashMap<>();
		map.put("key1", new BookVo("20211029001", "효주이모의 에세이", "에세이", "10000000000000000", "2021-10-29"));
		map.put("key2", new BookVo("20211029002", "봉형님 행님요", "소설", "30000000000000", "2021-10-29") );
		map.put("key3", new BookVo("20211029003", "보리야 보리밥 먹으러 가자", "에세이", "100000000", "2021-10-29"));
		
		return map;
	}
	
	@RequestMapping("/tiles/body1")
	public String titles1() {
		// 	*/*, {1}/{2} => 리턴에만 해당함
		return "test1/body1";
	}
	
	@RequestMapping("/tiles/body2")
	public String titles2() {
		return "test2/body2";
	}
	
	
}	












