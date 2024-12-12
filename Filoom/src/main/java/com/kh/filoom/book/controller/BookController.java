package com.kh.filoom.book.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.filoom.book.model.service.BookService;
import com.kh.filoom.book.model.vo.BookingSeat;
import com.kh.filoom.book.model.vo.Playing;
import com.kh.filoom.book.payment.DataEncrypt;
import com.kh.filoom.member.model.vo.Member;
import com.kh.filoom.movie.model.vo.Movie;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;
	
	

	
	
	
	
	
	
	
	@GetMapping("book.do")
	public String selectList(Model model) {
		
		ArrayList<Movie> list = bookService.selectList();
		
		model.addAttribute("list", list);
		
		//System.out.println(list);
		
		return "book/book";
		
	}
	
	
	@ResponseBody
	@GetMapping(value = "movie.de", produces="application/json; charset=UTF-8")
	public Movie getMovieDetail(@RequestParam("movieNo") int movieNo, Model model) {
		
		//System.out.println(movieNo);
		
		Movie movie = bookService.selectMovie(movieNo);
		
		model.addAttribute("movie", movie);
		
		//System.out.println(movie);
		
		return movie;
	}
	
	@ResponseBody
	@GetMapping(value="book.ca", produces="application/json; charset=UTF-8")
	public String selectMovieDate(int movieNum) {
		
		// System.out.println(movieNum);
		
		ArrayList<Playing> list = bookService.selectMovieDate(movieNum);
		
		//System.out.println(list);
		
		return new Gson().toJson(list);
		
	}
	
	@ResponseBody
	@GetMapping(value="book.se", produces="application/json; charset=UTF-8")
	public String selectMovieSeat(int playingNo) {
		
		ArrayList<BookingSeat> list = bookService.selectMovieSeat(playingNo);
		
		// System.out.println(list);
		
		
		return new Gson().toJson(list);
		
	}
	
	@ResponseBody
	@GetMapping(value="book.fb", produces="application/json; charset=UTF-8")
	public String insertBookingSeat(BookingSeat bk, HttpSession session, Model model) {
		
		//System.out.println(seatId);
		//System.out.println(playingNo);
		
		int result = bookService.insertBookingSeat(bk);
		
		
		return new Gson().toJson(bk);
	}
	
	@ResponseBody
	@GetMapping(value="book.fd", produces="application/json; charset=UTF-8")
	public String deleteBookingSeat(BookingSeat bk, HttpSession session, Model model) {
		
		//System.out.println(seatId);
		//System.out.println(playingNo);
		int result = bookService.deleteBookingSeat(bk);
		
		
		return new Gson().toJson(bk);
	}
	
	@ResponseBody
	@PostMapping(value="pay.ao", produces="application/json; charset=UTF-8")
	public String pay(int playingNo, int selectedSeats) {
	
		System.out.println(playingNo);
		System.out.println(selectedSeats);
			
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//형문/////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	
	@Autowired
	private DataEncrypt sha256Enc;
	@Autowired
	private ArrayList<BookingSeat> bookingSeatList;
	

	
	//결제 테스트
	@GetMapping("paymentForm.pm")
	public ModelAndView PaymentTest(ModelAndView mv) {
		
		System.out.println("결제폼 요청");
		


		
		
		
		
		
		
		
		
		//결제에 필요한 정보들.
		String merchantKey 		= "EYzu8jGGMfqaDEp76gSckuvnaHHu+bC4opsSN6lHv3b2lurNYkVXrZ7Z1AoqQnXI3eLuaUFyoRNC6FkrzVjceg=="; // 상점키
		String merchantID 		= "nicepay00m"; 				// 상점아이디
		
		String goodsName 		= "조커 20241225 14:00 3관 c1,c2"; 					// 결제상품명
		String price 			= "30000"; 						// 결제상품금액	
		String buyerName 		= "김형문"; 						// 구매자명
		String buyerTel 		= "01097735429"; 				// 구매자연락처
		String buyerEmail 		= "happy@day.co.kr"; 			// 구매자메일주소
		String moid 			= "0"; 			// 상품주문번호(예매번호)	

		//수정 x
		/* DataEncrypt sha256Enc = new DataEncrypt(); */
		
		
		String ediDate 			= getyyyyMMddHHmmss();	
		String hashString 		= sha256Enc.encrypt(ediDate + merchantID + price + merchantKey);

		
		mv.setViewName("book/paymentForm");
		
		
		System.out.println(ediDate );
		System.out.println(hashString);
		return mv;

	}
	
	
	
	
	public final synchronized String getyyyyMMddHHmmss(){
		SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");
		return yyyyMMddHHmmss.format(new Date());
	}
	


	
	
	
	
	
	///filoom/Resulttest.pm
	//결제후 화면 테스트
	@PostMapping("ResultTest.pm")
	public String PaymentResultTest(String Amt) {
		
		System.out.println("잘되나 ? 결제휴");
		System.out.println(Amt);
		return "book/paymentResult";

	}
}
