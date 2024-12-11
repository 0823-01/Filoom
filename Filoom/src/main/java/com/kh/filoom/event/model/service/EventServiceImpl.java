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

	@Override
	public ArrayList<Event> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Event selectEvent(int EventNo) {
		// TODO Auto-generated method stub
		return null;
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
