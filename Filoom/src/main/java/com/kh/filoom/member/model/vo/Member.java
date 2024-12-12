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

	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String gender;
	private String birth;
	private String email;
	private String phone;
	private String marketing;
	private String enrollDate;
	private String status;

}
