package kr.or.ddit.cus.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

public class CusVO implements Serializable{
	
	@NotBlank
	private String userId;
	
	@NotBlank
	@Size(max = 3) //글자 수, 컬렉션의 요소 개수 검사
	private String userName;
	
	@Email
	private String email;
	@NotBlank
	private String password;
	private String gender;
	// 과거 날짜인지 검사	
	@Past
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateOfBirth;
	
	// 중첩된 자바빈즈의 입력값 검증
	@Valid
	private List<CardVO> cardList;
	
	@Valid
	private AddressVO address;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public List<CardVO> getCardList() {
		return cardList;
	}

	public void setCardList(List<CardVO> cardList) {
		this.cardList = cardList;
	}

	public AddressVO getAddress() {
		return address;
	}

	public void setAddress(AddressVO address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "CusVO [userId=" + userId + ", userName=" + userName + ", email=" + email + ", password=" + password
				+ ", gender=" + gender + ", dateOfBirth=" + dateOfBirth + ", cardList=" + cardList + ", address="
				+ address + "]";
	}
	
	
}
