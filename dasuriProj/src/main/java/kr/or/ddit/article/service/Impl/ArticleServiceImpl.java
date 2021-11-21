package kr.or.ddit.article.service.Impl;

import kr.or.ddit.article.mapper.ArticleMapper;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.article.service.ArticleService;
import kr.or.ddit.article.vo.ArticleVO;

@Service
public class ArticleServiceImpl implements ArticleService{
	
	@Autowired
	private ArticleMapper articleMapper;
	
	@Override
	public int insertArticle(ArticleVO articleVO) throws Exception {
		// 글정보 테이블로 insert
		// articleNo <= 0
		int res = this.articleMapper.insertArticle(articleVO);
		// 글내용 테이블로 insert
		// articleNo <= max(ARTICLE_NO)
		res += this.articleMapper.insertArticleContent(articleVO);
		return res;
	}

	@Override
	public List<ArticleVO> selectArticle(Map<String, Object> map) throws Exception {
		return this.articleMapper.selectArticle(map);
	}

	@Override
	public int totalArticle() throws Exception {
		return this.articleMapper.totalArticle();
	}
	
}
