package com.kh.filoom.book.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	//영화 가격
	static final int PRICE = 100;
	
	
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
	public ModelAndView paymentForm(ModelAndView mv,
									HttpSession session,
									int playingNo,  
									@RequestParam("seatNos")ArrayList<String> seatNos) {
		
		System.out.println("결제창 오픈");
		//session에서 회원번호 가져오기
		Member loginUser = (Member)session.getAttribute("loginUser");

		
		int userNo = loginUser.getUserNo();
		
		
		  
		log.debug("1==결제폼 요청(상영번호+좌석번호 seatNos : "+seatNos +"상영번호 : "+playingNo + " ,회원번호 : " +userNo );
		
		
		//1.좌석유효성검사 + 좌석등록하기 + 상영좌석일렬번호 구하기
		//좌석번호리스트, 영화상영번호 넘기면서, 유효성검사 (둘중하나라도 예약불가 / 둘다 예약가능일경우)
		
		//좌석 검사하기 (선택된 좌석이 없는경우 통과 : 0 일경우 통과
		int checkSeatResult = bookService.checkBookingSeat(playingNo,seatNos);
		
		log.debug("좌석유효성 검사 0 이어야 함 : " + checkSeatResult);
		
		if(checkSeatResult!=0) { //검사 통과 실패
			log.debug("좌석 유효성 검사 통과 이미  x");
			session.setAttribute("alertMsg", "죄송합니다. 다시 시도해주시기 바랍니다. paymentForm");
			mv.setViewName("redirect:/"); 
		}else {
			


			//좌석 등록하기 
			int insertResult = bookService.insertBookingSeats(playingNo,seatNos);
			
			log.debug("좌석 등록하기+5분 , 1이어야함  : "+insertResult );
			
			
			//등록한 좌석 번호 가져오기
			ArrayList<BookingSeat> bookingSeatNoList = new ArrayList();
			
			bookingSeatNoList = bookService.checkAndGetBookingSeatNoList(seatNos,playingNo,null); 
			//좌석이름들과, 상영번호로 좌석번호 가져오기 

			log.debug("상영좌석 일렬번호 리스트 " +bookingSeatNoList);

///////////////////////////////////////////////////////////////////////////////////////////////////////	
			
			/* 필요없어짐
			if(bookingSeatNoList==null) { //유효성 실패
				
				log.debug("2==유효성테스트 실패, 메인페이지로 ->");
				session.setAttribute("alertMsg", "죄송합니다. 시간이 오래 경과되어 다시 시도해주시기 바랍니다.");
				mv.setViewName("redirect:/"); 
				
			}else {

				log.debug("2==유효성테스트 성공");
				
				//유효시간 5분 늘려주기
				int updateTimeLimit = bookService.updateTimeLimit(bookingSeatNoList);
				log.debug("3==TimeLimit 늘려주기 : 처리된행의갯수" + updateTimeLimit);
			*/
///////////////////////////////////////////////////////////////////////////////////////////////////////				
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
	
			
			
			mv.addObject("PRICE",PRICE);

			
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
	
	
	

	@ResponseBody
	@PostMapping(value="beforePay.pm",produces="application/json; charset=UTF-8")
	public String beforePay(@RequestBody Map<String,Object>data,HttpSession session) {
		
		
		log.debug("=====결제전 ajax 실행======");
		
		
		//유저번호
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		log.debug("유저 번호 : " + userNo);
		
		//쿠폰 번호
		List<Integer> couponNos = (List<Integer>) data.get("couponNos");
		log.debug("beforePay 선택된 쿠폰번호 : " +couponNos);
		
		
		//결제시 필요한 예매번호+유저번호 미리생성
				
		//booking 번호 생성(+userNo)
		Booking booking = new Booking();
		int bookNo = bookService.setBookNo(userNo);
		log.debug("BOOKING_NO 생성  bookNo = " + bookNo);
		

		//결제할 가격
		int price = (int)(double)data.get("price");
		log.debug("결제할 가격 : "+ price );


		//String merchantKey 	 	상점키
		//String merchantID 		상점아이디
		
		String ediDate 			= getyyyyMMddHHmmss();
		log.debug("전문생성일시 : "+ediDate);

		String hashString 		= sha256Enc.encrypt(ediDate + merchantID + price + merchantKey);
		log.debug("hashString : "+hashString );

		
		Map<String,Object> payInfo = new HashMap();
		payInfo.put("bookNo", bookNo);
		payInfo.put("merchantKey",merchantKey);
		payInfo.put("merchantId", merchantID);
		payInfo.put("ediDate", ediDate);
		payInfo.put("hashString", hashString);
		
		
		
		//bookNo, , 결제 번호, 상점키, 상점아이디, 전문생성일시, 해쉬값
		return new Gson().toJson(payInfo); 	
	}


	
	//결제 처리 컨트롤러 -> 결제 창 컨트롤러 호출
 	@PostMapping(value="payResult.pm")
	public ModelAndView PaymentResult(ModelAndView mv,
								@RequestParam Map<String, String> request,
								@RequestParam(value="couponNos", required=false)ArrayList<Integer> couponNos,
								@RequestParam("bookingSeatNos")ArrayList<String> bookingSeatNos,
								HttpSession session
								) throws Exception {
 		
 		log.debug("=========================");
		log.debug("==결제후 결제 처리 메소드 실행==");
		log.debug("=========================");
		
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		int bookNo = Integer.parseInt(request.get("bookNo"));
		int playingNo = Integer.parseInt(request.get("playingNo"));
		
		log.debug("넘어온 값들 : userNo : " + userNo +", bookNo = "+ bookNo +", playingNo : "+ playingNo);
				
		
		boolean seatTest = false;
		int couponTest = 0;
		

		
		//1. 좌석 유효성 검사
		//		넘어온 좌석번호로 유효성 검사
						
		ArrayList<BookingSeat> bookingSeatNoList = new ArrayList();
		bookingSeatNoList = bookService.checkAndGetBookingSeatNoList(null,playingNo,bookingSeatNos);
		
		log.debug("넘어온 좌석 정보 : "+bookingSeatNos);
		if(bookingSeatNoList.size() ==bookingSeatNos.size()) { 
			seatTest = true;
			mv.addObject("bookingSeatNoList",bookingSeatNoList); //좌석일렬번호
			log.debug("좌석 유효성 검사 통과 "+seatTest);
		}else {
			seatTest = false;
			log.debug("좌석 유효성 검사 실패 "+seatTest);
		}
		
		log.debug(" 좌석유효성 검사 결과 : "+seatTest + "상영좌석일렬번호 리스트"+ bookingSeatNoList);
		
		
		
		
		//2. 쿠폰 유효성 검사
		//		
		
		if(couponNos!=null) { //쿠폰 있는 경우		
			int couponResult = bookService.selectCheckCoupon(couponNos,userNo);						
			if(couponResult == couponNos.size()) {// 유효성테스트 통과
				couponTest = 1;
			}else { //유효성 테스트 실패
				couponTest = 2;
			}
		}
		log.debug(" 쿠폰 유효성 테스트 0(쿠폰x) 1(통과) 2(실패) 결과 : "+couponTest);
		
		
		//3. 결제 테스트 
		boolean payTest = payment(request,seatTest,couponTest);
		log.debug(" 결제 결과 payTest" + payTest);
		
		//4. 데이터 업데이트 (좌석, 쿠폰, 예매)
		
		if(payTest) { //결제성공
			//좌석 (타임리밋)
			int seatResult = bookService.updateBookingSeatDone(bookingSeatNoList,bookNo);
			log.debug("좌석 예매 성공 업데이트 처리된 행의 갯수 "+ seatResult);
			
			//쿠폰 (사용유무,예매번호)
			if(couponTest==1) {	
				int couponResult = bookService.updateCouponUserDone(couponNos,bookNo,userNo);
				log.debug("사용 처리된 쿠폰 수 : "+couponResult);
			}
			
			//예매(결제정보,
			Booking bookingData = new Booking();
			bookingData.setBookNo(bookNo);
			bookingData.setUserNo(userNo);
			bookingData.setBookTotalCost(Integer.parseInt(request.get("totalCost")));
			bookingData.setBookCost(Integer.parseInt(request.get("Amt")));
			bookingData.setCostProcess(request.get("PayMethod"));
			if(request.get("TxTid")!=null) {
				bookingData.setCostTid(request.get("TxTid"));
			}else{
				bookingData.setCostTid(null);
			}
			
			int bookingResult = bookService.updateBookingDone(bookingData);
			
			log.debug("영화예매 처리(update)된 행의 갯수 : "+bookingResult+" (1성공,0실패)");
			
			
			
			
			//보낼 정보 //조회하기 
			//*상영번호 -> 영화정보,이미지,상영정보, 상영관정보 조회
			Movie movie = bookService.selectMovieForPlayingNo(playingNo);
			
			mv.addObject("movie",movie);
			log.debug("보낼 정보 영화정보(+포스터),상영정보,상영관 정보 movie : " + movie.toString());
			
			//*상영좌석, 상영관정보 조회 (상영좌석번호로)
			ArrayList<BookingSeat> bookingSeatList = new ArrayList();			
			bookingSeatList = bookService.selectListBookingSeat(bookingSeatNoList);
			log.debug("좌석정보, 상영관정보 : bookingSeatList : " + bookingSeatList.toString() );
			
			mv.addObject("bookingSeatList",bookingSeatList);
			mv.addObject("bookNo",bookNo);
			
			
			//쿠폰정보 (북넘버)
			ArrayList<CouponUser> couponUserList = new ArrayList();
			couponUserList = bookService.selectListCouponUserList(bookNo);
			log.debug("보낼정보 사용한 쿠폰 정보들(예매번호) couponUserList: "+couponUserList.toString() );
			mv.addObject("couponUserList",couponUserList);
			
			//예약정보 (북넘버)
			Booking booking = bookService.selectBooking(bookNo);
			log.debug("보낼정보 예약된 정보들 : "+booking);
			mv.addObject("booking",booking);
			mv.setViewName("book/paymentResult");
			
		}else {
			
			
			//좌석 삭제
			int bookingSeatDeleteResult = bookService.deleteBookingSeats(bookingSeatNos);
			log.debug("좌석삭제 처리된 행의 갯수 : "+ bookingSeatDeleteResult);
			//쿠폰그대로
			//예매번호 삭제
			int bookingDeleteResult = bookService.deleteBooking(bookNo,userNo);
			log.debug("예매번호 삭제 처리된 행의 갯수 : "+bookingDeleteResult);
			
			
			session.setAttribute("alertMsg", "죄송합니다. 다시 시도해주시길 바랍니다");
			mv.setViewName("redirect:/");
		}
		
		
		return mv;
	}

 
 	//결제최소 요청 메소드
 	//
 	@PostMapping(value="cancelRequest.pm")
 	@ResponseBody
 	public String paymentCancelRequest(int bookNo,
 									   HttpSession session) throws Exception {
 		String result= "false";
 		//boolean cancelPayment(Booking booking)
 		log.debug("====================================");
 		log.debug("====결제취소요청 : bookNo : "+bookNo);
 		log.debug("====================================");
 		
 		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
 		Booking booking = bookService.selectBooking(bookNo);
 		
 		//취소 가능한지 유효성 검사(지금시간, 상영시간 비교
 		
 		//0 실패, 1이상 성공
 		int bookingCheckResult =bookService.checkCancelBooking(bookNo,userNo);
 		log.debug("결제취소 유효성 검사 : "+bookingCheckResult+" (0실패/1성공");
 		
 		
 		// 유효성 검사 통과 && 결제금액 있는 경우 
 		boolean cancelPaymentResult = false;
 		
 		if(bookingCheckResult>0) { //검사통과	
 			
 			int bookCost = booking.getBookCost();
 			
 			if(bookCost>0) {//결제금액 있는경우
 				cancelPaymentResult = cancelPayment(booking);
 			}else {//결제 금액 없는경우
 				cancelPaymentResult = true;	
 			}
 			
 			log.debug("결제 금액있는경우/없는경우 결제 취소 처리 : "+cancelPaymentResult+" (true통과/false실패)");
 		}
 		
 		//db 결제 취소 처리
 		if(bookingCheckResult>0 && cancelPaymentResult) { //둘다 성공인 경우 		
 			
 			//취소처리 (BOOKING, BOOKING_SEAT, COUPON_USER)
 			int cancelResult = bookService.cancelUpdateBooking(bookNo,userNo);
 			 			
 			log.debug("DB 결제 취소 성공-처리 : "+cancelResult + " (0실패/1이상 성공");
 			result = "success";
 		}
 		//아닌경우는 false

		return result;
 	}
 	
 	
	
 	
 	
	//나이스페이먼츠 결제 진행 메소드
	//결제정보, 좌석테스트결과, 쿠폰테스트결과를 받아 결제 진행 : 성공 true/실패 false 반환
 	
	public boolean payment(Map<String, String> request, //결제시 필요한 인증결과 데이터
								  boolean seatTest, //좌석유효성 검사 결과
								  int couponTest //쿠폰테스트 결과 0,1,2(실패)
								  ) throws Exception {
		
		
		String amt = (String)request.get("Amt");
		boolean paySuccess = false;
		
		if(amt.equals("0")) { //결제 0인경우
			if(!seatTest || couponTest==2) { //둘중 하나라도 실패시   
				paySuccess = false;
			}else {
				paySuccess = true;
			}
			
		}else { //결제금액있는경우
			/*
			****************************************************************************************
			* <인증 결과 파라미터>
			****************************************************************************************
			*/
			
			String authResultCode 	= (String)request.get("AuthResultCode"); 	// 인증결과 : 0000(성공)

			if(!seatTest || couponTest==2) { //둘중 하나라도 실패시   
				authResultCode = null;
			}
			
			String authResultMsg 	= (String)request.get("AuthResultMsg"); 	// 인증결과 메시지
			String nextAppURL 		= (String)request.get("NextAppURL"); 		// 승인 요청 URL
			String txTid 			= (String)request.get("TxTid"); 			// 거래 ID
			String authToken 		= (String)request.get("AuthToken"); 		// 인증 TOKEN
			String payMethod 		= (String)request.get("PayMethod"); 		// 결제수단
			String mid 				= (String)request.get("MID"); 				// 상점 아이디
			String moid 			= (String)request.get("Moid"); 			// 상점 주문번호
			 				// 결제 금액o
			String reqReserved 		= (String)request.get("ReqReserved"); 		// 상점 예약필드
			String netCancelURL 	= (String)request.get("NetCancelURL"); 	// 망취소 요청 URL
			//String authSignature = (String)request.getParameter("Signature");			// Nicepay에서 내려준 응답값의 무결성 검증 Data
			

			/*  
			****************************************************************************************
			* Signature : 요청 데이터에 대한 무결성 검증을 위해 전달하는 파라미터로 허위 결제 요청 등 결제 및 보안 관련 이슈가 발생할 만한 요소를 방지하기 위해 연동 시 사용하시기 바라며 
			* 위변조 검증 미사용으로 인해 발생하는 이슈는 당사의 책임이 없음 참고하시기 바랍니다.
			****************************************************************************************
			 */
			DataEncrypt sha256Enc 	= new DataEncrypt();
			String merchantKey 		= "EYzu8jGGMfqaDEp76gSckuvnaHHu+bC4opsSN6lHv3b2lurNYkVXrZ7Z1AoqQnXI3eLuaUFyoRNC6FkrzVjceg=="; // 상점키
			
			//인증 응답 Signature = hex(sha256(AuthToken + MID + Amt + MerchantKey)
			//String authComparisonSignature = sha256Enc.encrypt(authToken + mid + amt + merchantKey);

			/*
			****************************************************************************************
			* <승인 결과 파라미터 정의>
			* 샘플페이지에서는 승인 결과 파라미터 중 일부만 예시되어 있으며, 
			* 추가적으로 사용하실 파라미터는 연동메뉴얼을 참고하세요.
			****************************************************************************************
			*/
			String ResultCode 	= ""; String ResultMsg 	= ""; String PayMethod 	= "";
			String GoodsName 	= ""; String Amt 		= ""; String TID 		= ""; 
			//String Signature = ""; String paySignature = "";


			/*
			****************************************************************************************
			* <인증 결과 성공시 승인 진행>
			****************************************************************************************
			*/
			
			String resultJsonStr = "";
			if(authResultCode.equals("0000") /*&& authSignature.equals(authComparisonSignature)*/){
				/*
				****************************************************************************************
				* <해쉬암호화> (수정하지 마세요)
				* SHA-256 해쉬암호화는 거래 위변조를 막기위한 방법입니다. 
				****************************************************************************************
				*/
				String ediDate			= getyyyyMMddHHmmss();
				String signData 		= sha256Enc.encrypt(authToken + mid + amt + ediDate + merchantKey);

				/*
				****************************************************************************************
				* <승인 요청>
				* 승인에 필요한 데이터 생성 후 server to server 통신을 통해 승인 처리 합니다.
				****************************************************************************************
				*/
				StringBuffer requestData = new StringBuffer();
				requestData.append("TID=").append(txTid).append("&");
				requestData.append("AuthToken=").append(authToken).append("&");
				requestData.append("MID=").append(mid).append("&");
				requestData.append("Amt=").append(amt).append("&");
				requestData.append("EdiDate=").append(ediDate).append("&");
				requestData.append("CharSet=").append("utf-8").append("&");
				requestData.append("SignData=").append(signData);

				resultJsonStr = connectToServer(requestData.toString(), nextAppURL);

				HashMap resultData = new HashMap();
				
				if("9999".equals(resultJsonStr)){
					/*
					*************************************************************************************
					* <망취소 요청>
					* 승인 통신중에 Exception 발생시 망취소 처리를 권고합니다.
					*************************************************************************************
					*/
					StringBuffer netCancelData = new StringBuffer();
					requestData.append("&").append("NetCancel=").append("1");
					String cancelResultJsonStr = connectToServer(requestData.toString(), netCancelURL);
					
					HashMap cancelResultData = jsonStringToHashMap(cancelResultJsonStr);
					ResultCode = (String)cancelResultData.get("ResultCode");
					ResultMsg = (String)cancelResultData.get("ResultMsg");
					/*Signature = (String)cancelResultData.get("Signature");
					String CancelAmt = (String)cancelResultData.get("CancelAmt");
					paySignature = sha256Enc.encrypt(TID + mid + CancelAmt + merchantKey);*/
				}else{
					resultData = jsonStringToHashMap(resultJsonStr);
					ResultCode 	= (String)resultData.get("ResultCode");	// 결과코드 (정상 결과코드:3001)
					ResultMsg 	= (String)resultData.get("ResultMsg");	// 결과메시지
					PayMethod 	= (String)resultData.get("PayMethod");	// 결제수단
					GoodsName   = (String)resultData.get("GoodsName");	// 상품명
					Amt       	= (String)resultData.get("Amt");		// 결제 금액
					TID       	= (String)resultData.get("TID");		// 거래번호
					// Signature : Nicepay에서 내려준 응답값의 무결성 검증 Data
					// 가맹점에서 무결성을 검증하는 로직을 구현하여야 합니다.
					/*Signature = (String)resultData.get("Signature");
					paySignature = sha256Enc.encrypt(TID + mid + Amt + merchantKey);*/
					
					/*
					*************************************************************************************
					* <결제 성공 여부 확인>
					*************************************************************************************
					*/
					if(PayMethod != null){
						if(PayMethod.equals("CARD")){
							if(ResultCode.equals("3001")) paySuccess = true; // 신용카드(정상 결과코드:3001)
						}else if(PayMethod.equals("BANK")){
							if(ResultCode.equals("4000")) paySuccess = true; // 계좌이체(정상 결과코드:4000)	
						}else if(PayMethod.equals("CELLPHONE")){
							if(ResultCode.equals("A000")) paySuccess = true; // 휴대폰(정상 결과코드:A000)	
						}else if(PayMethod.equals("VBANK")){
							if(ResultCode.equals("4100")) paySuccess = true; // 가상계좌(정상 결과코드:4100)
						}else if(PayMethod.equals("SSG_BANK")){
							if(ResultCode.equals("0000")) paySuccess = true; // SSG은행계좌(정상 결과코드:0000)
						}else if(PayMethod.equals("CMS_BANK")){
							if(ResultCode.equals("0000")) paySuccess = true; // 계좌간편결제(정상 결과코드:0000)
						}
					}
				}
			}else/*if(authSignature.equals(authComparisonSignature))*/{  //인증결과 실패시
				ResultCode 	= authResultCode; 	
				ResultMsg 	= authResultMsg;
			}/*else{
				System.out.println("인증 응답 Signature : " + authSignature);
				System.out.println("인증 생성 Signature : " + authComparisonSignature);
			}*/
		}
		log.debug("결제메소드 실행 결과 결제금액 : "+amt+"원, 결제결과 성공유무 : "+paySuccess);
		
		return paySuccess;
	}
		

	
	//결제 취소 나이스페이 API 
	//취소 성공시 true / 실패시 false
	//
	public boolean cancelPayment(Booking booking) throws Exception {
		
		
		boolean cancelResult = false;
		/*
		****************************************************************************************
		* <취소요청 파라미터>
		* 취소시 전달하는 파라미터입니다.
		* 샘플페이지에서는 기본(필수) 파라미터만 예시되어 있으며, 
		* 추가 가능한 옵션 파라미터는 연동메뉴얼을 참고하세요.
		****************************************************************************************
		*/
		String tid 					= booking.getCostTid();
								  //= (String)request.getParameter("TID");	// 거래 ID
		String cancelAmt 			= booking.getBookCost()+"";
								  //= (String)request.getParameter("CancelAmt");	// 취소금액
		String partialCancelCode 	=  "0";
								  //=(String)request.getParameter("PartialCancelCode"); 	// 부분취소여부
		String mid 					= merchantID;
								  //= "nicepay00m";	// 상점 ID
		String moid					= booking.getBookNo()+"";
								  //= "nicepay_api_3.0_test";	// 주문번호
		String cancelMsg 			= "고객요청";	// 취소사유
		
		/*
		****************************************************************************************
		* <해쉬암호화> (수정하지 마세요)
		* SHA-256 해쉬암호화는 거래 위변조를 막기위한 방법입니다. 
		****************************************************************************************
		*/
		DataEncrypt sha256Enc 	= new DataEncrypt();
		String merchantKey 		= "EYzu8jGGMfqaDEp76gSckuvnaHHu+bC4opsSN6lHv3b2lurNYkVXrZ7Z1AoqQnXI3eLuaUFyoRNC6FkrzVjceg=="; // 상점키
		String ediDate			= getyyyyMMddHHmmss();
		String signData 		= sha256Enc.encrypt(mid + cancelAmt + ediDate + merchantKey);
		
		/*
		****************************************************************************************
		* <취소 요청>
		* 취소에 필요한 데이터 생성 후 server to server 통신을 통해 취소 처리 합니다.
		* 취소 사유(CancelMsg) 와 같이 한글 텍스트가 필요한 파라미터는 euc-kr encoding 처리가 필요합니다.
		****************************************************************************************
		*/
		StringBuffer requestData = new StringBuffer();
		requestData.append("TID=").append(tid).append("&");
		requestData.append("MID=").append(mid).append("&");
		requestData.append("Moid=").append(moid).append("&");
		requestData.append("CancelAmt=").append(cancelAmt).append("&");
		requestData.append("CancelMsg=").append(URLEncoder.encode(cancelMsg, "euc-kr")).append("&");
		requestData.append("PartialCancelCode=").append(partialCancelCode).append("&");
		requestData.append("EdiDate=").append(ediDate).append("&");
		requestData.append("CharSet=").append("utf-8").append("&");
		requestData.append("SignData=").append(signData);
		String resultJsonStr = connectToServer(requestData.toString(), "https://pg-api.nicepay.co.kr/webapi/cancel_process.jsp");
		
		/*
		****************************************************************************************
		* <취소 결과 파라미터 정의>
		* 샘플페이지에서는 취소 결과 파라미터 중 일부만 예시되어 있으며, 
		* 추가적으로 사용하실 파라미터는 연동메뉴얼을 참고하세요.
		****************************************************************************************
		*/
		String ResultCode 	= ""; String ResultMsg 	= ""; String CancelAmt 	= "";
		String CancelDate 	= ""; String CancelTime = ""; String TID 		= ""; String Signature = "";
		
		/*  
		****************************************************************************************
		* Signature : 요청 데이터에 대한 무결성 검증을 위해 전달하는 파라미터로 허위 결제 요청 등 결제 및 보안 관련 이슈가 발생할 만한 요소를 방지하기 위해 연동 시 사용하시기 바라며 
		* 위변조 검증 미사용으로 인해 발생하는 이슈는 당사의 책임이 없음 참고하시기 바랍니다.
		****************************************************************************************
		 */
		//String Signature = ""; String cancelSignature = "";
		
		if("9999".equals(resultJsonStr)){
			ResultCode 	= "9999";
			ResultMsg	= "통신실패";
			cancelResult = false;
		}else{
			HashMap resultData = jsonStringToHashMap(resultJsonStr);
			ResultCode 	= (String)resultData.get("ResultCode");	// 결과코드 (취소성공: 2001, 취소성공(LGU 계좌이체):2211)
			ResultMsg 	= (String)resultData.get("ResultMsg");	// 결과메시지
			CancelAmt 	= (String)resultData.get("CancelAmt");	// 취소금액
			CancelDate 	= (String)resultData.get("CancelDate");	// 취소일
			CancelTime 	= (String)resultData.get("CancelTime");	// 취소시간
			TID 		= (String)resultData.get("TID");		// 거래아이디 TID
			//Signature       	= (String)resultData.get("Signature");
			//cancelSignature = sha256Enc.encrypt(TID + mid + CancelAmt + merchantKey);
			cancelResult = true;
		}
				
				
		return cancelResult;
	}

	
	
	
	
	
	
	//결제시 필요한 정보 암호화 메소드
	public final synchronized String getyyyyMMddHHmmss(){
		SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");
		return yyyyMMddHHmmss.format(new Date());
	}
	
	
	//server to server 통신
	public String connectToServer(String data, String reqUrl) throws Exception{
		HttpURLConnection conn 		= null;
		BufferedReader resultReader = null;
		PrintWriter pw 				= null;
		URL url 					= null;
		
		int statusCode = 0;
		StringBuffer recvBuffer = new StringBuffer();
		try{
			url = new URL(reqUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setConnectTimeout(15000);
			conn.setReadTimeout(25000);
			conn.setDoOutput(true);
			
			pw = new PrintWriter(conn.getOutputStream());
			pw.write(data);
			pw.flush();
			
			statusCode = conn.getResponseCode();
			resultReader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			for(String temp; (temp = resultReader.readLine()) != null;){
				recvBuffer.append(temp).append("\n");
			}
			
			if(!(statusCode == HttpURLConnection.HTTP_OK)){
				throw new Exception();
			}
			
			return recvBuffer.toString().trim();
		}catch (Exception e){
			return "9999";
		}finally{
			recvBuffer.setLength(0);
			
			try{
				if(resultReader != null){
					resultReader.close();
				}
			}catch(Exception ex){
				resultReader = null;
			}
			
			try{
				if(pw != null) {
					pw.close();
				}
			}catch(Exception ex){
				pw = null;
			}
			
			try{
				if(conn != null) {
					conn.disconnect();
				}
			}catch(Exception ex){
				conn = null;
			}
		}
	}

	//JSON String -> HashMap 변환
	private static HashMap jsonStringToHashMap(String str) throws Exception{
		HashMap dataMap = new HashMap();
		JSONParser parser = new JSONParser();
		try{
			Object obj = parser.parse(str);
			JSONObject jsonObject = (JSONObject)obj;

			Iterator<String> keyStr = jsonObject.keySet().iterator();
			while(keyStr.hasNext()){
				String key = keyStr.next();
				Object value = jsonObject.get(key);
				
				dataMap.put(key, value);
			}
		}catch(Exception e){
			
		}
		return dataMap;
	}

	
	
}
