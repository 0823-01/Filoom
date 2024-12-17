package com.kh.filoom.movie.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.filoom.movie.model.dao.MovieDao;
import com.kh.filoom.movie.model.vo.Movie;

@Service
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	// sqlSession을 쓰기 위한 빌드업
	
	@Autowired // nullPointerException 방지용
	private MovieDao mDao;
	
	public int checkVideoCount() {
		return mDao.checkVideoCount(sqlSession);
	}
	
	public int checkOpenedVideoCount() {
		return mDao.checkOpenedVideoCount(sqlSession);
	}
	
	public int checkNotOpenVideoCount() {
		return mDao.checkNotOpenVideoCount(sqlSession);
	}

	@Override
	public int movieSelectTop() {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Movie> selectBoxOffice() {
		// TODO Auto-generated method stub
		return mDao.selectBoxOffice(sqlSession);
	}

	@Override
	public ArrayList<Movie> selectNowPlaying() {
		// TODO Auto-generated method stub
		return mDao.selectNowPlaying(sqlSession);
	}

	@Override
	public ArrayList<Movie> listbyOpenedOrder(int cpage) {
		// TODO Auto-generated method stub
		return mDao.listByOpenedOrder(sqlSession, cpage);
	}

	@Override
	public ArrayList<Movie> listbyOpenedOrderPlaying() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Movie> listbyCritics() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Movie> listbyName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Movie> listbyNamePlaying() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Movie> selectNotOpened() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Movie> listWaitingByName() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
