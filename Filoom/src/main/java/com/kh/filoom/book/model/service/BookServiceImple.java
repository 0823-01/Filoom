package com.kh.filoom.book.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.filoom.book.model.dao.BookDao;

@Service
public class BookServiceImple implements BookService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BookDao bookDao;

	
}
