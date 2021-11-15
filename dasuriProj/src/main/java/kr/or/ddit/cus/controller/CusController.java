package kr.or.ddit.cus.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.cus.vo.CusVO;

@Controller
@RequestMapping("/cus")
public class CusController {

	private static final Logger logger = LoggerFactory.getLogger(CusController.class);
	
	
	@RequestMapping("/register")
	public String registerForm(CusVO cusVo, Model model) {
		
		logger.info("register");
		
		Map<String, Object> genderMap = new HashMap<>();
		genderMap.put("1", "Male");
		genderMap.put("2", "FeMale");
		genderMap.put("3", "Other");
		
		model.addAttribute("CusVO", cusVo);
		model.addAttribute("genderMap", genderMap);

		return "cus/registerForm";
	}
	
	// 입력값 검증을 할 도메인 클래스에 validated 어노테이션을 지정하면 됨
	@RequestMapping(value = "/register", method = RequestMethod.POST )
	public String register(@ModelAttribute("CusVO") @Validated CusVO cusVo, BindingResult result) {
		
		logger.info("result.hasErrors() => "+result.hasErrors());
		
		//validate 한 결과가, 오류가 있을 시에 forwarding
		if(result.hasErrors()) {
			return "cus/registerForm";
		}
		
		return "cus/success";
	}

}

