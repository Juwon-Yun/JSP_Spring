package kr.or.ddit.guestbook.service;

import java.util.List;

import kr.or.ddit.guestbook.vo.GuestbookMessageVO;

// 페이징 처리 전용 클래스
public class MessageListView {
	// 전체 글 수
	private int messageTotalCount;
	// 현재 페이지 번호
	private int currentPageNumber;
	// 전체 페이지 수
	private int pageTotalCount;
	// 페이지 별 글의 갯수
	private int messageCountPerPage;
	// 첫 행 번호
	private int firstRow;
	// 끝 행 번호
	private int endRow;
	// 출력할 데이터
	private List<GuestbookMessageVO> messageList;
	// contructor(생성자)
	public MessageListView(int messageTotalCount, int currentPageNumber, int messageCountPerPage, int firstRow,
			int endRow, List<GuestbookMessageVO> messageList) {
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		this.messageList = messageList;
		
		calculatePageTotalcount();
	}
	// 전체 행의 수, 페이지 별 글의 개수를 이용 => 전체 페이지 개수 구함
	private void calculatePageTotalcount() {
		// 0 행
		if(this.messageTotalCount==0) {
			pageTotalCount = 0;
		// 여러행
		}else {
			// 전체 페이지 수 = 전체 행의 수 / 페이지 별 글 개수
			pageTotalCount = messageTotalCount / messageCountPerPage;
			// ex) 11 % 3 => 2 , 즉 나머지가 있으면 페이지를 1 증가시킴 
			if(messageTotalCount%messageCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}
	public int getMessageTotalCount() {
		return messageTotalCount;
	}
	public void setMessageTotalCount(int messageTotalCount) {
		this.messageTotalCount = messageTotalCount;
	}
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}
	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}
	public void setMessageCountPerPage(int messageCountPerPage) {
		this.messageCountPerPage = messageCountPerPage;
	}
	public int getFirstRow() {
		return firstRow;
	}
	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public List<GuestbookMessageVO> getMessageList() {
		return messageList;
	}
	public void setMessageList(List<GuestbookMessageVO> messageList) {
		this.messageList = messageList;
	}
	
	//결과가 있는지 여부
	public boolean isEmpty() {
		return messageCountPerPage == 0;
	}
	
	
}
