package com.kh.filoom.movie.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.filoom.movie.model.vo.Movie;
import com.kh.filoom.movie.model.vo.Poster;

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

	public ArrayList<Movie> selectBoxOffice(SqlSessionTemplate sqlSession, int cpage) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.selectBoxOffice", cpage);
	}

	public ArrayList<Movie> selectNowPlaying(SqlSessionTemplate sqlSession, int cpage) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.selectNowPlaying", cpage);
	}

	public ArrayList<Movie> listbyOpenedOrder(SqlSessionTemplate sqlSession, int cpage) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.listbyOpenedOrder", cpage);
	}
	
	public ArrayList<Movie> listbyName(SqlSessionTemplate sqlSession, int cpage) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.listbyName", cpage);
	}

	public ArrayList<Movie> listbyNamePlaying(SqlSessionTemplate sqlSession, int cpage) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.listbyNamePlaying", cpage);
	}
	
	/**
	 * 미개봉작의 개봉예정일 빠른 순 정렬
	 * ※ '개봉 예정작' 페이지의 기본 정렬 기준
	 * 제작일: 2024-12-18
	 * 제작자: 정원섭
	 * @param sqlSession - 접속용 객체
	 * @return
	 */
	public ArrayList<Movie> listbyOpenOrder(SqlSessionTemplate sqlSession, int cpage) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.listbyOpenOrder", cpage);
	}

	public ArrayList<Movie> listbyNamePre(SqlSessionTemplate sqlSession, int cpage) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.listbyNamePre", cpage);
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

	public ArrayList<Movie> listbyCritics(SqlSessionTemplate sqlSession, int cpage) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.listbyCritics", cpage);
	}


	public Movie showDetail(SqlSessionTemplate sqlSession, int movieNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("movieMapper.showDetail", movieNo);
	}

	
	public Poster showThumbnail(SqlSessionTemplate sqlSession, int movieNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("movieMapper.showThumbnail", movieNo);
	}

	public int addMovie(SqlSessionTemplate sqlSession, Movie m) {
		// TODO Auto-generated method stub
		/* int influence = */sqlSession.insert("movieMapper.addMovie", m);
		// System.out.println(influence);
		// 이건 영향을 받은 row 수가 나오기 때문에 0 또는 1만 나오는 게 맞음
		
		// 추가된 영화의 movieNo 리턴하기 (포스터 추가와 추가 실패시 되돌리는데 활용)
		return /*int movieNo = */m.getMovieNo();
	}

	// 영화 수정
	public int updateMovie(SqlSessionTemplate sqlSession, Movie m) {
		// TODO Auto-generated method stub
		return sqlSession.update("movieMapper.updateMovie", m);
	}

	public int addPoster(SqlSessionTemplate sqlSession, Poster p) {
		return sqlSession.insert("movieMapper.addPoster", p);
	}
	
	public int undoAddMovie(SqlSessionTemplate sqlSession, int movieNo) {
		return sqlSession.delete("movieMapper.undoAddMovie", movieNo);
	}

	public Movie selectMovietoModify(SqlSessionTemplate sqlSession, int movieNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("movieMapper.selectMovietoModify", movieNo);
	}

	public ArrayList<Movie> adminMovieList(SqlSessionTemplate sqlSession, int isOpen) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.adminMovieList", isOpen);
	}

	public int changePoster(SqlSessionTemplate sqlSession, Poster p) {
		// TODO Auto-generated method stub
		return sqlSession.update("movieMapper.changePoster", p);
	}

	public int deletePoster(SqlSessionTemplate sqlSession, int movieNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("movieMapper.deletePoster", movieNo);
	}

	public int deleteMovie(SqlSessionTemplate sqlSession, int movieNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("movieMapper.deleteMovie", movieNo);
	}

	public int togglePremiere(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("movieMapper.togglePremiere", map);
	}
	
	public ArrayList<Movie> showRunInfo(SqlSessionTemplate sqlSession, int movieNo) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("movieMapper.showRunInfo", movieNo);
	}

	public int checkRunCount(SqlSessionTemplate sqlSession, int movieNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("movieMapper.checkRunCount", movieNo);
	}

	public int newRunInfo(SqlSessionTemplate sqlSession, Movie m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("movieMapper.newRunInfo", m);
	}

	public int checkScreen(SqlSessionTemplate sqlSession, int screenNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("movieMapper.checkScreen", screenNo);
	}
	
	/**
	 * @param sqlSession - DB 접속용 객체
	 * @param playingNo - 상영정보 ID
	 * @return
	 * 12/24 15:46 정원섭
	 */
	public int removeRunInfo(SqlSessionTemplate sqlSession, int playingNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("movieMapper.removeRunInfo", playingNo);
	}

	

	

}
