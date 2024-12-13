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
	 * 이벤트 종료여부 상관없이 전체 목록 조회
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Event> selectList(SqlSessionTemplate sqlSession) {
		// select문 여러행 : selectList 메소드 
		return (ArrayList)sqlSession.selectList("eventMapper.selectList");
	}
	
	/**
	 * 241213 한혜원 
	 * 게시글 목록 요청 메소드 - 페이징 처리  x
	 * 이벤트 종료 여부에 따른 목록조회
	 * @param sqlSession
	 * @param eventStatus 이벤트 종료여부 상태값
	 * @return
	 */
	public ArrayList<Event> selectFilterList(SqlSessionTemplate sqlSession, String eventStatus) {
		
		return (ArrayList)sqlSession.selectList("eventMapper.selectFilterlist", eventStatus);
	}
	
	
	/**
	 * 241213 한혜원
	 * 게시글 상세조회 요청 메소드
	 * @param sqlSession
	 * @param eventNo 게시글 번호 
	 * @return
	 */
	public Event selectEvent(SqlSessionTemplate sqlSession, int eventNo) {
		// 단일행 select문 : selectOne
		
		return sqlSession.selectOne("eventMapper.selectEvent", eventNo);
	}

	
	/**
	 * 241213 한혜원
	 * 게시글 첨부파일 상세조회 요청 메소드
	 * @param sqlSession
	 * @param eventNo 게시글 번호
	 * @return
	 */
	public ArrayList<EventAttachment> selectEventAttachment(SqlSessionTemplate sqlSession, int eventNo) {
		// 여러행 select문 : selectList
		
		return (ArrayList)sqlSession.selectList("eventMapper.selectEventAttachment", eventNo);
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
