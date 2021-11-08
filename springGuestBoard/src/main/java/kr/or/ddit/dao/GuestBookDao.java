package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuestBookDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> list(){
		
		return this.sqlSessionTemplate.selectList("guestbook.list");
	}

	public int insert(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("guestbook.insert",map);
	}

	public Map<String, Object> selectOne(String id) {
		return this.sqlSessionTemplate.selectOne("guestbook.selectOne", id);
	}

	public void update(Map<String, Object> map) {
		this.sqlSessionTemplate.update("guestbook.update",map);
	}

	public void delete(String id) {
		this.sqlSessionTemplate.delete("guestbook.delete", id);
	} 
}
