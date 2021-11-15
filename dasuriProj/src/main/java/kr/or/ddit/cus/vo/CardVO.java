package kr.or.ddit.cus.vo;

import java.util.Date;

import javax.validation.constraints.Future;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;


public class CardVO {
	//null 안됨, trim 후 길이가 0보다 커야함
	@NotBlank
	private String no; //카드 번호
	// 지금 시간보다 더 큰값은 안됨
	@Future
	@DateTimeFormat(pattern = "yyyy-MM")
	private Date validMonth; //유효년월
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public Date getValidMonth() {
		return validMonth;
	}
	public void setValidMonth(Date validMonth) {
		this.validMonth = validMonth;
	}
	@Override
	public String toString() {
		return "CardVO [no=" + no + ", validMonth=" + validMonth + "]";
	}
	
	
}
