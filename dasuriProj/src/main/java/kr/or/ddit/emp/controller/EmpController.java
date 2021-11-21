package kr.or.ddit.emp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.emp.service.impl.EmpServiceImpl;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.emp.vo.Member;

@Controller
@RequestMapping("/emp")
public class EmpController {
	
	
	@Autowired
	EmpServiceImpl empServiceImpl;
	
	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);
	
	@RequestMapping("/list")
	public String list(Model model) throws Exception {
		List<EmpVO> list = this.empServiceImpl.list();
		model.addAttribute("list", list);
		return "emp/list";
	}
	
	@RequestMapping("/update")
	public String update() {
		return "emp/update";
	}
	
	@RequestMapping("/delete")
	public String delete() {
		return "emp/delete";
	}
	
	/*
	 	스프링 폼 태그 라이브러리
	 	 - 스프링 폼은 HTML 폼을 표시하기 위한 태그 라이브러리
	 	 - 스프링 폼을 이용하면 HTML 폼과 자바 객체를 쉽게 바인딩할 수 있음
	 */
	
	// 테스트 폼
	@RequestMapping("/registerForm02")
	public String registerForm02(Model model, HttpServletRequest request) {
		logger.info("registerForm02");
		
		// 로그인 후 세션정보 다루기
		HttpSession session = request.getSession();
		// 직원 id를 받아올 수 있음
		String userId = (String)session.getAttribute("userId");
		
		if(userId == null) {
			userId = "a001";
		}
		
		
		// 속성명에 member는 폼 객체의 모델로 사용됨
		// modelAttribute="member" 값과 attribute 키값이 동일해야한다.
		Member member = new Member();
		// 폼 객체의 프로퍼티 값을 지정
		member.setUserId("a001");
		member.setUserName("김은대");
		member.setEmail("test@test.com");
		member.setPassword("java");
		member.setIntroduction("하이\n빅스비");
		
		//checkboxes 데이터 바인딩
		Map<String, String> hobbyMap = new HashMap<>();
		
		hobbyMap.put("1", "Sports");
		hobbyMap.put("2", "Music");
		hobbyMap.put("3", "Chess");
		hobbyMap.put("4", "Cooking");
		
		member.setDeveloper(false);
		member.setForeinger(false);
		
		List<String> hobbySelected = new ArrayList<>();
		hobbySelected.add("1");
		hobbySelected.add("4");
		
		member.setHobbyList(hobbySelected);
		
		//성별 라디오 버튼
		Map<String, String> genderCodeMap = new HashMap<>();
		genderCodeMap.put("1", "Male");
		genderCodeMap.put("2", "Female");
		genderCodeMap.put("3", "Other");
		
		//성별 라디오 버튼
		Map<String, String> nationalityMap = new HashMap<>();
		nationalityMap.put("1", "Korea");
		nationalityMap.put("2", "Germany");
		nationalityMap.put("3", "USA");
		nationalityMap.put("4", "Japen");
		
		//소유차량 멀티셀렉박스
		Map<String, String> carCodeMap = new HashMap<>();
		carCodeMap.put("1", "르노삼성");
		carCodeMap.put("2", "현대");
		carCodeMap.put("3", "기아");
		carCodeMap.put("4", "제네시스");
		carCodeMap.put("5", "테슬라");
		carCodeMap.put("6", "아우디");
		carCodeMap.put("7", "벤츠");
		carCodeMap.put("8", "BMW");
		
		// 속성명에 member는 폼 객체의 모델로 사용됨
		model.addAttribute("member", member);
		model.addAttribute("hobbyMap", hobbyMap);
		model.addAttribute("genderCodeMap", genderCodeMap);
		model.addAttribute("nationalityMap", nationalityMap);
		model.addAttribute("carCodeMap", carCodeMap);
		return "emp/registerFrom";
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam("empNo")String empNo, Model model) {
		logger.info("detail");

		EmpVO empVo = null;

		try {empVo = this.empServiceImpl.detail(empNo);} catch (Exception e) {e.printStackTrace();}

		logger.info("empVo" + empVo);
		
		model.addAttribute("empVo", empVo);
		// forwarding
		return "emp/detail";
	}
	
	@RequestMapping(value = "/detailPost", method = RequestMethod.POST)
	public String detailPost(@ModelAttribute("empVo") @Validated EmpVO empVo,
			BindingResult result, Model model) throws Exception {
		logger.info("result : " + result.hasErrors());
		
		int updateCnt = 0;

		// validate 후 문제가 발생하면 실행
		if(result.hasErrors()) {
			List<ObjectError> allErrors = result.getAllErrors();
			List<ObjectError> globalErrors = result.getGlobalErrors();
			List<FieldError> fieldErrors = result.getFieldErrors();
			
			logger.info("allErrors.size() => " + allErrors.size());
			logger.info("globalErrors.size() => " + globalErrors.size());
			logger.info("fieldErrors.size() => " + fieldErrors.size());
			
			for(ObjectError oE: allErrors) {
				logger.info("allErrors => " + oE);
			}
			for(ObjectError oE: globalErrors) {
				logger.info("globalErrors => " + oE);
			}
			for(FieldError fE: fieldErrors) {
				logger.info("fieldErrors => " + fE.getDefaultMessage());
			}

			model.addAttribute("emp", empVo);
			
			return  "emp/detail";
		}
		
			// 직원 등록 및 직원 존재 시 정보 업데이트 처리
			updateCnt = this.empServiceImpl.insert(empVo);
			
		logger.info("cnt => "+updateCnt);
		
		return "redirect:/emp/list";
	}
	
	// @RequestParam => String, map 
	// @ModelAttribute => vo
	
	// 직원 퇴직 처리
	@RequestMapping(value = "/emp/deletePost", method=RequestMethod.POST)
	public String deletePost(@RequestParam("empNo")String empNo) throws Exception {
		logger.info("deletePost");
		
		int updateCnt = this.empServiceImpl.update(empNo);
		
		logger.info("updateCnt => " + updateCnt);
		
		return "redirect:/emp/detail?empNo="+empNo;
	}
	
	/*
	 	스프링 폼 태그 라이브러리
	 	 - 스프링 폼은 HTML 퐁을 표시하기 위한 태그 라이브러리
	 	 - 스프링 폼을 이용하면 HTML 폼과 자바 객체를 쉽게 바인딩할 수 있음
	 	 
	 	 1) form:form (폼)
	 	 2) form:
	 	 3) form:
	 	 4) form:
	 	 5) form:
	 	 6) form:
	 	 7) form:
	 	 8) form:
	 	 9) form:
	 	 10) form:
	 	 11) form:
	 	 12) form:
	 	 13) form:
	 	 
	 */
	@RequestMapping( value = "register", method = RequestMethod.POST)
	public String register(Member member, Model model) {
		logger.info("member => " + member);
		member.setUserName("개똥이");
		
		List<String> hobbyList = member.getHobbyList();
		if(hobbyList.size() > 0) {
			for (String h : hobbyList) {
				logger.info("hobbyList => " + h);
			}
		}
		
		List<String> carList = member.getCarList();
		if(carList != null) {
			logger.info("carList.size() =>  " + carList.size());
			for (String s : carList) {
				logger.info("s => " + s);
			}
		}else {
			logger.info("carList == null");
		}
		
		model.addAttribute("member", member);
		
		
		return "emp/result";
	}
	
	@RequestMapping("/register")
	public String insert(Model model) {
		logger.info("register");
		
		
		String empNo = "";
		//직원번호 자동생성
		try {
			empNo = this.empServiceImpl.createEmpNo();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		model.addAttribute("empNo", empNo);
		model.addAttribute("emp", new EmpVO());
		return "emp/register";
	}
	
	// 요청 파라미터 목록 VO에 할당 시 ModelAttribute 어노테이션이 필요함
	// 검증된 결과가 result안에 있다
	@RequestMapping(value = "/registerPost", method = RequestMethod.POST)
	public String registerPost(@ModelAttribute("emp") @Validated EmpVO emp, BindingResult result) {
		logger.info("result : " + result.hasErrors());
		
		int cnt = 0;

		// validate 후 문제가 발생하면 실행
		if(result.hasErrors()) {
			List<ObjectError> allErrors = result.getAllErrors();
			List<ObjectError> globalErrors = result.getGlobalErrors();
			List<FieldError> fieldErrors = result.getFieldErrors();
			
			logger.info("allErrors.size() => " + allErrors.size());
			logger.info("globalErrors.size() => " + globalErrors.size());
			logger.info("fieldErrors.size() => " + fieldErrors.size());
			
			for(ObjectError oE: allErrors) {
				logger.info("allErrors => " + oE);
			}
			for(ObjectError oE: globalErrors) {
				logger.info("globalErrors => " + oE);
			}
			for(FieldError fE: fieldErrors) {
				logger.info("fieldErrors => " + fE.getDefaultMessage());
			}
			
			return  "emp/register";
		}
		
		try {
			cnt = this.empServiceImpl.insert(emp);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		logger.info("cnt => "+cnt);
		
		return "redirect:/emp/list";
	}
	
	//article에서 login filter test용 mapping
	@RequestMapping("/loginForm")
	public String loginForm(@ModelAttribute("emp") EmpVO emp, Model model) {
		
		model.addAttribute("emp", new EmpVO());
		
		logger.info("loginForm");
		
		return "emp/loginForm";
	}
	
	//로그인 처리
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(
			@ModelAttribute("emp") @Validated EmpVO empVO,
			@RequestParam(value="customCheck", required=false) 
				String customCheck,
			BindingResult result,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model) throws Exception {
		//아이디 기억하기 체크박스(customCheck : on)
		logger.info("customCheck : " + customCheck);
		
		logger.info("emp : " + empVO.toString());
		
		logger.info("result.hasErrors() : " + result.hasErrors());
		
		if(result.hasErrors()) {	//validated 결과 문제가 발생
			return "emp/loginForm";
		}
		
		//문제가 없으면 로그인 처리..
		HttpSession session = request.getSession();
		
		//아이디에 해당되는 직원이 있는가?
		String empNo = empVO.getEmpNo();	//1
		String password = empVO.getPassword();	//java
		//db정보
		System.out.println("DB 조회전의 empNo" + empNo);
		EmpVO dbEmpVO = this.empServiceImpl.detail(empNo);
		System.out.println("DB 조회후의 VO" + dbEmpVO);
		if(dbEmpVO!=null) {	//아이디에 해당되는 직원이 있다면
			//그리고 입력한 비밀번호와 해당 아이디의 db쪽 비밀번호가 일치하면 로그인
			System.out.println("password" + password);
			if(password.equals(dbEmpVO.getPassword())) {
				//LoginCheckFilter.java에서 session.getAttribute("EMPVO")
				session.setAttribute("EMPVO", dbEmpVO);
				logger.info("로그인 성공");
				if(customCheck!=null) {
					//아이디기억하기를 체크했을 경우..
					if(customCheck.equals("on")) {
						logger.info("customCheck on 실행");
						//쿠키 생성(직원 번호)
						Cookie cookie = new Cookie("empNo", empVO.getEmpNo());
						//초단위 설정(60초 -> 1분 -> 하루 -> 한달)
						cookie.setMaxAge(60 * 60 * 24 * 30);
						response.addCookie(cookie);
					}else {//아이디기억하기를 체크하지 않았을 경우
						//쿠키 삭제
						Cookie cookie = new Cookie("empNo", "");
						//초단위 설정(0)
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
				}else {
					//쿠키 삭제
					Cookie cookie = new Cookie("empNo", "");
					//초단위 설정(0)
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				//end if
				return "emp/index";
			}else {	//로그인 실패
				empVO = new EmpVO();
				model.addAttribute("loginFail", "비밀번호가 잘못되었습니다.");
				return "emp/loginForm";
			}
		}else {	//아이디에 해당되는 직원이 없다면..
			empVO = new EmpVO();
			model.addAttribute("loginFail", "해당 아이디가 없습니다.");
			return "emp/loginForm";
		}
		
		
	}
		
	@RequestMapping("/index")
	public String index() {
		
		logger.info("index");
		
		return "emp/index";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		// 로그아웃
		session.invalidate();
		
		// 로그인 폼으로 redirect
		return "redirect:/emp/loginForm";
	}
	
	@RequestMapping("/")
	public String initMain() {
		return "redirect:/emp/index";
	}
}







