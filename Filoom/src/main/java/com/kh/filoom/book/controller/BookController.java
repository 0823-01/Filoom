package com.kh.filoom.book.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.filoom.book.model.service.BookService;
import com.kh.filoom.movie.model.vo.Movie;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;
	
	@GetMapping("book.do")
	public String selectList(Model model) {
		
		ArrayList<Movie> list = bookService.selectList();
		
		model.addAttribute("list", list);
		
		System.out.println(list);
		
		return "book/book";
		
	}
	
	
	@GetMapping("book.ao")
	public String Test() {
		
		return "book/calender";
		
	}
	
	
}
