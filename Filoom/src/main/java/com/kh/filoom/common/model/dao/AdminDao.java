package com.kh.filoom.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.filoom.common.model.vo.Chart;

@Repository
public class AdminDao {

	public Chart adminListView(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminMapper.adminListView");
	}

	public Chart adminMovieList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.adminMovieList");
	}

	public Chart adminPlayingMovieList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.adminPlayingMovieList");
	}

	public Chart adminMemberCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.adminMemberCount");
	}

	public Chart adminTotalInput(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.adminTotalInput");
	}

	public Chart adminGenreCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.adminGenreCount");
	}

	public Chart adminTodayInput(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.adminTodayInput");
	}


}
