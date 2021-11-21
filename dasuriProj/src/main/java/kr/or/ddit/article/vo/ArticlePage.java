package kr.or.ddit.article.vo;

import java.util.List;

public class ArticlePage {
	// 전체 행의 수 => 70
	private int total;
	// 현재 페이지 번호
	private int currentPage;
	// 게시글 목록
	private List<ArticleVO> content;
	// 전체 페이지 수 => 7 
	private int totalPage;
	// 시작 페이지 번호 => 이전 [*1] [2] [3] [4] [5] [6] [7] 다음
	private int startPage;
	// 종료 페이지 번호 => 이전 [1] [2] [3] [4] [5] [6] [*7] 다음
	private int endPage;
	
	public ArticlePage(int total, int currentPage, int size, List<ArticleVO> content) {
		super();
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		
		// 결과 행이 없을 때
		if(total == 0) {
			totalPage = 0;
			startPage = 0;
			endPage = 0;
		// 결과 행이 있을 때
		}else {
			// 70행이 있고 5페이지 씩 묶을때, 한 화면에 10개씩 보일때
			totalPage = total / size;
			// 나머지 행이 있으면 전체 페이지 수를 1 증가
			if(total % size != 0) {
				totalPage++;
			}
			
			int modVal = currentPage % 5;
			
			// 시작 페이지 번호 공식 여기서 5는 5페이지 씩 묶을 때의 5이다.
			startPage = currentPage / 5 * 5 + 1;

			// 묶음의 마지막 페이지가 현재 페이지일 때 => (5, 10, 15, 20, 25...)
			if(modVal == 0) {
				startPage -= 5;
			}
			
			endPage = startPage + 4;
			
			// [1] [2] [3] [4] [5]
			// [6(startPage)] [7] [8(totalPage)] [9] [10(endPage)] endPage가 더 클 경우
			if(endPage > totalPage) {
				endPage = totalPage;
			}
			
		}// end constructor
		
		
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<ArticleVO> getContent() {
		return content;
	}

	public void setContent(List<ArticleVO> content) {
		this.content = content;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
}
