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

	private int applicantNo; 			// 응모자 번호
	private int refEno; 	 			// 참조게시글 번호
	private String userNo; 	 			// 응모한 회원번호
	private String applicationDate; 	// 응모한날짜
	private String drawingStatus; 		// 추첨여부
	private String winStatus; // 테이블에는 없지만 필요해서 만든거
}
