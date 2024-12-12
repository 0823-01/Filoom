package com.kh.filoom.book.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.filoom.book.model.dao.BookDao;
import com.kh.filoom.book.model.vo.BookingSeat;
import com.kh.filoom.book.model.vo.Playing;
import com.kh.filoom.movie.model.vo.Movie;

@Service
public class BookServiceImple implements BookService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BookDao bookDao;

	@Override
	public ArrayList<Movie> selectList() {
		// TODO Auto-generated method stub
		return bookDao.selectList(sqlSession);
	}

	@Override
	public Movie selectMovie(int movieNo) {
		return bookDao.selectMovie(sqlSession, movieNo);
	}

	@Override
	public ArrayList<Playing> selectMovieDate(int movieNo) {
		// TODO Auto-generated method stub
		return bookDao.selectMovieDate(sqlSession, movieNo);
	}

	@Override
	public ArrayList<BookingSeat> selectMovieSeat(int playingNo) {
		// TODO Auto-generated method stub
		return bookDao.selectMovieSeat(sqlSession, playingNo);
	}


	@Override
	@Transactional
	public int insertBookingSeat(BookingSeat bk) {
		// TODO Auto-generated method stub
		return bookDao.insertBookingSeat(sqlSession, bk);
	}

	@Override
	@Transactional
	public int deleteBookingSeat(BookingSeat bk) {
		// TODO Auto-generated method stub
		return bookDao.deleteBookingSeat(sqlSession, bk);
	}

	
}
