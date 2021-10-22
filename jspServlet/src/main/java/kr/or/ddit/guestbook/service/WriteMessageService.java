package kr.or.ddit.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import kr.or.ddit.guestbook.dao.MessageDao;
import kr.or.ddit.guestbook.vo.GuestbookMessageVO;
import kr.or.ddit.util.ConnectionProvider;
import kr.or.ddit.util.JdbcUtil;

public class WriteMessageService {
	//singleton pattern
//	private static
//	public static
//	private 
	
	private static WriteMessageService instance = new WriteMessageService();
	public static WriteMessageService getInstance() {
		return instance;
	}
	private WriteMessageService() {}
	
	public void write(GuestbookMessageVO message) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDao.getInstance();
			int result = messageDao.insert(conn, message);
		}catch (SQLException e) {
			throw new ServiceException("메시지 등록 실패 : " + e.getMessage(), e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
