package com.kh.filoom.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.filoom.book.model.service.BookService;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;
	
	@GetMapping("book.do")
	public String selectList() {
		
		
		return "book/book";
		
	}
	
	
	@GetMapping("book.ao")
	public String Test() {
		
		return "book/calender";
		
	}
	
	
}
