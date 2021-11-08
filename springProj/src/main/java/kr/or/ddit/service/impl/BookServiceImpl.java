package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.BookDao;
import kr.or.ddit.serivce.BookService;
/*
	스프링한테 이 클래스는 서비스 클래스라고 알려줌
	스프링 MVC 구조에서 Controller와 DAO를 연결하는 역할
 	
 	스프링 프레임워크는 직접 클래스를 생성하는것을 지양하고
 	인터페이스를 통해 접근하는 것을 권장하고 있기 때문.
 	그래서 서비스 레이어는 인터페이스와 클래스를 함께 사용함
 */
@Service
public class BookServiceImpl implements BookService {
	// 생성 되있는것을 DI 받음
	@Autowired
	BookDao bookDao;
	
	//메소드 오버라이드
	@Override
	public String insert(Map<String, Object> map) {
		return (String)this.bookDao.insert(map);
	}

	@Override
	public Map<String, Object> select(Map<String, Object> map) {
		return this.bookDao.select(map);
	}
	
	@Override
	public boolean update(Map<String, Object>map) {
		return this.bookDao.update(map);
	}
	
	@Override
	public boolean delete(Map<String, Object> map) {
		return this.bookDao.delete(map);
	}
	
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map){
		return this.bookDao.selectList(map);
	}
}
