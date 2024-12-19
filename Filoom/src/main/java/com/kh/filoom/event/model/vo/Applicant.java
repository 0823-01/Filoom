package com.kh.filoom.event.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Applicant {

	private int applicantNo; 		// 응모자 번호
	private int refEno; 	 		// 참조게시글 번호
	private int userNo; 	 		// 응모한 회원번호
	private String applicationDate; // 응모한날짜
	private String winStatus; 		// 당첨여부
}
