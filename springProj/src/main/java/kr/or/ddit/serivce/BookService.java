package kr.or.ddit.serivce;

import java.util.List;
import java.util.Map;

public interface BookService {
	
	//메소드 시그니처
	public String insert(Map<String, Object> map);
	
	public Map<String, Object> select(Map<String, Object> map);

	public boolean update(Map<String, Object> map);

	public boolean delete(Map<String, Object> map);

	public List<Map<String, Object>> list(Map<String, Object> map);
	
}	
