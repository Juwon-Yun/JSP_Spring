package kr.or.ddit.emp.vo;

import lombok.Data;

//코드와 라벨 그리고 값을 저장할 수 있는 공통 클래스
@Data
public class CodeLabelValue {
	private String label;
	private String value;
}
