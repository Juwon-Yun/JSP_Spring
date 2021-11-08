package kr.or.ddit.service.impl;

import org.springframework.stereotype.Service;

import kr.or.ddit.serivce.IBoardService;
import kr.or.ddit.vo.MemberVO;

@Service
public class BoardServiceImpl implements IBoardService{

	@Override
	public int insertMemberHobby(MemberVO memberVo) {
		
		/*
			컨트롤러 단에서 처리하면 1번은 commit 되지만 2번은 안되는 경우가 생김
			Service 단에서 처리하면 2번이 안되면 1번은 자동 롤백 해준다
			 
		  1) 회원 테이블로 insert
		 	int reuslt = BoardDao.insertMember(memberVo);
		
		  2) 취미 테이블로 insert
		 	if (result > 0) {
			BoardDao.insertHobby(memberVo);
		
		 */
		
		return 0;
	}
	
	
}
