package kr.or.teacher.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.ProductVO;

@Repository
public class ProductDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//상품 목록
	public List<Map<String,Object>> list(){
		//namespace.id
		return this.sqlSessionTemplate.selectList("product.list");
	}
	
	//상품 정보 입력
	public int insert(ProductVO productVo) {
		return this.sqlSessionTemplate.insert("product.insert", productVo);
	}
	
	//상품 정보 수정 폼
	public List<Map<String, Object>> update() {
		return this.sqlSessionTemplate.selectList("product.list");
	}
	
	// 상품 상세보기
	// map : {pId = ???}
	public Map<String, Object> detail(Map<String, Object> map){
		return this.sqlSessionTemplate.selectOne("product.detail", map);
	}
}






