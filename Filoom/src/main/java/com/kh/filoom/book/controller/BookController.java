package com.kh.filoom.book.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
	public String selectList(Model model, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if (loginUser != null) {
		    String birthDate = loginUser.getBirth();
		    System.out.println("사용자 생년월일: " + birthDate);
		}
		
		// 비로그인 상태 예외 처리
	    if (loginUser == null) {
	        return "redirect:/loginForm.me"; 
	        
	    }
	    
	    String birth = loginUser.getBirth(); 
	    int birthYear = Integer.parseInt(birth.substring(0, 4));
	    int currentYear = LocalDate.now().getYear();
	    int age = currentYear - birthYear;
	    
	    /*
		
		ArrayList<Movie> list = bookService.selectList();
		
		ArrayList<Movie> firstMovie = bookService.selectFirstMovie(); 
		
		model.addAttribute("list", list);
		
		model.addAttribute("firstMovie", firstMovie);
		
		//System.out.println(list);
		*/
	    
	    // 나이에 따라 적절한 메서드 호출
	    ArrayList<Movie> list;
	    ArrayList<Movie> firstMovie;

	    if (age >= 19) {
	        // 성인용 영화 리스트
	        list = bookService.selectList();
	        firstMovie = bookService.selectFirstMovie();
	    } else {
	        // 어린이용 영화 리스트
	        list = bookService.selectListKid();
	        firstMovie = bookService.selectFirstMovieKid();
	    }

	    // Model에 추가
	    model.addAttribute("list", list);
	    model.addAttribute("firstMovie", firstMovie);
	    
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
		
		System.out.println(seatId);
		System.out.println(playingNo);

		Calendar calendar = Calendar.getInstance();
	    calendar.setTime(currentDate);
	    calendar.add(Calendar.MINUTE, 1000);

	    Date updatedTime = calendar.getTime();
	    // System.out.println("10분 후 시간: " + updatedTime);
	    java.sql.Timestamp sqlUpdatedTime = new java.sql.Timestamp(updatedTime.getTime());
	    
	    BookingSeat bk = new BookingSeat();
	    
	    bk.setSeatId(seatId);
	    bk.setPlayingNo(playingNo);
	    bk.setTimeLimit(sqlUpdatedTime);
	    System.out.println("입력받은 bk :" + bk);
	 
	    int result = bookService.insertBookingSeat(bk);
	    //System.out.println("Insert 결과: " + result);

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
	public String movieSearch(HttpSession session, String searchMovieKeyword, Model model) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		ArrayList<Movie> firstMovie;
	    ArrayList<Movie> list;

	    if (loginUser != null) {
	        String birth = loginUser.getBirth(); // 생년월일 가져오기
	        int birthYear = Integer.parseInt(birth.substring(0, 4));
	        int currentYear = LocalDate.now().getYear();
	        int age = currentYear - birthYear;

	        map.put("searchMovieKeyword", searchMovieKeyword);

	        // 나이에 따라 적절한 메서드 호출
	        if (age >= 19) {
	            // 성인용 영화 검색
	            firstMovie = bookService.selectSearchFirstMovie(map);
	            list = bookService.movieSearch(map);
	        } else {
	            // 어린이용 영화 검색
	            firstMovie = bookService.selectSearchFirstMovieKid(map);
	            list = bookService.movieSearchKid(map);
	        }
	    } else {
	    	
	        return "redirect:/loginForm.me";
	        
	    }
	    
	    
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
		
		
		//==쿠폰있는경우==
		if(!couponNos.isEmpty()) {
			int couponResult = bookService.selectCheckCoupon(couponNos,userNo);
			
			log.debug("쿠폰 유효성 , 사용가능한 쿠폰 수 : " +couponResult);
			
			if(couponResult == couponNos.size()) {// 유효성테스트 통과
				
				//쿠폰에 북넘버 추가 하기 (처리행갯수)
				//int result = bookService.setCouponBookNo(couponNos,userNo,bookNo);
				
				log.debug("[중지]쿠폰에 bookNo 추가하기 - 처리된행의갯수 : "/* + result */);
				
			}else { //유효성 테스트 실패
				session.setAttribute("alertMsg", "[CouponError] 잘못된 접근입니다. ");
				
				//북넘버 제거하기
				int deleteResult = bookService.deleteBookNo(bookNo,userNo);
				log.debug("쿠폰유효성테스트실패 : 북넘버 제거 행갯수 " +deleteResult);
				
				return "redirect:/";
			}
			
		}
		
		
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

	
	
	
	//결제시 필요한 정보 암호화 메소드
	public final synchronized String getyyyyMMddHHmmss(){
		SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");
		return yyyyMMddHHmmss.format(new Date());
	}
	
	
	//결제 처리후 화면 띄어주기
	@PostMapping(value="payResult.pm")
	public String PaymentResult(ModelAndView mv,@RequestParam Map<String, String> request) throws Exception {
		
		//여기서는 유효성 검사 하기
		//좌석, 
		
		
		
		
		if(request.get("AuthResultCode")==null) { //결제금액이 0원인 경우
			log.debug("결제금액이 없는 경우");
		}else { //결제 금액이 있을경우
			log.debug("결제금액이 있는경우");

			
			/*
			****************************************************************************************
			* <인증 결과 파라미터>
			****************************************************************************************
			*/
			
			
			String authResultCode 	= (String)request.get("AuthResultCode"); 	// 인증결과 : 0000(성공)
			String authResultMsg 	= (String)request.get("AuthResultMsg"); 	// 인증결과 메시지
			String nextAppURL 		= (String)request.get("NextAppURL"); 		// 승인 요청 URL
			String txTid 			= (String)request.get("TxTid"); 			// 거래 ID
			String authToken 		= (String)request.get("AuthToken"); 		// 인증 TOKEN
			String payMethod 		= (String)request.get("PayMethod"); 		// 결제수단
			String mid 				= (String)request.get("MID"); 				// 상점 아이디
			String moid 			= (String)request.get("Moid"); 			// 상점 주문번호
			String amt 				= (String)request.get("Amt"); 				// 결제 금액
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
				boolean paySuccess = false;
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
			}else/*if(authSignature.equals(authComparisonSignature))*/{
				ResultCode 	= authResultCode; 	
				ResultMsg 	= authResultMsg;
			}/*else{
				System.out.println("인증 응답 Signature : " + authSignature);
				System.out.println("인증 생성 Signature : " + authComparisonSignature);
			}*/
		}
		
		
		
		
		
		
		
		return "book/paymentResult";
		//return "book/payResult_utf";

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
