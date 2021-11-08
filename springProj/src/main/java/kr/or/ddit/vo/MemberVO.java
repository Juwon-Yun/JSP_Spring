package kr.or.ddit.vo;

import java.util.Arrays;
import java.util.List;

//자바빈 클래스
public class MemberVO {
	//MEMBER 테이블
	private String memId;
	private String memName;
	//Hobby 테이블
	private String [] hobbyList;
	
	//AddressVO
	private AddressVO addressVo;
	
	//CardVO
	private List<CardVO> cardList;
	
	public AddressVO getAddressVo() {
		return addressVo;
	}
	public void setAddressVo(AddressVO addressVo) {
		this.addressVo = addressVo;
	}

	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	
	public String[] getHobbyList() {
		return hobbyList;
	}
	public void setHobbyList(String[] hobbyList) {
		this.hobbyList = hobbyList;
	}
	
	
	
	public List<CardVO> getCardList() {
		return cardList;
	}
	public void setCardList(List<CardVO> cardList) {
		this.cardList = cardList;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memName=" + memName + ", hobbyList=" + Arrays.toString(hobbyList)
				+ ", addressVo=" + addressVo + ", cardList=" + cardList + "]";
	}
	
	
	
	
}
