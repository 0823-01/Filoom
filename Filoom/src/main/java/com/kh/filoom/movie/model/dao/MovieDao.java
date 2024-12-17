package com.kh.filoom.movie.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.filoom.movie.model.vo.Movie;

@Repository
public class MovieDao {

	public int checkVideoCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("movieMapper.checkVideoCount");
	}

	public int checkOpenedVideoCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("movieMapper.checkOpenedVideoCount");
	}

	public int checkNotOpenVideoCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("movieMapper.checkNotOpenVideoCount");
	}

	public ArrayList<Movie> selectBoxOffice(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.selectBoxOffice");
	}

	public ArrayList<Movie> selectNowPlaying(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.selectNowPlaying");
	}

	public ArrayList<Movie> listByOpenedOrder(SqlSessionTemplate sqlSession, int cpage) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.listbyOpenedOrder", cpage);
	}

}
