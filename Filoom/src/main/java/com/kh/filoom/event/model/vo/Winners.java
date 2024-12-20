package com.kh.filoom.event.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Winners {

	private int winnerNo;
	private int refEno;
	private String winner;
	private String winnerType;
	private String winStatus;
	private String winDate;
	private int CouponNo;
	
	
}
