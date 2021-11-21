package kr.or.ddit.util.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UtilController {

	private static final Logger logger = LoggerFactory.getLogger(UtilController.class);
	
	@RequestMapping("/chart/charts")
	public ModelAndView charts(ModelAndView mav) {
		
		logger.info("charts");
		
		mav.setViewName("chart/charts");
		
		return mav;
	}
	
	@RequestMapping("/chart/chart01")
	public String chart01() {
		return "chart/chart01";
	}
	
	@RequestMapping("/chart/chart01Multi")
	public String chart01Multi() {
		return "chart/chart01Multi";
	}
	
//	@RequestMapping("/chart/chart02")
//	public String chart02() {
//		return "chart/chart02";
//	}
}
