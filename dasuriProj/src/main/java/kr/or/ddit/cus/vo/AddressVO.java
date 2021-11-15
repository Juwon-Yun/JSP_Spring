package kr.or.ddit.cus.vo;

import org.hibernate.validator.constraints.NotBlank;


public class AddressVO {
	// 우편번호
	@NotBlank
	private String postCode;
	
	// 주소
	@NotBlank
	private String location;
	
	// 상세주소
	private String location2;

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLocation2() {
		return location2;
	}

	public void setLocation2(String location2) {
		this.location2 = location2;
	}

	@Override
	public String toString() {
		return "AddressVO [postCode=" + postCode + ", location=" + location + ", location2=" + location2 + "]";
	}
	
	
}
