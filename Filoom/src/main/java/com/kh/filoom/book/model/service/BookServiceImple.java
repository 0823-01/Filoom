package com.kh.filoom.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.filoom.book.model.dao.BookDao;
import com.kh.filoom.book.model.vo.BookingSeat;
import com.kh.filoom.book.model.vo.Playing;
import com.kh.filoom.coupon.model.vo.CouponUser;
import com.kh.filoom.member.model.vo.Member;
import com.kh.filoom.movie.model.vo.Movie;


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
	public ArrayList<Movie> selectFirstMovie() {
		
		return bookDao.selectFirstMovie(sqlSession);
		
	}

	@Override
	public ArrayList<Movie> selectMovie(int movieNo) {
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

	@Override
	public ArrayList<Movie> movieSearch(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return bookDao.movieSearch(sqlSession, map);
	}
	
	
	@Override
	public ArrayList<Movie> selectSearchFirstMovie(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return bookDao.selectSearchFirstMovie(sqlSession, map);
	}
	
	@Override
	@Transactional
	public int isSeatAlreadyBooked(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return bookDao.isSeatAlreadyBooked(sqlSession, map);
	}
	
	@Override
	public ArrayList<Movie> selectListKid() {
		// TODO Auto-generated method stub
		return bookDao.selectListKid(sqlSession);
	}

	@Override
	public ArrayList<Movie> selectFirstMovieKid() {
		// TODO Auto-generated method stub
		return bookDao.selectFirstMovieKid(sqlSession);
	}
	
	
	@Override
	public ArrayList<Movie> movieSearchKid(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return bookDao.movieSearchKid(sqlSession, map);
	}

	@Override
	public ArrayList<Movie> selectSearchFirstMovieKid(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return bookDao.selectSearchFirstMovieKid(sqlSession, map);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//결제===========================================================================


	//좌석등록하기 
	@Override
	@Transactional
	public int insertBookingSeats(int playingNo, ArrayList<String> seatNos) {
		return bookDao.insertBookingSeats(sqlSession,playingNo,seatNos);
		
	}	
	
	//1. 좌석 유효성 검사 + 상영좌석일렬번호 반환
	@Override
	public ArrayList<BookingSeat> getBookingSeatNoList(ArrayList<String> seatNos,int playingNo) {
		
		ArrayList<BookingSeat> bookingSeatNoList = new ArrayList();
		
		
		bookingSeatNoList = bookDao.getBookingseatNoList(sqlSession,seatNos,playingNo);

		ArrayList<BookingSeat> bookingSeatNoList = bookDao.checkAndGetBookingSeatNoList(sqlSession,seatNos,playingNo,bookingSeatNos);

		return bookingSeatNoList;
	}

	//3. 좌석 유효시간 sysdate + 5분
	@Override
	public int updateTimeLimit(ArrayList<String> seatNos) {
		return bookDao.updateTimeLimit(sqlSession,seatNos);
	}

	
	
	//4. 영화예매번호 생성 + 반환
	@Override
	@Transactional
	public int setBookNo(int userNo) {
		return bookDao.setAndGetBookNo(sqlSession,userNo);
	}

	
	//5. 사용가능한 쿠폰리스트조회
	@Override
	public ArrayList<CouponUser> selectListCouponUser(int userNo) {
		
		return bookDao.selectListCouponUser(sqlSession,userNo);
	}

	//6. 회원정보조회
	@Override
	public Member selectMember(int userNo) {
		return bookDao.selectMember(sqlSession,userNo);
	}

	//7. 상영번호로 영화정보 조회
	@Override
	public Movie selectMovieForPlayingNo(int playingNo) {
		return bookDao.selectMovieForPlayingNo(sqlSession,playingNo);
	}

	//8. 상영좌석정보, 좌석번호 조회
	@Override
	public ArrayList<BookingSeat> selectListBookingSeat(ArrayList<BookingSeat> bookingSeatNoList) {
		return bookDao.selectListBookingSeat(sqlSession,bookingSeatNoList);
	}


	//결제전 쿠폰 유효성 검사
	@Override
	public int selectCheckCoupon(List<Integer> couponNos,int userNo) { 
		return bookDao.selectCheckCoupon(sqlSession,couponNos,userNo);
	}

	//쿠폰에 북넘버 추가하기
	@Override
	public int setCouponBookNo(List<Integer> couponNos, int userNo, int bookNo) {
		return  bookDao.setCouponBookNo(sqlSession,couponNos,userNo,bookNo);
		
	}
	//유효성 테스트 통과x, bookNo 지우기
	@Override
	public int deleteBookNo(int bookNo, int userNo) {
		return bookDao.deleteBookNo(sqlSession,bookNo,userNo);
	}



	//영화 예매 처리
	@Override
	public int updateBookingDone(Booking booking) {
		return bookDao.updateBookingDone(sqlSession,booking);
	}

	//예매된 좌석 처리
	@Override
	public int updateBookingSeatDone(ArrayList<BookingSeat> bookingSeatNoList,int bookNo) {
		return bookDao.updateBookingSeatDone(sqlSession,bookingSeatNoList,bookNo);
	}

	

	
	//상영좌석 삭제 bookingSeatList
	@Override
	public int deleteBookingSeats2(ArrayList<BookingSeat> bookingSeatList,ArrayList<Integer> bookingSeatNos) {
		return bookDao.deleteBookingSeats2(sqlSession,bookingSeatList,bookingSeatNos);
	}




	


	
}
