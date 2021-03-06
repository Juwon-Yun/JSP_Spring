package kr.or.ddit.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import kr.or.ddit.guestbook.dao.MessageDao;
import kr.or.ddit.guestbook.vo.GuestbookMessageVO;
import kr.or.ddit.util.ConnectionProvider;
import kr.or.ddit.util.JdbcUtil;

public class GetMessageListService {
	private static GetMessageListService instance = new GetMessageListService();
	public static GetMessageListService getInstance() {
		return instance;
	}
	private GetMessageListService() {}
	
	// 한 페이지에 보여줄 메시지 개수를 3으로 지정(상수)
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	public MessageListView getMessageList(int pageNumber) {
		Connection conn = null;
		//현재 페이지 번호
		int currentPageNumber = pageNumber;
		
		try {
			conn = ConnectionProvider.getConnection();
			// Data Access Object(DB작업하는 객체)
			MessageDao messageDao = MessageDao.getInstance();
			
			int messageTotalCount = MessageDao.selectCount(conn);
			
			/*
			  알아야할 데이터 
			  0) 현재 페이지 번호	ex) 3
			  1) 전체 행수			7
			  2) 첫행				7
			  3) 끝행				7
			*/
			//전체 데이터를 담을 List선언
			List<GuestbookMessageVO> messageList = null;
			// 첫행
			int firstRow = 0;
			// 끝행
			int endRow = 0;
			
			//데이터가 있으면 실행
			if(messageTotalCount > 0) {
				//첫행 공식: (현재 페이지 -1) * 출력할 데이터 개수 + 1;
				firstRow = (pageNumber - 1)*MESSAGE_COUNT_PER_PAGE + 1;
				//끝행 번호 공식 : firstRow + 출력할 데이터 개수 -1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE -1;
				//글 목록 구하기
				messageList = messageDao.selectList(conn, firstRow, endRow);
				
			// 데이터가 없으면...
			}else {
				currentPageNumber = 0;
				//비어있는 List로 사용한다는 의미, null과 다름
				// 목적 : 테스트 코드 작성 시 비어있는지 체킹할 때 사용됨
				//messageList = new ArrayList<>();
				messageList = Collections.emptyList();
			}// end if
			
			// 여기서 리턴을 해도 try 문의 finally이 실행된다.
			return new MessageListView(messageTotalCount, currentPageNumber,
					MESSAGE_COUNT_PER_PAGE, firstRow, endRow, messageList);
		}catch(SQLException e) {
			throw new ServiceException("목록 구하기 실패" + e.getMessage(), e);
		}finally {
			JdbcUtil.close(conn);
		}
	}

	public GuestbookMessageVO getMessageOne(int messageId) {
		Connection conn = null;
		GuestbookMessageVO vo = null;
		try {
			vo = new GuestbookMessageVO();
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDao.getInstance();
			vo = messageDao.selectOne(conn, messageId);
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(conn);
		}
		return vo;
	}
	public int updateMessage(GuestbookMessageVO vo) {
		Connection conn = null;
		int cnt = 0;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDao.getInstance();
			cnt = messageDao.updateMessage(conn, vo);
		}catch(SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			JdbcUtil.close(conn);
		}
		return cnt;
	}
	public int deleteMessage(int messageId) {
		Connection conn = null;
		int cnt = 0;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDao.getInstance();
			cnt = messageDao.deleteMessage(conn, messageId);
		}catch(SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			JdbcUtil.close(conn);
		}
		return cnt;
	}
}
