package kr.or.ddit.article.vo;

import lombok.Data;

@Data
public class ArticleContentVO {
	
	private int articleNo;
	private String content;
	
	public ArticleContentVO() {}
	
	public ArticleContentVO(int articleNo, String content) {
		super();
		this.articleNo = articleNo;
		this.content = content;
	}
	
}
