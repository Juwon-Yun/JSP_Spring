package kr.or.ddit.emp.service;

import java.util.List;

import kr.or.ddit.emp.vo.EmpVO;

public interface EmpService {
	public List<EmpVO> list() throws Exception;

	public int insert(EmpVO empVo) throws Exception;

	public String createEmpNo() throws Exception;

	public EmpVO detail(String empNo) throws Exception;

	public int update(String empNo) throws Exception;
}
