package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.serivce.BookService;










/*
	Controller 어노테이션
	스프링 프레임워크에게 이 클래스는 웹 브라우저의 요청(request)을 받아들이는 
	컨트롤러야 라고 알려주는것
	스프링 프레임워크(디자인패턴+라이브러리) 이 클래스가 컨트롤러구나 라고
	인지를 해서 자바빈을(java bean)으로 등록하여 관리
	ex) /notice/list
	
	DAO는 @Repository
	Service는 @Service 
 */
@Controller
public class BookController {
	//서비스를 호출하기 위해 의존성 주입(Di)
	//인터페이스가 사용됨
	
	//@Inject
	@Autowired
	BookService bookService;
	
	// lombok 변수 선언
 	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	//책을 등록할 때 요청 (/create로 요청이 왔을떄 GET방식으로 create 메소드 실행)
	// value 속성 : 웹브라우저에서 요청한 주소(URI)
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public ModelAndView create() {
		/*
			이 메소드에서 작동방식
			웹 브라우저에서 /create 주소를 GET방식으로 요청하면
			book/create 경로로 뷰를 응답
			
		 	ModelAndView
		 	1) Model : Controller가 반환할 데이터를 담당
		 	2) View : 화면을 담당(뷰의 경로)
		 	
		25~27번줄과 30번줄의 결과값은 같다.
		
		/WEB-INF/spring/appServlet/servlet-context.xml에서
		mav.setViewName(prifix + "book/create" + suffix); 를 자동으로 해준다
		
			
		 */
		ModelAndView mav = new ModelAndView();
		
//		this.bookService.insert(map);
		
		mav.setViewName("book/create");
		return mav;
		
		
		//webapp->WEB-INF->views->book->create.jsp 실행 
		//return new ModelAndView("book/create");
	}
	
	//파라미터 목록 : title=제목*category=카테고리&price=10000
	// map : {{"title","제목"},{"category","카테고리"},{"price","10000"}}
	@RequestMapping(value="/create", method = RequestMethod.POST)
	public ModelAndView createPost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		
		String bookId = this.bookService.insert(map);
		
		System.out.println("bookId : " + bookId);
		//insert가 안됨
		//책 입력 화면으로 되돌아감
		if(bookId == null) {
			//get방식으로 redirect요청함
			mav.setViewName("redirect:/create");
		//insert 성공 -> 상세 페이지를 요청
		}else {
			mav.setViewName("redirect:/detail?bookId="+bookId);
		}
		
		return mav;
	}
	// 파라미터 목록 : bookId = 1
	// {"bookId", "1"}
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView select(@RequestParam Map<String, Object> map) {
		Map<String, Object> detailMap = this.bookService.select(map);

		ModelAndView mav = new ModelAndView();
		
//		for( String key : detailMap.keySet() ){
//			System.out.println( String.format("키 : %s, 값 : %s", key, detailMap.get(key)) );
//		}
		//request.setAttribute()와 비슷함
		mav.addObject("data", detailMap);
		String bookId = map.get("bookId").toString();
		
		//request.setAttribute("bookId", bookId);
		mav.addObject("bookId", bookId);
		mav.setViewName("/book/detail");
		
		return mav;
	}
	
	// 책 수정 화면 메소드 /update?bookId=1
	// @RequestParam String bookId와 HttpServletRequest request는 같은 기능을 한다
	// 책 수정 화면 = 책 입력 화면(jsp) + 책 상세 화면(서비스)
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView update(@RequestParam Map<String, Object> map) {
//		String bookIdstr = request.getParameter("bookId");
		
		//책 상세화면(서비스) 데이터 가져오기
		Map<String, Object> detailmap = this.bookService.select(map);
		
		ModelAndView mav = new ModelAndView();
//		mav.addObject("bookId", bookIdstr);
		mav.addObject("data", detailmap);
		mav.setViewName("/book/update");
		
		return mav;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updatePost(@RequestParam Map<String, Object> map, ModelAndView mav) {
		/*
		 	책 수정 화면에서 책 수정 기능으로 보내주는 파라미터는 총 4개
		 	1) update?bookId=1
		 	2) form 태그를 통해 전달되는 title, category, price
		 */
		System.out.println("map : " + map);
		// true : update성공, false : update실패
		boolean isUpdateSuccess = this.bookService.update(map);
		
		if(isUpdateSuccess) {
			String bookId = map.get("bookId").toString();
			mav.setViewName("redirect:/detail?bookId="+bookId);
		}else {
			//BookController의 update로 이동
			// 방법1)
			mav = this.update(map);
//			// 방법2)
//			String bookId = map.get("bookId").toString();
//			mav.setViewName("redirect:/update?bookId="+bookId);
		}
		
		return mav;
	}
	
	//map : {bookId = 1}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deletePost(@RequestParam Map<String, Object> map, ModelAndView mav) {
		//true : 삭제 성공, false : 삭제 실패
		boolean isDeleteSuccess = this.bookService.delete(map);
		
//		for( String key : map.keySet() ){
//			System.out.println( String.format("키 : %s, 값 : %s", key, map.get(key)) );
//		}

		if(isDeleteSuccess) {
			//성공 목록 화면으로 redirect
			mav.setViewName("redirect:/list");
		}else {
			//실패 상세 화면으로 redirect
			String bookId = map.get("bookId").toString();
			mav.setViewName("redirect:/detail?bookId="+bookId);
		}
		return mav;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam Map<String, Object> map, ModelAndView mav) {
		List<Map<String, Object>> list = this.bookService.list(map);
		
		if(list.size() > 0) {
			logger.info("list : " + list.get(0).toString());
		}
		
		// 데이터를 VIEW에 전달할 수 있도록 mav 객체에 넣음
		mav.addObject("data",list);
		//forwarding
		mav.setViewName("/book/list");
		
		return mav;
	}
}
