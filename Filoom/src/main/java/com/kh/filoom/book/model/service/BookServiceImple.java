package com.kh.filoom.book.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.filoom.book.model.dao.BookDao;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectMovieDate(int movieNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectMovieSeat(int playingNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int bookMovieSeat(int seatNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
