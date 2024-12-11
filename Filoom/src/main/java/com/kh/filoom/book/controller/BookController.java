package com.kh.filoom.book.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PostMapping;


import com.google.gson.Gson;
import com.kh.filoom.book.model.service.BookService;
import com.kh.filoom.book.model.vo.Playing;
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
	
	@GetMapping("movieDetail")
	public String getMovieDetail(@RequestParam("movieNo") int movieNo, Model model) {
		
		ArrayList<Movie> list = bookService.selectList();
		
		Movie movie = bookService.selectMovie(movieNo);
		
		model.addAttribute("movie", movie);
		model.addAttribute("list", list);
		
		//System.out.println(list);
		//System.out.println(movie);
		
		return "book/book";
	}
	
	@ResponseBody
	@GetMapping(value="book.ca", produces="application/json; charset=UTF-8")
	public String selectMovieDate(int movieNum) {
		
		ArrayList<Playing> list = bookService.selectMovieDate(movieNum);
		
		//System.out.println(list);
		
		return new Gson().toJson(list);
		
	}
	
	
	
	
	//결제 테스트
	@GetMapping("test.pm")
	public String PaymentTest() {
		
		System.out.println("잘되나 ?");
		return "book/payRequest_utf";

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
