package com.kh.filoom.common.model.service;

import java.util.ArrayList;

import com.kh.filoom.common.model.vo.Chart;

public interface AdminService {

	Chart adminListView();
	
	Chart adminMovieList();
	
	Chart adminPlayingMovieList();
	
	Chart adminMemberCount();
	
	Chart adminTotalInput();
	
	Chart adminGenreCount();
	
	Chart adminTodayInput();
	
}
