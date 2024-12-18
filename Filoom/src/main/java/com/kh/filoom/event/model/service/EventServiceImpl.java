package com.kh.filoom.event.model.service;

import java.util.ArrayList;

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
	

	// 댓글
	/**
	 * 241217 한혜원 
	 * 사용자 댓글 목록조회 요청 메소드
	 */
	@Override
	public ArrayList<Reply> selectReplyList(int eventNo) {
		return eventDao.selectReplyList(sqlSession, eventNo);
	}
	
	/**
	 *
	 
	public boolean checkIfReplyExists(int eventNo, String userNo) {
		return eventDao.checkIfReplyExists(eventNo, userNo) > 0;
	} */

	/**
	 * 241217 한혜원 
	 * 댓글 작성용 요청 메소드 
	 */
	@Override
	@Transactional
	public int insertReply(Reply r) {
		return eventDao.insertReply(sqlSession, r);
	}

	/**
	 * 241217 한혜원
	 * 댓글 수정용 요청 메소드 
	 *
	 */
	@Override
	@Transactional
	public int updateReply(Reply r) {
		return eventDao.updateReply(sqlSession, r);
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
