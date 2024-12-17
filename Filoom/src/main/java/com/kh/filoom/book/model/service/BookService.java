package com.kh.filoom.book.model.service;

import java.util.ArrayList;

import com.kh.filoom.book.model.vo.BookingSeat;
import com.kh.filoom.book.model.vo.Playing;
import com.kh.filoom.coupon.model.vo.CouponUser;
import com.kh.filoom.member.model.vo.Member;
import com.kh.filoom.movie.model.vo.Movie;
import com.kh.filoom.movie.model.vo.MovieWithPoster;

public interface BookService {
	
	// 첫페이지) 영화 리스트 조회
	ArrayList<Movie> selectList();

	// 첫페이지 대표 영화 조회
	ArrayList<Movie> selectFirstMovie();
	// -- 이후 전부 Ajax --
	
	// 첫페이지) AJAX 영화 조회후 선택시 영화 상세설명 조회
	ArrayList<Movie> selectMovie(int movieNo);
	
	// 첫페이지 > 두번쨰페이지) Ajax사용) 
	// 영화 선택 클릭시 영화의 날짜 조회
	ArrayList<Playing> selectMovieDate(int movieNo);
	// playing db의 모든 데이터를 가져오기
	
	// 두번째 > 세번째 해당 날짜 선택 클릭시 해당 날짜의 좌석 조회
	ArrayList<BookingSeat> selectMovieSeat(int playingNo);
	// Seat DB 값 가져오기
	
	// 좌석 클릭시 ajax로 실시간 잠그기
	int insertBookingSeat(BookingSeat bk);

	// 좌석 클릭시 ajax 실시간 해제
	int deleteBookingSeat(BookingSeat bk);

	// 뒤로가기 및 이전 시 값 삭제
	int deleteBookingListList(ArrayList<BookingSeat> abk);


	
	//결제============================================================
	
	//상영좌석 번호 구하기+유효성검사
	ArrayList<BookingSeat> getBookingSeatNoList(ArrayList<String> seatNoList, int playingNo);

	//좌석 유효시간 늘려주기
	int updateTimeLimit(ArrayList<BookingSeat> bookingSeatNoList);

	//영화예매번호 생성하기
	int setBookNo(int userNo);
	
	//사용 가능한 쿠폰 조회하기
	ArrayList<CouponUser> selectListCouponUser(int userNo);

	//회원정보조회
	Member selectMember(int userNo);

	//상영번호로 영화정보 조회
	Movie selectMovieForPlayingNo(int playingNo);

	//상영좌석정보, 좌석번호 조회
	ArrayList<BookingSeat> selectListBookingSeat(ArrayList<BookingSeat> bookingSeatNoList);

	
	

}
