package com.kh.filoom.coupon.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Coupon {

	//	COUPON_NO	NUMBER
	private int couponNo;
	//	COUPON_NAME	VARCHAR2(300 BYTE)
	private String couponNmae;
	//	COUPON_DATE	DATE
	private Date couponDate;
	//	COUPON_STATUS	VARCHAR2(1 BYTE)
	private String couponStatus;
	//	COUPON_LEVEL	NUMBER
	private int couponLevel;
	//	REF_ENO	NUMBER
	private int refEno;
}
