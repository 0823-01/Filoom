package com.kh.filoom.event.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.filoom.common.model.vo.PageInfo;
import com.kh.filoom.event.model.dao.EventDao;
import com.kh.filoom.event.model.vo.Event;
import com.kh.filoom.event.model.vo.EventAttachment;
import com.kh.filoom.event.model.vo.Reply;

/**
 * @author user1
 *
 */
@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Autowired
	private EventDao eventDao;
	
	
	/**
	 * 241218 한혜원
	 * 사용자 게시글 추천이벤트 목록조회 요청 메소드 
	 */
	@Override
	public List<Event> selectHotEventList() {
		return eventDao.selectHotEventList(sqlSession);
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
	 * 241218 한혜원 
	 * 댓글 총 갯수 
	 */
	@Override
	public int seletReplyListCount(int eventNo) {
		return eventDao.selectReplyListCount(sqlSession, eventNo);
	}
	
	
	
	/**
	 * 241217 한혜원 
	 * 사용자 댓글 목록조회 요청 메소드
	 */
	@Override
	public ArrayList<Reply> selectReplyList(int eventNo, PageInfo pi) {
		return eventDao.selectReplyList(sqlSession, eventNo, pi);
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

	/**
	 * 241218 한혜원
	 * 댓글 삭제용 요청 메소드
	 */
	@Override
	@Transactional
	public int deleteReply(int replyNo) {
		return eventDao.deleteReply(sqlSession, replyNo);
	}

	
	// 관리자 --------------------------------------------------------------------------------
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
	
	/**
	 * 241218 한혜원 
	 * 관리자용 게시글 총 갯수
	 */
	@Override
	public int selectListCount() {
		return eventDao.selectListCount(sqlSession);
	}

	
	/**
	 * 241218 한혜원
	 * 관리자용 게시글 목록 리스트 조회 
	 */
	@Override
	public ArrayList<Event> adminSelectList(PageInfo pi) {
		return eventDao.adminSelectList(sqlSession, pi);
	}
	
	
	/**
	 * 241218 한혜원
	 * 관리자용 게시글 상세조회 
	 */
	@Override
	public Event adminSelectEvent(int eventNo) {
		return eventDao.adminSelectEvent(sqlSession, eventNo);
	}
	
	/**
	 * 241218 한혜원
	 * 관리자용 게시글 첨부파일 상세조회
	 */
	@Override
	public ArrayList<EventAttachment> adminSelectEventAttachment(int eventNo) {
		return eventDao.adminSelectEventAttachment(sqlSession, eventNo);
	}

	@Override
	public int updateEvent(Event e) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteEvevnt(Event e) {
		// TODO Auto-generated method stub
		return 0;
	}


	
	
	

	
}
