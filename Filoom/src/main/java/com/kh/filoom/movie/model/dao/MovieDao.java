package com.kh.filoom.movie.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

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

	public ArrayList<Movie> listbyOpenedOrder(SqlSessionTemplate sqlSession, int cpage) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.listbyOpenedOrder", cpage);
	}
	
	public ArrayList<Movie> listbyName(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.listbyName");
	}

	public ArrayList<Movie> listbyNamePlaying(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.listbyNamePlaying");
	}
	
	/**
	 * 미개봉작의 개봉예정일 빠른 순 정렬
	 * ※ '개봉 예정작' 페이지의 기본 정렬 기준
	 * 제작일: 2024-12-18
	 * 제작자: 정원섭
	 * @param sqlSession - 접속용 객체
	 * @return
	 */
	public ArrayList<Movie> listbyOpenOrder(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.listbyOpenOrder");
	}

	public ArrayList<Movie> listbyNamePre(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.listbyNamePre");
	}

	public ArrayList<Movie> selectNow4(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.selectNow4");
	}

	public ArrayList<Movie> selectPre4(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.comingVerySoon");
	}

	public ArrayList<Movie> searchMovie(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		return (ArrayList) sqlSession.selectList("movieMapper.searchMovie", map);
	}

	

}
