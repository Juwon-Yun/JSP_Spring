package kr.or.teacher.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProductVO;

public interface ProductMapper {
	//상품 목록
	public List<Map<String,Object>> list();
	
	public int insert(ProductVO productVo);
	
	// 상품 수정 입력 폼
	public List<Map<String, Object>> update();
	
	// mapping한 XML의 id값 => 메소드명
	public Map<String, Object> detail(Map<String, Object> map);
}
