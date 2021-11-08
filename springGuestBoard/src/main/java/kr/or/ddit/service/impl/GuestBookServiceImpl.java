package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.GuestBookDao;
import kr.or.ddit.serivce.IGuestBookService;
import kr.or.ddit.vo.ProductVO;

@Service
public class GuestBookServiceImpl implements IGuestBookService {

	@Autowired
	GuestBookDao guestBookDao;
	
	@Override
	public List<Map<String, Object>> list() {
		return this.guestBookDao.list();
	}
	
	@Override
	public int insert(Map<String, Object> map) {
		int cnt = this.guestBookDao.insert(map);
		return cnt; 
		
	}

	@Override
	public Map<String, Object> selectOne(String id) {
		return this.guestBookDao.selectOne(id);
	}
	
	@Override
	public void update(Map<String, Object> map) {
		this.guestBookDao.update(map);
	}
	
	@Override
	public void delete(String id) {
		this.guestBookDao.delete(id);
	}

}
