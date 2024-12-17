package com.kh.filoom.movie.model.service;

import java.util.ArrayList;

import com.kh.filoom.movie.model.vo.Movie;

public interface MovieService {
	// 작품 수 체크 - 전체
	int checkVideoCount();
	
	// 작품 수 체크 - 개봉
	int checkOpenedVideoCount();
	
	// 작품 수 체크 - 미개봉
	int checkNotOpenVideoCount();
	
	// 영화 목록 조회 관련 메소드들
	/*
	 * movieSelectTop()
	 * 	└ selectNow4()
	 * 	└ selectPre4()
	 * viewBoxOffice(pi) - selectBoxOffice(pi)
	 * viewOpenedOnly(pi) - selectNowPlaying(pi)
	 * 		listbyOpenedOrder(pi)
	 * 		listbyCritics(pi)
	 * 		listbyName(pi)
	 * viewNotOpened(pi) - selectMovieListPre(pi)
	 * 		listbyOpenOrder(pi)
	 * 		listbyNamePre(pi)
	 */
	
	int movieSelectTop();
	
	// 초기 정렬
	ArrayList<Movie> selectBoxOffice(); // 개봉순
	ArrayList<Movie> selectNowPlaying(); // 개봉작만
	
	// 정렬 기준
	// 박스 오피스
	ArrayList<Movie> listbyOpenedOrder(int cpage); // 개봉순
	ArrayList<Movie> listbyOpenedOrderPlaying(); // 개봉순(개봉작만)
	ArrayList<Movie> listbyCritics(); // 평점순(개봉작만)
	ArrayList<Movie> listbyName(); // 가나다순(전체)
	ArrayList<Movie> listbyNamePlaying(); // 가나다순(개봉작만)
	
	// 개봉 예정작
	ArrayList<Movie> selectNotOpened(); // 기본 개봉예정 빠른 순
	ArrayList<Movie> listWaitingByName(); // 가나다순
	
	
}
