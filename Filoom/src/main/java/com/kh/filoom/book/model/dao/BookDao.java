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

	public ArrayList<Movie> selectFirstMovie(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("movieMapper.selectFirstMovie");
	}
	
	public ArrayList<Movie> selectMovie(SqlSessionTemplate sqlSession, int movieNo) {
		return (ArrayList)sqlSession.selectList("movieMapper.selectMovie", movieNo);
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
		
		// System.out.println("paramMap :" + paramMap);
		
		return sqlSession.delete("bookMapper.deleteBookingListList", paramMap);
	}

	
	public int movieSearch(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("movieMapper.movieSearch", map);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	//결제===========================================================================
	

	
	//유효성 검사 + 좌석일렬번호 검사
	public ArrayList<BookingSeat> getBookingseatNoList(SqlSessionTemplate sqlSession, ArrayList<String> seatNos, int playingNo) {
		
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("seatNos", seatNos);
		map.put("playingNo", playingNo);
		
		return (ArrayList)sqlSession.selectList("bookMapper.getBookingseatNoList",map); 
										
										
	}

	
	//TIME_LIMIT 늘려주기
	public int updateTimeLimit(SqlSessionTemplate sqlSession, ArrayList<BookingSeat> bookingSeatNoList) {
		return sqlSession.update("bookMapper.updateTimeLimit",bookingSeatNoList);
	}

	//영화예매번호 생성 + 반환
	public int setAndGetBookNo(SqlSessionTemplate sqlSession, int userNo) {
		
		Booking booking = new Booking(); 
		booking.setUserNo(userNo);
		sqlSession.insert("bookMapper.setAndGetBookNo",booking);
		return	booking.getBookNo(); 
	}


	//회원정보조회
	public Member selectMember(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectMember",userNo);
	}

	//영화,상영정보
	public Movie selectMovieForPlayingNo(SqlSessionTemplate sqlSession, int playingNo) {
		return sqlSession.selectOne("movieMapper.selectMovieForPlayingNo",playingNo);
	}

	//상영좌석일렬번호, 좌석 정보
	public ArrayList<BookingSeat> selectListBookingSeat(SqlSessionTemplate sqlSession,
			ArrayList<BookingSeat> bookingSeatNoList) {

		return (ArrayList)sqlSession.selectList("bookMapper.selectListBookingSeat",bookingSeatNoList);
	}

	//쿠폰조회
	public ArrayList<CouponUser> selectListCouponUser(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("couponMapper.selectListCouponUser",userNo);
	}

	

}
