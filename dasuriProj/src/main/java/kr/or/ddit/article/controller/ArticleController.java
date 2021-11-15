package kr.or.ddit.article.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.article.vo.ArticleVO;

/*
 	Neither BindingResult nor plain target object for bean name =>
 	@ModelAttribute("modelAttribute의 값에 들어가는 bean 이름")을 해줘야 오류가 나지않는다 
 	
 */

@Controller
@RequestMapping("/article")
public class ArticleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	
	@RequestMapping("/")
	public String newArticleForm(@ModelAttribute("articleVo") ArticleVO articleVo ,Model model) {
		model.addAttribute("articleVo" + new ArticleVO());
		
		logger.info("newArticleForm");
		
		return "article/newArticleForm";
	}
	
	@RequestMapping(value = "/newArticlePost", method = RequestMethod.POST)
	public String newArticlePost(@ModelAttribute("articleVo") @Valid ArticleVO articleVO) {
		
		logger.info("article => " + articleVO.toString());
		
		return "article/list";
	}
	
	@RequestMapping("/topbar")
	public String topbar() {
		return "topbar";
	}
}
