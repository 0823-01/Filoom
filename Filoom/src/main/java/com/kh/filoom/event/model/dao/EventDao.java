package com.kh.filoom.event.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.filoom.event.model.vo.Event;
import com.kh.filoom.event.model.vo.EventAttachment;

@Repository
public class EventDao {	
	
	
	// 사용자
	
	/**
	 * 241212 한혜원
	 * 게시글 목록 요청 메소드 -- 페이징처리 안해도 됨
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Event> selectList(SqlSessionTemplate sqlSession) {
		// select문 여러행 : selectList 메소드 
		return (ArrayList)sqlSession.selectList("eventMapper.selectList");
	}

	
	
	
	
	
	
	
	
	
	
	// 관리자용
	
	/**
	 * 241211 한혜원 
	 * 관리자용 이벤트 게시글 작성용 처리 메소드 
	 * @param sqlSession
	 * @param e => event 객체 
	 * @return
	 */
	public int insertEvent(SqlSessionTemplate sqlSession, Event e) {
		
		return sqlSession.insert("eventMapper.insertEvent", e); // 게시글 저장 
	}

	
	/**
	 * 241211 한혜원 
	 * 관리자용 이벤트 게시글 첨부파일 등록 메소드 
	 * @param sqlSession
	 * @param eventAttachment
	 * @return
	 */
	public int insertEventAttachment(SqlSessionTemplate sqlSession, EventAttachment eventAttachment) {
		return sqlSession.insert("eventMapper.insertEventAttachment", eventAttachment); // 첨부파일 저장
	}

	
}
