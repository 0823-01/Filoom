package com.kh.filoom.book.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.filoom.book.model.vo.BookingSeat;
import com.kh.filoom.book.model.vo.Playing;
import com.kh.filoom.movie.model.vo.Movie;
import com.kh.filoom.movie.model.vo.MovieWithPoster;

@Repository
public class BookDao {

	public ArrayList<Movie> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("movieMapper.selectList");
	}

	public Movie selectMovie(SqlSessionTemplate sqlSession, int movieNo) {
		return sqlSession.selectOne("movieMapper.selectMovie", movieNo);
	}

	public ArrayList<Playing> selectMovieDate(SqlSessionTemplate sqlSession, int movieNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("bookMapper.selectMovieDate", movieNo);
	}

	public ArrayList<BookingSeat> selectMovieSeat(SqlSessionTemplate sqlSession, int playingNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("bookMapper.selectMovieSeat", playingNo);
	}

	public int insertBookingSeat(SqlSessionTemplate sqlSession, BookingSeat bk) {
		// TODO Auto-generated method stub
		return sqlSession.update("bookMapper.insertBookingSeat", bk);
	}

	public int deleteBookingSeat(SqlSessionTemplate sqlSession, BookingSeat bk) {
		// TODO Auto-generated method stub
		return sqlSession.delete("bookMapper.insertBookingSeat", bk);
	}

}
