package kr.or.ddit.serivce;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProductVO;

public interface IGuestBookService {
	
	// 상품 전체 목록
	public List<Map<String, Object>> list();
	
	// 상품 등록
	public int insert(Map<String, Object> map);
	
	// 상품 수정에 필요한 해당 상품 정보 리턴
	public Map<String, Object> selectOne(String id);

	// 상품 수정
	public void update(Map<String, Object> map);
	
	// 상품 삭제
	public void delete(String id); 
}
