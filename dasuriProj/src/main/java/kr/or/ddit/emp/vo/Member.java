package kr.or.ddit.emp.vo;

import java.util.List;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class Member {
	
	@NotBlank
	private String userId;
	
	@NotBlank
	@Size(max = 3)
	private String userName;
	
	private String email;
	private String password;
	private String introduction;
	private List<String> hobbyList;
	private boolean developer;
	private boolean foreinger;
	private String gender;
	private String nationality;
	private List<String> carList;
}
