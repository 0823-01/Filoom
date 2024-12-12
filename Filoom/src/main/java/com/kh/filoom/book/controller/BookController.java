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
	
	
	
}
