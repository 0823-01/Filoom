package com.kh.filoom.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Member {

	
	//	<id column="USER_NO" property="userNo" />
//	<result column="USER_ID" property="userId" />
//	<result column="USER_PWD" property="userPwd" />
//	<result column="USER_NAME" property="userName" />
//	<result column="GENDER" property="gender" />
//	<result column="BIRTH" property="birth" />
//	<result column="EMAIL" property="email" />
//	<result column="PHONE" property="phone" />
//	<result column="MARKETING" property="marketing" />
//	<result column="ENROLL_DATE" property="enrollDate" />
//	<result column="STATUS" property="status" />

	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String gneder;
	private String birth;
	private String email;
	private String phone;
	private String marketing;
	private String enrollDate;
	private String status;
	
	
}
