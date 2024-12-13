package com.kh.filoom.event.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.filoom.event.model.dao.EventDao;
import com.kh.filoom.event.model.vo.Event;
import com.kh.filoom.event.model.vo.EventAttachment;
import com.kh.filoom.event.model.vo.Reply;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EventDao eventDao;
	
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	/**
	 * 241212 ~ 241213 한혜원
	 * 사용자 게시글 목록조회 요청 메소드 
	 * 페이징처리 필요없음 
	 * 전체 이벤트 조회 (종료여부 y, n 모두)
	 */
	@Override
	public ArrayList<Event> selectList() {
		return eventDao.selectList(sqlSession);
	}
	
	/**
	 *241212 ~ 241213 한혜원
	 * 사용자 게시글 목록조회 요청 메소드 
	 * 페이징처리 필요없음 
	 * 종료여부에 따른 필터링된 목록 조회 (종료여부 y, n)
	 */
	@Override
	public ArrayList<Event> selectFilterList(String eventStatus) {
		return eventDao.selectFilterList(sqlSession, eventStatus);
	}

	/**
	 * 241213 한혜원 
	 * 사용자 게시글 상세조회 요청 메소드
	 * 조회수 필요없음
	 */
	@Override
	public Event selectEvent(int eventNo) {
		
		return eventDao.selectEvent(sqlSession, eventNo);
	}
	
	/**
	 * 241213 한혜원 
	 * 사용자 게시글 첨부파일 상세조회 요청 메소드
	 * 조회수 필요없음
	 */
	@Override
	public ArrayList<EventAttachment> selectEventAttachment(int eventNo) {
		
		return eventDao.selectEventAttachment(sqlSession, eventNo);
	}
	
	
	
	
	

	@Override
	public ArrayList<Reply> selectReplyList(int eventNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insetReply(Reply r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReply(Reply r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(int replyNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	/**
	 * 241211 한혜원 
	 * 관리자용 게시글 작성 메소드 
	 */
	@Override
	@Transactional
	public int insertEvent(Event e) {
		return eventDao.insertEvent(sqlSession, e); // 게시글 저장
		
	}

	/**
	 * 241211 한혜원 
	 * 관리자용 첨부파일 등록 메소드 
	 */
	@Override
	@Transactional
	public int insertEventAttachment(EventAttachment eventAttachment) {
		return eventDao.insertEventAttachment(sqlSession, eventAttachment); // 첨부파일저장
	}

	@Override
	public int updateEvent(Event e) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateEvevnt(Event e) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	

	
}
