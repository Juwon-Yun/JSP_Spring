package kr.or.ddit.controller;

import java.util.List;

import javax.websocket.server.PathParam;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.MemberVO;

/*
	RequestMapping 어노테이션 정리
		- value 속성 : 필수
		- 속성이 하나일 때 속성명 생략 가능
		- 클래스 레벨로 요청 경로를 지정하면 메소드 레벨에서 지정한 경로의 기본 경로로 취급됨
	
 */
 
//클래스 레벨에 RequestMapping
@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// 메소드 레벨에 RequestMapping
	// @RequestMapping(value = "/register", method ="") => 속성이 2가지 일경우 생략 불가
	
	// 생략 가능
	@RequestMapping("/register")
	public void registerForm() {
		//http://localhost:8200/board/register  
		//INFO : kr.or.ddit.controller.BoardController - resisterForm 로 콘솔이 찍힌다
		logger.info("resisterForm");
	}
	
	// 하위 요청 경로 지정
	@RequestMapping("/modify")
	public void modifyForm() {
		//http://localhost:8200/board/modify
		//INFO : kr.or.ddit.controller.BoardController - modifyForm 로 찍힘 
		logger.info("modifyForm");
	}
	
	// 하위 요청 경로 지정
	@RequestMapping("/list")
	public void list() {
		//http://localhost:8200/board/list
		//INFO : kr.or.ddit.controller.BoardController - list 로 찍힘 
		logger.info("list");
	}
	
	/*
		경로 패턴 Mapping
			- 경로 변수에 해당하는 값을 파라미터 변수에 설정할 수 있음
			- 쿼리스트링 대신에 사용하지만 쿼리스트링과 다른 매핑이다34
	 */
	// http://localhost:8200/board/read/100 => /{boardNo}
	// @PathVariable("boardNo") int boardNo 경로 변수 설정 (여기선 int boardNO = 100)
	@RequestMapping("/read/{boardNo}")
	public String read(@PathVariable("boardNo") int boardNo) {
		logger.info("read boardNo => " + boardNo);
		
		//경로가 변하므로 뷰 이름 지정(board폴더에 read.jsp를 읽어드리고 logger에는 read boardNo => 100가 찍힌다)
		return "board/read";
	}
	/*
		Params 매핑
			- 요청 파라미터를 매핑 조건으로 지정하는 경우에는 params 속성을 사용
			- 버튼이나 링크에 따라 호출할 메소드를 바꿔야 할 때 사용
	 */
	// list.jsp의 <a href="/board/get?register">Register</a>를 어떻게 받을 것인지 => params = ""으로 받는다 
	@RequestMapping(value = "/get", method = RequestMethod.GET, params = "register")
	public String getForm() {
		logger.info("getForm");
		
		return "board/register";
	}
	
	@RequestMapping(value = "/post", method = RequestMethod.POST, params = "register")
	public String register() {
		logger.info("register");
		
		return "board/list";
	}

	@RequestMapping(value = "/post", method = RequestMethod.POST, params ="modify")
	public String modify() {
		logger.info("modify");
		
		return "board/list";
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET, params="modify")
	public String modifyGet() {
		logger.info("modifyGet");
		
		return "board/modify";
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET, params="remove")
	public String removeGet() {
		logger.info("removeGet");
		
		return "board/remove";
	}
	// params(파라미터 이름) 매핑
	@RequestMapping(value = "/get", method = RequestMethod.GET, params="list")
	public String listGet() {
		logger.info("listGet");
		 
		return "board/list";
	}
	
	@RequestMapping("/registerCheckbox02")
	public String registerCheckbox(){
		return "/sub/registerCheckbox02";
	}
	
	//폼 체크박스 요소값을 문자열 배열 타입 매개변수로 처리
	// ResponseBody를 찍지않고 배열을 리턴하면 에러발생
	// 리턴 객체를 JSON 형태로 반환함 
	@ResponseBody
	@RequestMapping(value = "/registerCheckbox", method = RequestMethod.POST)
	public MemberVO registerCheckboxForm(MemberVO vo) {
		
		if(vo.getHobbyList() != null) {
			
			logger.info("MemberVO =>  " + vo);
			logger.info("hobbyList.length =>  " + vo.getHobbyList().length);
			
			// null => 체크 된 것이 없을 때
			for(int i = 0; i < vo.getHobbyList().length; i++) {
				logger.info("hobbyList[i] =>  " + vo.getHobbyList()[i]);
			}
		}
		
		AddressVO addressVo = vo.getAddressVo();
		
		if(vo.getAddressVo() != null) {
			logger.info("addressVo.getPostCode() =>  " + addressVo.getPostCode());
			logger.info("addressVo.getLocation() =>  " + addressVo.getLocation());
		}
		
		// nested Beans (중첩된 자바빈즈)
		// {"memId":"a001","memName":"김은대","hoddyList":null,
		// "addressVo":{"postCode":"12318","location":"대전광역시 중구 대흥동 490-10번지"}}
		List<CardVO> list = vo.getCardList();
		if(vo.getCardList() != null) {
			for (CardVO cvo : list) {
				logger.info("List<CardVO> => " + cvo.getNo());
				logger.info("List<CardVO> => " + cvo.getValidMonth());
			}
		}
		
		logger.info("/board/registerCheckbox");
		
		return vo;
	}
	
	@RequestMapping(value = "/registerCheckbox05")
	public String registerCheckbox05() {
		
		logger.info("registerCheckbox05");
		
		//forwarding
		return "/sub/registerCheckbox05";
	}
	
	// 폼 체크박스 요소 값을 boolean 타입으로 작성하면, boolean 타입 매개변수로 처리
	@RequestMapping(value = "registerCheckbox05Post", method = RequestMethod.POST)
	public String registerCheckbox05Post(boolean foreigner) {

		// checkbox의 value에 true or false로 명시하게되면 boolean 타입으로 받을 수 있다.
		// 				value에 True or False로 해도 자동으로 true or false 로 받는다.
		logger.info("registerCheckbox05Post");
		logger.info("foreigner => " + foreigner);

		return "success";
	}
	
	@RequestMapping("/ajaxHome")
	public void ajaxHome() {
		
	}
	
	// ajax type put을 사용하면 데이터가 Requestbody에 들어간다
	// RequestBody => {"no":"1", "tit":"제목","cont":"내용","wri":"개똥이"} 어노테이션으로 vo에 자동으로 담긴다 
	// 경로변수 @PathVariable int boardNo (문자열로 넘어오는데 정수형으로 자동 형변환)
	@RequestMapping(value = "/{boardNo}", method = RequestMethod.PUT)
	public ResponseEntity<String> test1(@PathVariable int boardNo, @RequestBody BoardVO boardVo) {
		logger.info("boardVo =>  "+boardVo);
		
		return new ResponseEntity<>("SUCCESS",HttpStatus.OK);
	};
	
}
