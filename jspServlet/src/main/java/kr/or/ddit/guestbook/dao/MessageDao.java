package kr.or.ddit.guestbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import kr.or.ddit.guestbook.vo.GuestbookMessageVO;
import kr.or.ddit.util.JdbcUtil;

public class MessageDao {
	private static MessageDao instance = new MessageDao();
	public static MessageDao getInstance() {
		return instance;
	}
	private MessageDao() {}
	
	public int insert(Connection conn, GuestbookMessageVO message) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(
					"insert into guestbook_message"
					+ "(message_id, guest_name, password, message)"
					+ " values(SEQ_GM.NEXTVAL, ?, ?, ?)"
					
					);
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
		}
		return result;
	}
	public static int selectCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT COUNT(*) FROM guestbook_message");
			rs.next();
			return rs.getInt(1);
		}catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	// 글 목록 구하는 Dao
	public List<GuestbookMessageVO> selectList(Connection conn, int firstRow, int endRow) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(""
					+ "SELECT S.*"
					+ "FROM"
					+ " ("
					+ "    SELECT ROW_NUMBER() OVER (ORDER BY MESSAGE_ID DESC) RNUM"
					+ "        ,MESSAGE_ID"
					+ "        ,GUEST_NAME"
					+ "        ,PASSWORD"
					+ "        ,MESSAGE"
					+ "    FROM GUESTBOOK_MESSAGE"
					+ " )   S"
					+ " WHERE S.RNUM BETWEEN ? AND ?");
			pstmt.setInt(1, firstRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			// SELECT 결과가 없을 때 오류가 발생하는 것을 방지
			if(rs.next()) {
				List<GuestbookMessageVO> messageList = new ArrayList<>();
				do {
					GuestbookMessageVO vo = new GuestbookMessageVO();
					vo.setMessageId(rs.getInt("MESSAGE_ID"));
					vo.setGuestName(rs.getString("GUEST_NAME"));
					vo.setPassword(rs.getString("PASSWORD"));
					vo.setMessage(rs.getString("MESSAGE"));
					messageList.add(vo);
				}while(rs.next());
				return messageList;
			//SELECT 결과가 없을 때 
			}else {
				return Collections.emptyList();
			}//end if
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return null;
	}
	public GuestbookMessageVO selectOne(Connection conn, int messageId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(""
					+ "SELECT GUEST_NAME, PASSWORD, MESSAGE FROM GUESTBOOK_MESSAGE WHERE MESSAGE_ID = ?");
			pstmt.setInt(1, messageId);
			rs = pstmt.executeQuery();
			// SELECT 결과가 없을 때 오류가 발생하는 것을 방지
			if(rs.next()) {
				GuestbookMessageVO vo = new GuestbookMessageVO();
				do {
					vo.setGuestName(rs.getString("GUEST_NAME"));
					vo.setPassword(rs.getString("PASSWORD"));
					vo.setMessage(rs.getString("MESSAGE"));
				}while(rs.next());
				return vo;
			//SELECT 결과가 없을 때 
			}else {
				return null;
			}//end if
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return null;
	}
	public int updateMessage(Connection conn, GuestbookMessageVO vo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(""
					+ "update GUESTBOOK_MESSAGE"
					+ "    set GUEST_NAME = ?, "
					+ "         MESSAGE = ? "
					+ "        where MESSAGE_ID = ?");
			pstmt.setString(1, vo.getGuestName());
			pstmt.setString(2, vo.getMessage());
			pstmt.setInt(3, vo.getMessageId());
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
		}
		return result;
	}
	public int deleteMessage(Connection conn, int messageId) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(""
					+ "delete from GUESTBOOK_MESSAGE where MESSAGE_ID = ?");
			pstmt.setInt(1, messageId);
			result = pstmt.executeUpdate();
			System.out.println(result);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
		}
		return result;
	}
	
}
