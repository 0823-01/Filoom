package com.kh.filoom.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.filoom.member.model.dao.MemberDao;
import com.kh.filoom.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	// SqlSessionTemplate 객체를 얻어오는 과정
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// MemberDao 객체 또한 빈으로 등록 후 객체를 얻어내자!!
	@Autowired
	private MemberDao memberDao;

	@Override
	public Member loginMember(Member m) {

		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	@Transactional
	public int insertMember(Member m) {

		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public boolean idCheck(String userId) {

		return memberDao.idCheck(sqlSession, userId) > 0; // 아이디가 존재하면 true 반환
	}

	@Override
	@Transactional
	public int updatePassword(Member m) {

		return memberDao.updatePassword(sqlSession, m);
	}

}


















