package kr.or.ddit.article.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.article.service.ArticleService;
import kr.or.ddit.article.vo.ArticleContentVO;
import kr.or.ddit.article.vo.ArticlePage;
import kr.or.ddit.article.vo.ArticleVO;
import kr.or.ddit.article.vo.WriterVO;
import kr.or.ddit.emp.vo.EmpVO;

@Controller
@RequestMapping("/article")
public class ArticleController {
	
	@Autowired
	ArticleService articleService;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(ArticleController.class);
	
	//글작성 폼
	@RequestMapping("/newArticleForm")
	public String newArticleForm(@ModelAttribute("articleVo") ArticleVO article
			, Model model) {
				
		model.addAttribute("article", article);
		
		//forwarding
		return "article/newArticleForm";
	}
	
	//글 입력
	@RequestMapping(value="/newArticlePost",method=RequestMethod.POST)
	public String newArticlePost(
			@ModelAttribute("articleVo") ArticleVO article,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		//EMPVO라는 이름의 세션 정보를 가져와 직원데이터를 empVO 객체에 할당
		EmpVO empVO = (EmpVO)session.getAttribute("EMPVO");
		//작성자 직원 번호, 작성자 명을 할당
		WriterVO writerVO = new WriterVO(empVO.getEmpNo(), empVO.getNm());
		//article 객체의 작성자 중첩객체 필드로 setting을 함
		article.setWriterVO(writerVO);
		
		//article : ArticleVO [articleNo=0, 
//		WriterVO=WriterVO [writerId=1, writerName=김은대], 
//		title=제목, regdate=null, moddate=null, 
//		articleContentVO=kr.or.ddit.article.vo.ArticleContentVO@45e2ab1b, 
//		readCnt=0]
		logger.info("article : " + article.toString());
		
		return "article/newArticleSuccess";
	}
	
	@RequestMapping("/listArticle")
	public String listArticle(Model model
			, @RequestParam(value = "currentPage"
			, defaultValue = "1") String currentPage) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		logger.info("list");
		
		int total = this.articleService.totalArticle();
		
		map.put("currentPage", currentPage);

		//article, article_content 조인 결과 목록
		List<ArticleVO> mapList = this.articleService.selectArticle(map);
		if(mapList != null) {
//			logger.info("mapList : " + mapList.get(0).toString());
		}
		
		//size : 한 화면에 보여지는 행의 수
		model.addAttribute("articlePage", 
				new ArticlePage(total, Integer.parseInt(currentPage),
						10, mapList));
		//게시글 목록 화면
		return "article/listArticle";
	}
	
}







