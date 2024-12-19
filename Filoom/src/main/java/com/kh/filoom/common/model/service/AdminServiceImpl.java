package com.kh.filoom.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.filoom.common.model.dao.AdminDao;
import com.kh.filoom.common.model.vo.Chart;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public Chart adminListView() {

		return adminDao.adminListView(sqlSession);
	
	}

	@Override
	public Chart adminMovieList() {
		// TODO Auto-generated method stub
		return adminDao.adminMovieList(sqlSession);
	}

	@Override
	public Chart adminPlayingMovieList() {
		// TODO Auto-generated method stub
		return adminDao.adminPlayingMovieList(sqlSession);
	}

	@Override
	public Chart adminMemberCount() {
		// TODO Auto-generated method stub
		return adminDao.adminMemberCount(sqlSession);
	}

	@Override
	public Chart adminTotalInput() {
		// TODO Auto-generated method stub
		return adminDao.adminTotalInput(sqlSession);
	}

	@Override
	public Chart adminGenreCount() {
		// TODO Auto-generated method stub
		return adminDao.adminGenreCount(sqlSession);
	}

	@Override
	public Chart adminTodayInput() {
		// TODO Auto-generated method stub
		return adminDao.adminTodayInput(sqlSession);
	}


}
