package com.kh.filoom.member.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Reserve {
	
	private String movieTitle;    // 영화 제목
    private int runtime;          // 러닝타임
    private int bookNo;           // 예매 번호
    private int bookCost;         // 최종 결제 금액
    private int bookTotalCost;    // 결제 금액
    private String costProcess;	  // 결제 방식
    private int totalTickets;     // 매 수 (BOOK_NO의 중복 개수)
    private String screenName;    // 상영관 이름
    private String seatNo;        // 좌석 번호
    private Date playtime;        // 상영 시작 일시
    private Date endTime;		  // 상영 종료 일시
    private Date modifyDate;	  // 결제 취소 날짜
    
}
