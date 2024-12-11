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

	private int bookNo;
	private int userNo;
	private String bookDate;
	private int bookTotalCost;
	private int bookCost;
	private String costProcess;
	private String costTid;
	private String status;
	private String modifyDate;
}

