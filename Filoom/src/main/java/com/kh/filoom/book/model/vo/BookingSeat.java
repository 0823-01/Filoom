package com.kh.filoom.book.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class BookingSeat {

	private String status;
	private String timeLimit;
	private int seatNo;
	
}
