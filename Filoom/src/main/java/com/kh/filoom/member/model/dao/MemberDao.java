package com.kh.filoom.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.filoom.member.model.vo.Favorite;
import com.kh.filoom.member.model.vo.History;
import com.kh.filoom.member.model.vo.Member;
import com.kh.filoom.member.model.vo.Reserve;

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

	public List<Reserve> reserveList(SqlSessionTemplate sqlSession, int userNo) {

		return sqlSession.selectList("memberMapper.reserveList", userNo);
	}

	public List<Reserve> cancelList(SqlSessionTemplate sqlSession, int userNo) {

		return sqlSession.selectList("memberMapper.cancelList", userNo);
	}

	public List<Reserve> useCouponList(SqlSessionTemplate sqlSession, int userNo) {

		return sqlSession.selectList("memberMapper.useCouponList", userNo);
	}

	public List<History> historyList(SqlSessionTemplate sqlSession, int userNo) {

		return sqlSession.selectList("memberMapper.historyList", userNo);
	}
	
	public List<History> historyListByYear(SqlSessionTemplate sqlSession, int userNo, String year) {
		
	    Map<String, Object> params = new HashMap<>();
	    params.put("userNo", userNo);
	    params.put("year", year);
	    return sqlSession.selectList("memberMapper.historyListByYear", params);
	}


	public String findUserId(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {

		return sqlSession.selectOne("memberMapper.findUserId", paramMap);
	}

	public String findUserPwd(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {

		return sqlSession.selectOne("memberMapper.findUserPwd", paramMap);
	}

	public int updateUserPwd(SqlSessionTemplate sqlSession, Map<String, String> paramMap) {

		return sqlSession.update("memberMapper.updateUserPwd", paramMap);
	}

	public List<Favorite> favoriteList(SqlSessionTemplate sqlSession, int userNo) {

		return sqlSession.selectList("memberMapper.favoriteList", userNo);
	}

	public int deleteFavorite(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {

		return sqlSession.delete("memberMapper.deleteFavorite", paramMap);
	}
	
	public int deleteHistorySeat(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {

		return sqlSession.delete("memberMapper.deleteHistorySeat", paramMap);
	}

	public int deleteHistory(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {

		return sqlSession.delete("memberMapper.deleteHistory", paramMap);
	}

	public List<Favorite> sortFavoriteMovies(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {

		return sqlSession.selectList("memberMapper.sortFavoriteMovies", paramMap);
	}

	public int checkEmail(SqlSessionTemplate sqlSession, String email) {

		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}

	

	

	

}
