package kr.or.ddit.article.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

public class ArticleVO {
	private int articleNo;
	private WriterVO WriterVO;
	@NotBlank
	private String title;
	private Date regdate;
	private Date moddate;
	private int readCnt;
	private ArticleContentVO articleContentVO;
	
	public ArticleVO() {}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public WriterVO getWriterVO() {
		return WriterVO;
	}

	public void setWriterVO(WriterVO writerVO) {
		WriterVO = writerVO;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getModdate() {
		return moddate;
	}

	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public ArticleContentVO getArticleContentVO() {
		return articleContentVO;
	}

	public void setArticleContentVO(ArticleContentVO articleContentVO) {
		this.articleContentVO = articleContentVO;
	}

	@Override
	public String toString() {
		return "ArticleVO [articleNo=" + articleNo + ", WriterVO=" + WriterVO + ", title=" + title + ", regdate="
				+ regdate + ", moddate=" + moddate + ", readCnt=" + readCnt + ", articleContentVO=" + articleContentVO
				+ "]";
	}

	
	
}
