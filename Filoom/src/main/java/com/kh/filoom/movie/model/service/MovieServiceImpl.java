package com.kh.filoom.movie.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.filoom.movie.model.dao.MovieDao;
import com.kh.filoom.movie.model.vo.Movie;
import com.kh.filoom.movie.model.vo.Poster;

@Service
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	// sqlSession을 쓰기 위한 빌드업
	
	@Autowired // nullPointerException 방지용
	private MovieDao mDao;
	
	// 작품 수 체크 - 순서대로 전체, 개봉작, 미개봉작
	public int checkVideoCount() {
		return mDao.checkVideoCount(sqlSession);
	}
	
	public int checkOpenedVideoCount() {
		return mDao.checkOpenedVideoCount(sqlSession);
	}
	
	public int checkNotOpenVideoCount() {
		return mDao.checkNotOpenVideoCount(sqlSession);
	}

	// 영화 탭 HOME
	public ArrayList<Movie> selectNow4() {
		return mDao.selectNow4(sqlSession);
	}
	
	public ArrayList<Movie> selectPre4() {
		return mDao.selectPre4(sqlSession);
	}

	
	// 박스 오피스 목록 조회
	public ArrayList<Movie> selectBoxOffice(int cpage) {
		// TODO Auto-generated method stub
		return mDao.selectBoxOffice(sqlSession, cpage);
	}

	@Override
	public ArrayList<Movie> selectNowPlaying(int cpage) {
		// TODO Auto-generated method stub
		return mDao.selectNowPlaying(sqlSession, cpage);
	}
	
	// 박스오피스 - 개봉순 정렬 (개봉작만)
	// 미개봉작 포함해 조회할 기능은 만들 예정 없음
	@Override
	public ArrayList<Movie> listbyOpenedOrder(int cpage) {
		// TODO Auto-generated method stub
		return mDao.listbyOpenedOrder(sqlSession, cpage);
	}

	@Override
	public ArrayList<Movie> listbyCritics(int cpage) {
		// TODO Auto-generated method stub
		return mDao.listbyCritics(sqlSession, cpage);
	}

	@Override
	public ArrayList<Movie> listbyName(int cpage) {
		// TODO Auto-generated method stub
		return mDao.listbyName(sqlSession, cpage);
	}

	@Override
	public ArrayList<Movie> listbyNamePlaying(int cpage) {
		// TODO Auto-generated method stub
		return mDao.listbyNamePlaying(sqlSession, cpage);
	}

	// 개봉 예정작 목록 조회
	/** 개봉 예정일 빠른 순 조회
	 * ※ '개봉 예정작' 페이지의 기본 정렬 기준
	 * 제작일 : 2024-12-18
	 * 제작자 : 정원섭
	 */
	@Override
	public ArrayList<Movie> listbyOpenOrder(int cpage) {
		// TODO Auto-generated method stub
		return mDao.listbyOpenOrder(sqlSession, cpage);
	}

	@Override
	public ArrayList<Movie> listbyNamePre(int cpage) {
		// TODO Auto-generated method stub
		return mDao.listbyNamePre(sqlSession, cpage);
	}
	
	// 검색 기능
	@Override
	public ArrayList<Movie> searchMovie(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mDao.searchMovie(sqlSession, map);
	}
	
	// === 영화 상세 페이지 ===
	@Override
	public Movie showDetail(int movieNo) {
		// TODO Auto-generated method stub
		return mDao.showDetail(sqlSession, movieNo);
	}
	
	public Poster showThumbnail(int movieNo) {
		return mDao.showThumbnail(sqlSession, movieNo);
	}
	
	// ======
	
	// === 관리자 메뉴 ===
	
	// === 관리 목록 페이지 ===
	@Override
	public ArrayList<Movie> adminMovieList(int isOpen) {
		// TODO Auto-generated method stub
		return mDao.adminMovieList(sqlSession, isOpen);
	}
	// 관리자 영화 검색의 경우, 쿼리 자체는 사용자 쪽과 동일하게 사용
	
	@Override
	public int addMovie(Movie m) {
		// TODO Auto-generated method stub
		return mDao.addMovie(sqlSession, m);
	}

	@Transactional
	public int updateMovie(Movie m) {
		// TODO Auto-generated method stub
		return mDao.updateMovie(sqlSession, m);
	}

	// POSTER 테이블에 첨부한 이미지를 추가하는 용도 (영화 추가, 수정)
	@Override
	public int addPoster(Poster p) {
		// TODO Auto-generated method stub
		return mDao.addPoster(sqlSession, p);
	}

	// DB에 영화 추가는 성공했으나, 포스터 업로드는 실패했을 때 되돌리는 용도
	// 사유 : 영화는 포스터 없이 추가할 수 없게 되어 있음
	@Override
	public int undoAddMovie(int movieNo) {
		// TODO Auto-generated method stub
		return mDao.undoAddMovie(sqlSession, movieNo);
	}

	// === 영화 수정 페이지 ===
	// 관리 상세 화면에서 수정 페이지 접근시, 해당되는 영화의 기존 정보를 띄워줌 
	@Override
	public Movie selectMovietoModify(int movieNo) {
		// TODO Auto-generated method stub
		return mDao.selectMovietoModify(sqlSession, movieNo);
	}
	
	@Transactional
	public int changePoster(Poster p) {
		return mDao.changePoster(sqlSession, p);
	}
	

	// 영화 수정시 기존 이미지 삭제, 영화 삭제시 해당 이미지 삭제용 메소드
	@Override
	@Transactional
	public int deletePoster(int imageId) {
		// TODO Auto-generated method stub
		return mDao.deletePoster(sqlSession, imageId);
	}

	@Override
	public int deleteMovie(int movieNo) {
		// TODO Auto-generated method stub
		return mDao.deleteMovie(sqlSession, movieNo);
	}

	@Override
	public int togglePremiere(int movieNo, HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return mDao.togglePremiere(sqlSession, map);
	}

	

	
	
	
}
