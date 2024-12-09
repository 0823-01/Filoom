package com.kh.filoom.book.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Booking {
//	BOOK_NO	NUMBER
	private int bookNo;
	//	BOOK_DATE	DATE
	private String bookDate;
//	BOOK_COST	NUMBER
	private int bookCost;
//	COST_PROCESS	VARCHAR2(200 BYTE)
	private String costProcess;
//	STATUS	CHAR(1 BYTE)
	private String status;
//	MODIFY_DATE	DATE
	private String modifyDate;
//	USER_NO	NUMBER
	private int userNo;
}
