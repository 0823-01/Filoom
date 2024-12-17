package com.kh.filoom.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.filoom.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String userId) {

		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}

	public int changePwd(SqlSessionTemplate sqlSession, Member loginUser) {

		return sqlSession.update("memberMapper.changePwd", loginUser);
	}

	public int changeName(SqlSessionTemplate sqlSession, Member loginUser) {

		return sqlSession.update("memberMapper.changeName", loginUser);
	}

	public int changeGender(SqlSessionTemplate sqlSession, Member loginUser) {

		return sqlSession.update("memberMapper.changeGender", loginUser);
	}

	public int changeBirth(SqlSessionTemplate sqlSession, Member loginUser) {

		return sqlSession.update("memberMapper.changeBirth", loginUser);
	}

	public int changeMarketing(SqlSessionTemplate sqlSession, Member loginUser) {

		return sqlSession.update("memberMapper.changeMarketing", loginUser);
	}

	public int withdrawMember(SqlSessionTemplate sqlSession, String userId) {

		return sqlSession.update("memberMapper.withdrawMember", userId);
	}

}
