package com.kh.filoom.book.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.filoom.movie.model.vo.Movie;

@Repository
public class BookDao {

	public ArrayList<Movie> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("movieMapper.selectList");
	}

}
