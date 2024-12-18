package com.kh.filoom.member.model.service;

import java.util.List;

import com.kh.filoom.member.model.vo.Member;
import com.kh.filoom.member.model.vo.Reserve;

public interface MemberService {
	
	// 로그인 서비스 (select)
	Member loginMember(Member m);
	
	// 회원가입 서비스 (insert)
	int insertMember(Member m);

	// 아이디 중복체크 서비스 (select)
	boolean idCheck(String userId);

	// 비밀번호 변경 서비스 (update)
	int changePwd(Member loginUser);

	// 이름 변경 서비스 (update)
	int changeName(Member loginUser);

	// 성별 변경 서비스 (update)
	int changeGender(Member loginUser);

	// 생년월일 변경 서비스 (update)
	int changeBirth(Member loginUser);

	// 마케팅 동의 여부 변경 서비스 (update)
	int changeMarketing(Member loginUser);

	// 회원탈퇴용 서비스 (update)
	int withdrawMember(String userId);

	// 예매 내역 조회용 서비스 (select)
	List<Reserve> reserveList(int userNo);

	// 취소된 예매 내역 조회용 서비스 (select)
	List<Reserve> cancelList(int userNo);
	
	
}
