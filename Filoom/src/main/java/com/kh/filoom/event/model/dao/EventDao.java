package com.kh.filoom.event.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.filoom.common.model.vo.PageInfo;
import com.kh.filoom.event.model.vo.Event;
import com.kh.filoom.event.model.vo.EventAttachment;
import com.kh.filoom.event.model.vo.Reply;

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
	
	// 댓글 
	/**
	 * 241217 한혜원
	 * 댓글 목록 조회용 
	 * @param sqlSession
	 * @param eventNo 게시글 번호
	 * @return
	 */
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int eventNo) {
		// select문(여러행) : selectList 메소드 
		return (ArrayList)sqlSession.selectList("eventMapper.selectReplyList", eventNo);
	}
	
	
	/**
	 * 241217 한혜원 
	 * 댓글 작성여부 체크
	 * @param eventNo
	 * @param userNo
	 * @return
	 
	public int checkIfReplyExists(SqlSessionTemplate sqlSession, int eventNo, String replyWriter) {
		// select 문(단행) : selectOne 메소드 
		return sqlSession.selectOne("eventMappter.selectCheckReply", eventNo, replyWriter);
	} */
	
	/**
	 * 241217 한혜원
	 * 댓글 작성용 
	 * @param sqlSession
	 * @param r 댓글 객체 
	 * @return
	 */
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		// insert문 : insert 메소드 
		return sqlSession.insert("eventMapper.insertReply", r);
	}
	
	/**
	 * 241217 한혜원
	 * 댓글 수정용
	 * @param sqlSession
	 * @param r
	 * @return
	 */
	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		// update문 : update 메소드 
		return sqlSession.update("eventMapper.updateReply", r);
	}
	
	/**
	 * 241218 한혜원
	 * 댓글 삭제용
	 * @param sqlSession
	 * @param replyNo
	 * @return
	 */
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		// update문 : update 메소드 
		return sqlSession.update("eventMapper.deleteReply", replyNo);
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

	/**
	 * 241218 한혜원
	 * 관리자용 게시글 총 갯수
	 * @param sqlSession
	 * @return
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		// 단일행 select문 
		return sqlSession.selectOne("eventMapper.selectListCount");
	}

	/**
	 * 241218 한혜원
	 * 관리자용 게시글 목록조회
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Event> adminSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// 여러행 select문 
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("eventMapper.adminSelectList", null, rowBounds);
	}

	/**
	 * 241218 한혜원
	 * 관리자용 게시글 상세조회
	 * @param sqlSession
	 * @param eno
	 * @return
	 */
	public Event adminSelectEvent(SqlSessionTemplate sqlSession, int eventNo) {
		// select문 단행 
		return sqlSession.selectOne("eventMapper.adminSelectEvent", eventNo);
	}

	/**
	 * 241218 한혜원
	 * 관리자 게시글 첨부파일 상세조회
	 * @param sqlSession
	 * @param eventNo
	 * @return
	 */
	public ArrayList<EventAttachment> adminSelectEventAttachment(SqlSessionTemplate sqlSession, int eventNo) {
		// 여러행 select문 
		return (ArrayList)sqlSession.selectList("eventMapper.adminSelectEventAttachment", eventNo);
	}
	
}
