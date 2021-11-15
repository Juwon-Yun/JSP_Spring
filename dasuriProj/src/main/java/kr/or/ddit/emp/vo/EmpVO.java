package kr.or.ddit.emp.vo;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class EmpVO implements Serializable{
	
	@NotBlank
	private String empNo;
	@NotBlank
	private String nm;
	@NotBlank
	private String addr;
	@NotBlank
	private String hp;
	@NotBlank
	private String postNo;
	private String addr2;
	@NotBlank
	private String password;
	private String fire_yn;
	
	public EmpVO() {}
	
	public EmpVO(String empNo, String nm, String addr, String hp, String postNo, String addr2, String password,
			String fire_yn) {
		super();
		this.empNo = empNo;
		this.nm = nm;
		this.addr = addr;
		this.hp = hp;
		this.postNo = postNo;
		this.addr2 = addr2;
		this.password = password;
		this.fire_yn = fire_yn;
	}
	
	
	
}
