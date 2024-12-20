package com.kh.filoom.book.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.filoom.book.model.service.BookService;
import com.kh.filoom.book.model.vo.Booking;
import com.kh.filoom.book.model.vo.BookingSeat;
import com.kh.filoom.book.model.vo.Playing;
import com.kh.filoom.book.payment.DataEncrypt;
import com.kh.filoom.coupon.model.vo.CouponUser;
import com.kh.filoom.member.model.vo.Member;
import com.kh.filoom.movie.model.vo.Movie;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BookController {

	// 상점키
	private String merchantKey 		= "EYzu8jGGMfqaDEp76gSckuvnaHHu+bC4opsSN6lHv3b2lurNYkVXrZ7Z1AoqQnXI3eLuaUFyoRNC6FkrzVjceg==";
	// 상점아이디
	private String merchantID 		= "nicepay00m"; 				
	
	
	
	@Autowired
	private BookService bookService;
	
	
	
	@GetMapping("book.do")
	public String selectList(Model model) {
		
		ArrayList<Movie> list = bookService.selectList();
		
		ArrayList<Movie> firstMovie = bookService.selectFirstMovie(); 
		
		model.addAttribute("list", list);
		
		model.addAttribute("firstMovie", firstMovie);
		
		//System.out.println(list);
		
		return "book/book";
		
	}
	
	
	@ResponseBody
	@GetMapping(value = "movie.de", produces="application/json; charset=UTF-8")
	public ArrayList<Movie> getMovieDetail(@RequestParam("movieNo") int movieNo, Model model) {
		
		//System.out.println(movieNo);
		
		ArrayList<Movie> movie = bookService.selectMovie(movieNo);
		
		model.addAttribute("movie", movie);
		
		// System.out.println(movie);
		
		return movie;
	}
	
	@ResponseBody
	@GetMapping(value="book.ca", produces="application/json; charset=UTF-8")
	public String selectMovieDate(int movieNum) {
		
		// System.out.println(movieNum);
		
		ArrayList<Playing> list = bookService.selectMovieDate(movieNum);
		
		// System.out.println(list);
		
		return new Gson().toJson(list);
		
	}
	
	@ResponseBody
	@GetMapping(value="book.se", produces="application/json; charset=UTF-8")
	public String selectMovieSeat(int playingNo) {
		
		ArrayList<BookingSeat> list = bookService.selectMovieSeat(playingNo);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		
		System.out.println(list);
		
		return new Gson().toJson(list);
		
	}
	
	@ResponseBody
	@GetMapping(value = "book.fb", produces = "application/json; charset=UTF-8")
	public String insertBookingSeat(String seatId, int playingNo, HttpSession session, Model model) {

		Date currentDate = new Date();
		
		System.out.println("book.fb 실행");
		

		Calendar calendar = Calendar.getInstance();
	    calendar.setTime(currentDate);
	    calendar.add(Calendar.MINUTE, 10);

	    Date updatedTime = calendar.getTime();
	    // System.out.println("10분 후 시간: " + updatedTime);
	    java.sql.Timestamp sqlUpdatedTime = new java.sql.Timestamp(updatedTime.getTime());
	    
	    BookingSeat bk = new BookingSeat();
	    
	    bk.setSeatId(seatId);
	    bk.setPlayingNo(playingNo);
	    bk.setTimeLimit(sqlUpdatedTime);
	    System.out.println("입력받은 bk" + bk);
	    
	    // System.out.println("BookingSeat 객체: " + bk);
	 
	    int result = bookService.insertBookingSeat(bk);

	    return new Gson().toJson(bk);
	}

	
	
	@ResponseBody
	@GetMapping("book.err")
	public String checkBooking(@RequestParam("seatId") String seatId, @RequestParam("playingNo") int playingNo) {
	    // 중복 확인 로직

	    HashMap<String, Object> map = new HashMap<>();
		
		map.put("seatId", seatId);
		map.put("playingNo", playingNo);
		
		//System.out.println(seatId);
		//System.out.println(playingNo);
		//System.out.println("map :" + map);
		
		int isExist = bookService.isSeatAlreadyBooked(map);
	    
	    if (isExist == 1) {
	        return "이미 값이 존재합니다! 다른 좌석을 선택해주세요!";
	    } else {
	        return "SUCCESS";
	    }
	}
	
	@ResponseBody
	@GetMapping(value = "book.fd", produces = "application/json; charset=UTF-8")
	public String deleteBookingSeat(String seatId, int playingNo, BookingSeat bk, HttpSession session, Model model) {

	    Date currentDate = new Date();

	    ///System.out.println(seatId);
	    // System.out.println(playingNo);

	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(currentDate);
	    calendar.add(Calendar.MINUTE, 10);

	    // 10분 후의 시간을 구하고 java.sql.Date로 변환
	    Date updatedTime = calendar.getTime();
	    java.sql.Timestamp sqlUpdatedTime = new java.sql.Timestamp(updatedTime.getTime());
	    
	    BookingSeat bkk = new BookingSeat();
	    bkk.setSeatNo(seatId);
	    bkk.setPlayingNo(playingNo);
	    bkk.setTimeLimit(sqlUpdatedTime); // java.sql.Date를 설정

	    // System.out.println("BookingSeat 객체: " + bkk);
	    int result = bookService.deleteBookingSeat(bkk);

	    return new Gson().toJson(bkk);
	}
	
	
	@ResponseBody
	@PostMapping(value="book.re", produces="application/json; charset=UTF-8")
	public String pay(int playingNo, String seatId) {
	
		// System.out.println(playingNo);
		// System.out.println(seatId);
		
		String[] seatArray = seatId.split(",\\s*"); // 쉼표와 공백 기준으로 분리
	    ArrayList<BookingSeat> abk = new ArrayList<>();

	    // 변환된 배열 확인
	    for (String seat : seatArray) {
	        System.out.println("좌석 ID: " + seat);

	        // 필요한 경우 BookingSeat 객체 생성 및 리스트에 추가
	        BookingSeat bookingSeat = new BookingSeat();
	        bookingSeat.setSeatNo(seat.trim());
	        bookingSeat.setPlayingNo(playingNo);
	        abk.add(bookingSeat);
	    }

		// System.out.println(abk);
	    
		
	    int result = bookService.deleteBookingListList(abk);
		
		return new Gson().toJson(abk);
	}
	
	
	@GetMapping("movie.sea")
	public String movieSearch(String searchMovieKeyword, Model model) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		
		map.put("searchMovieKeyword", searchMovieKeyword);
		
		//System.out.println(searchMovieKeyword);
		//System.out.println(map);
		
		
		ArrayList<Movie> firstMovie = bookService.selectSearchFirstMovie(map);
		ArrayList<Movie> list = bookService.movieSearch(map);
		
		model.addAttribute("list", list);
		model.addAttribute("firstMovie", firstMovie);
		
		//System.out.println(moive);
		
		return "book/book";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//형문/////////////////////////////////////////////////////////////////////////
	
	
	@Autowired
	private DataEncrypt sha256Enc;


	
	@GetMapping("paymentForm.pm")
	public ModelAndView paymentForm(ModelAndView mv,HttpSession session,int playingNo,  @RequestParam("seatNos")ArrayList<String> seatNos) {
		
		//session에서 회원번호 가져오기
		Member loginUser = (Member)session.getAttribute("loginUser");

		
		int userNo = loginUser.getUserNo();
		
		
		  
		log.debug("1==결제폼 요청(상영번호+좌석번호 seatNos : "+seatNos +"상영번호 : "+playingNo + " ,회원번호 : " +userNo );
		
		
		//1.유효성검사 + 상영좌석일렬번호 구하기
		//좌석번호리스트, 영화상영번호 넘기면서, 유효성검사 (둘중하나라도 예약불가 / 둘다 예약가능일경우)
		
		ArrayList<BookingSeat> bookingSeatNoList = new ArrayList();
		
		bookingSeatNoList = bookService.getBookingSeatNoList(seatNos,playingNo);

		log.debug("상영좌석 일렬번호 리스트 " +bookingSeatNoList);
		
		if(bookingSeatNoList==null) { //유효성 실패
			
			log.debug("2==유효성테스트 실패, 메인페이지로 ->");
			session.setAttribute("alertMsg", "죄송합니다. 시간이 오래 경과되어 다시 시도해주시기 바랍니다.");
			mv.setViewName("redirect:/"); 
			
		}else {

			log.debug("2==유효성테스트 성공");
			
			//유효시간 5분 늘려주기
			int updateTimeLimit = bookService.updateTimeLimit(bookingSeatNoList);
			log.debug("3==TimeLimit 늘려주기 : 처리된행의갯수" + updateTimeLimit);
			 
			
		//3.결제화면에 넘길 정보 조회, mv에 담기
			

	
			//*상영번호 -> 영화정보,이미지,상영정보, 상영관정보 조회
			Movie movie = bookService.selectMovieForPlayingNo(playingNo);
			
			log.debug("4==영화정보(+포스터),상영정보,상영관 정보 movie : " + movie.toString());
			mv.addObject("movie",movie);
			
			//*상영번호 -> 상영좌석, 상영관정보 조회
			
			ArrayList<BookingSeat> bookingSeatList = new ArrayList();			
			bookingSeatList = bookService.selectListBookingSeat(bookingSeatNoList);
			log.debug("5==좌석정보, 상영관정보 : bookingSeatList : " + bookingSeatList.toString() );
			
			mv.addObject("bookingSeatList",bookingSeatList);
	
			
			

			
			session.setAttribute("alertMsg", "결제하자");	
			mv.setViewName("book/paymentForm");
			
			
		}

		

		return mv;

	}
	
	@ResponseBody
	@PostMapping(value="couponList.co",produces="application/json; charset=UTF-8")
	public String selectCouponList(int userNo){
		
		//*회원번호 -> 쿠폰리스트
		ArrayList<CouponUser> couponUserList = new ArrayList();
		couponUserList = bookService.selectListCouponUser(userNo);
		log.debug("ajax==사용가능한 쿠폰 조회 couponUserList : "+couponUserList.toString());
		
		return new Gson().toJson(couponUserList);

	}
	
	
	
	
}
