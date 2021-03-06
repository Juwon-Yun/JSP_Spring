package kr.or.teacher.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProductVO;

public interface ProductService {
	//상품 목록
	public List<Map<String,Object>> list();
	
	public int insert(ProductVO productVo);
	
	// 상품 수정 입력 폼
	public List<Map<String, Object>> update();
	
	// 상품 상세보기
	public Map<String, Object> detail(Map<String, Object> map);
	
	// Mapper를 이용한 detail 메소드
	public Map<String, Object> detail02(Map<String, Object> map);

	public int goUpdate(ProductVO productVo);
	
}
