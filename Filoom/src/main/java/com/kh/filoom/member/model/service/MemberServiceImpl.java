package com.kh.filoom.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.filoom.member.model.dao.MemberDao;
import com.kh.filoom.member.model.vo.Favorite;
import com.kh.filoom.member.model.vo.History;
import com.kh.filoom.member.model.vo.Member;
import com.kh.filoom.member.model.vo.Reserve;

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
	public int changePwd(Member loginUser) {

		return memberDao.changePwd(sqlSession, loginUser);
	}

	@Override
	public int changeName(Member loginUser) {

		return memberDao.changeName(sqlSession, loginUser);
	}

	@Override
	public int changeGender(Member loginUser) {

		return memberDao.changeGender(sqlSession, loginUser);
	}

	@Override
	public int changeBirth(Member loginUser) {

		return memberDao.changeBirth(sqlSession, loginUser);
	}

	@Override
	public int changeMarketing(Member loginUser) {

		return memberDao.changeMarketing(sqlSession, loginUser);
	}

	@Override
	public int withdrawMember(String userId) {

		return memberDao.withdrawMember(sqlSession, userId);
	}

	@Override
	public List<Reserve> reserveList(int userNo) {

		return memberDao.reserveList(sqlSession, userNo);
	}

	@Override
	public List<Reserve> cancelList(int userNo) {

		return memberDao.cancelList(sqlSession, userNo);
	}

	@Override
	public List<Reserve> couponList(int userNo) {

		return memberDao.couponList(sqlSession, userNo);
	}
	
	@Override
	public List<History> historyListByYear(int userNo, String year) {
		
	    return memberDao.historyListByYear(sqlSession, userNo, year);
	}

	@Override
	public String findUserId(Map<String, Object> paramMap) {

		return memberDao.findUserId(sqlSession, paramMap);
	}

	@Override
	public String findUserPwd(Map<String, Object> paramMap) {

		return memberDao.findUserPwd(sqlSession, paramMap);
	}

	@Override
	@Transactional
	public int updateUserPwd(Map<String, String> paramMap) {

		return memberDao.updateUserPwd(sqlSession, paramMap);
	}

	@Override
	public List<Favorite> favoriteList(int userNo) {

		return memberDao.favoriteList(sqlSession, userNo);
	}

	@Override
	public int deleteFavorite(Map<String, Object> paramMap) {

		return memberDao.deleteFavorite(sqlSession, paramMap);
	}
	
	@Override
	@Transactional
	public int deleteHistorySeat(Map<String, Object> paramMap) {

		return memberDao.deleteHistorySeat(sqlSession, paramMap);
	}

	@Override
	@Transactional
	public int deleteHistory(Map<String, Object> paramMap) {

		return memberDao.deleteHistory(sqlSession, paramMap);
	}

	@Override
	public List<Favorite> sortFavoriteMovies(int userNo, String sort) {
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("userNo", userNo);
	    paramMap.put("sort", sort);
	    return memberDao.sortFavoriteMovies(sqlSession, paramMap);
	}

	@Override
	public boolean checkEmail(String email) {

		return memberDao.checkEmail(sqlSession, email) > 0;
	}

	

	
	

}


















