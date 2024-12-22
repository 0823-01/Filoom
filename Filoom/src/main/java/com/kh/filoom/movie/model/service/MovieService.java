package com.kh.filoom.movie.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.filoom.movie.model.vo.Movie;
import com.kh.filoom.movie.model.vo.Poster;

public interface MovieService {
	// 작품 수 체크 - 전체
	int checkVideoCount();
	
	// 작품 수 체크 - 개봉
	int checkOpenedVideoCount();
	
	// 작품 수 체크 - 미개봉
	int checkNotOpenVideoCount();
	
	// 영화 목록 조회 관련 메소드들
	/*
	 * === 현재 페이징처리와 listbyCritics() 빼고 전부 완료 ===
	 * - listbyCritics()도 쿼리와 함수까지 전부 만들어 놓긴 했으나, 
	 * 	REVIEW 테이블과의 JOIN이 필요한 관계로 REVIEW 더미데이터 넣은 후 추가예정
	 * 
	 * movieSelectTop() V
	 * 	└ selectNow4() V
	 * 	└ selectPre4() V
	 * viewBoxOffice(pi) - selectBoxOffice(pi) V
	 * viewOpenedOnly(pi) - selectNowPlaying(pi) V
	 * 		listbyOpenedOrder(pi) V
	 * 		listbyCritics(pi)
	 * 		listbyName(pi) V
	 * 		listbyNamePlaying(pi) V
	 * viewNotOpened(pi) 
	 * 		listbyOpenOrder(pi) - 기본, V
	 * 		listbyNamePre(pi) V
	 * searchMovie() V
	 */
	
	// 영화 탭 HOME
	ArrayList<Movie> selectNow4(); // 박스오피스 TOP 4 (임시로 MOVIE_NO 빠른 순)
	ArrayList<Movie> selectPre4(); // 개봉 예정일순 TOP 4
	
	// 초기 정렬
	ArrayList<Movie> selectBoxOffice(int cpage); // 개봉순
	ArrayList<Movie> selectNowPlaying(int cpage); // 개봉작만
	
	// 정렬 기준
	// 박스 오피스
	ArrayList<Movie> listbyOpenedOrder(int cpage); // 개봉순 (개봉작만)
	ArrayList<Movie> listbyCritics(int cpage); // 평점순(개봉작만)
	ArrayList<Movie> listbyName(int cpage); // 가나다순(전체)
	ArrayList<Movie> listbyNamePlaying(int cpage); // 가나다순(개봉작만)
	
	// 개봉 예정작
	ArrayList<Movie> listbyOpenOrder(int cpage); // 개봉예정 빠른 순 ← 기본 정렬 기준
	ArrayList<Movie> listbyNamePre(int cpage); // 가나다순
	
	// 영화 검색 - status = 0은 전체, 1은 개봉작만, 2는 미개봉작만 
	ArrayList<Movie> searchMovie(HashMap<String, Object> map);
	
	
	// === 영화 상세 페이지 ===
	Movie showDetail(int movieNo); // 상세 정보 조회
	// listScenes(); // 스틸컷 목록 조회
	// selectReviewList(); // 리뷰 목록 조회
	
	// 이미지 추가 - 영화 추가/수정 공통
	int addPoster(Poster p); // 이미지 추가
	int deletePoster(int imageId); // 이미지 삭제 - 영화 수정/삭제시 써먹을 의도
	
	// === 관리자 영화 추가 페이지 ===
	int addMovie(Movie m);
	int undoAddMovie(int movieNo); // 영화 추가 후 포스터 추가 실패시 써먹을 의도
	
	// === 관리자 영화 수정 페이지 ===
	int updateMovie(Movie m);
}
