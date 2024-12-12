package com.kh.filoom.book.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class BookingSeat {

	private int bookingSeatNo;
	private String status;

	private String timeLimit;

	private Date timeLimit;

	private int bookNo;
	private int seatNo;
	private int playingNo;
	

	
	

}
