package com.kh.filoom.member.model.service;

import com.kh.filoom.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 서비스 (select)
	Member loginMember(Member m);
	
	// 회원가입 서비스 (insert)
	int insertMember(Member m);

	// 아이디 중복체크 서비스 (select)
	boolean idCheck(String userId);

	// 비밀번호 변경 서비스 (update)
	int updatePassword(Member loginUser);
	
}
