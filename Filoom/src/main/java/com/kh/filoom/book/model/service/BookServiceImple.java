package com.kh.filoom.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.filoom.book.model.dao.BookDao;
import com.kh.filoom.book.model.vo.BookingSeat;
import com.kh.filoom.book.model.vo.Playing;
import com.kh.filoom.movie.model.vo.Movie;

/**
 * @author 김형문
 *
 */
/**
 * @author 김형문
 *
 */
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

	@Override
	@Transactional
	public int deleteBookingListList(ArrayList<BookingSeat> abk) {
		// TODO Auto-generated method stub
		return bookDao.deleteBookingListList(sqlSession, abk);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//결제===========================================================================

	/**
	 * 상영좌석 번호 구하기+유효성검사
	 * 	유효성통과 -> 좌석일렬번호 리턴
	 * 	유효성불통과 -> null 리턴
	 */
	@Override
	public ArrayList<Integer> getBookingSeatNoList(ArrayList<String> seatNoList,int playingNo) {
		ArrayList<Integer> bookingSeatNoList = new ArrayList();
		
		
		for(String s : seatNoList) {
			Integer seatNo = bookDao.getBookingseatNoList(sqlSession,s,playingNo);
			
			
			if(seatNo==null) {
				bookingSeatNoList = null;
				
				return bookingSeatNoList;
				
			}
			
			bookingSeatNoList.add(seatNo);
			
		}
		
		
		return bookingSeatNoList;
	}

	/**
	 * 좌석 유효시간 늘려주기 (update)
	 */
	@Override
	public int updateTimeLimit(ArrayList<Integer> bookingSeatNoList) {
		
		int updateTimeLimit = 1;
		
//		for(int i : bookingSeatNoList) {
//			updateTimeLimit = bookDao.updateTimeLimit(sqlSession,i);
//		}
		return updateTimeLimit;
	}

	
	
	/**
	 * 영화예매번호 생성 + 예매번호 조회
	 */
	@Override
	@Transactional
	public int setBookNo(int userNo) {
		return bookDao.setAndGetBookNo(sqlSession,userNo);
	}

	
	
}
