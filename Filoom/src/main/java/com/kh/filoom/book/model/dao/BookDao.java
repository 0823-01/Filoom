package com.kh.filoom.book.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.filoom.book.model.vo.Booking;
import com.kh.filoom.book.model.vo.BookingSeat;
import com.kh.filoom.book.model.vo.Playing;
import com.kh.filoom.coupon.model.vo.CouponUser;
import com.kh.filoom.member.model.vo.Member;
import com.kh.filoom.movie.model.vo.Movie;
import com.kh.filoom.movie.model.vo.MovieWithPoster;


@Repository
public class BookDao {

	public ArrayList<Movie> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("movieMapper.selectList");
	}

	public Movie selectMovie(SqlSessionTemplate sqlSession, int movieNo) {
		return sqlSession.selectOne("movieMapper.selectMovie", movieNo);
	}

	public ArrayList<Playing> selectMovieDate(SqlSessionTemplate sqlSession, int movieNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("bookMapper.selectMovieDate", movieNo);
	}


	public ArrayList<BookingSeat> selectMovieSeat(SqlSessionTemplate sqlSession, int playingNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("bookMapper.selectMovieSeat", playingNo);
	}

	public int insertBookingSeat(SqlSessionTemplate sqlSession, BookingSeat bk) {
		// TODO Auto-generated method stub
		return sqlSession.update("bookMapper.insertBookingSeat", bk);
	}

	public int deleteBookingSeat(SqlSessionTemplate sqlSession, BookingSeat bk) {
		// TODO Auto-generated method stub
		return sqlSession.delete("bookMapper.deleteBookingSeat", bk);
	}

	public int deleteBookingListList(SqlSessionTemplate sqlSession, ArrayList<BookingSeat> abk) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("list", abk);
		
		System.out.println("paramMap :" + paramMap);
		
		return sqlSession.delete("bookMapper.deleteBookingListList", paramMap);
	}




	
	
	
	
	
	
	
	
	
	
	
	
	//결제===========================================================================
	

	/**
	 * 유효성 검사 + 좌석일렬번호 쿼리문 실행
	 * @param sqlSession
	 * @param seatNo : 좌석번호(문자열)
	 * @param playingNo : 상영번호
	 * @return : 값이 있을경우 상영좌석일렬번호 / 없을경우 null
	 */
	public Integer getBookingseatNoList(SqlSessionTemplate sqlSession, String seatNo, int playingNo) {
		
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("seatNo", seatNo);
		map.put("playingNo", playingNo);
		
		Integer result = sqlSession.selectOne("bookMapper.getBookingseatNoList",map);
	
		
		return result; 
										
										
	}

	
	/**
	 * 좌석의 타임리밋 늘려주기 쿼리문 실행 메소드
	 * @param sqlSession
	 * @param i : 좌석일렬번호
	 * @return : 처리된 행의 갯수
	 */
	public int updateTimeLimit(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.update("bookMapper.updateTimeLimit",i);
	}

	//영화예매번호 생성 + 반환
	public int setAndGetBookNo(SqlSessionTemplate sqlSession, int userNo) {
		
		Booking booking = new Booking(); 
		booking.setUserNo(userNo);
		sqlSession.insert("bookMapper.setAndGetBookNo",booking);
		return	booking.getBookNo(); 
	}

	//쿠폰조회
	public ArrayList<CouponUser> selectListCouponUser(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("couponMapper.selectListCouponUser",userNo);
	}

	//회원정보조회
	public Member selectMember(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectMember",userNo);
	}

	//영화,상영정보
	public Movie selectMovieForPlayingNo(SqlSessionTemplate sqlSession, int playingNo) {
		return sqlSession.selectOne("movieMapper.selectMovieForPlayingNo",playingNo);
	}
}
