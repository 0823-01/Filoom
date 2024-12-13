package com.kh.filoom.event.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.filoom.event.model.vo.Event;
import com.kh.filoom.event.model.vo.EventAttachment;
import com.kh.filoom.event.model.vo.Reply;

public interface EventService {

	// 사용자 
	// 게시판 리스트조회 서비스 -> 관리자 페이지에서만 사용 
	// 게시글 총 갯수 조회 
	int selectListCount();
	
	// 전체 이벤트 게시글 목록 조회 
	ArrayList<Event> selectList();
	
	// 이벤트 종료 여부에 따른 목록 조회 
	ArrayList<Event> selectFilterList(String eventStatus);
	
	// 이벤트 게시글 상세조회 서비스 
	Event selectEvent(int EventNo);
	
	// 이벤트 게시글 첨부파일 상세조회 서비스 
	ArrayList<EventAttachment> selectEventAttachment(int eventNo); 
	
	// 댓글 리스트 조회 서비스 (Ajax) 
	ArrayList<Reply> selectReplyList(int eventNo);
	
	// 댓글 작성 서비스 (Ajax)
	int insetReply(Reply r);
	
	// 댓글 수정 서비스 (Ajax) 
	int updateReply(Reply r);
	
	// 댓글 삭제 서비스 (Ajax) 
	int deleteReply(int replyNo);
	
	
	// 관리자
	// 게시글 작성하기 서비스
	int insertEvent(Event e);
	
	// 이미지 등록하기 서비스 
	int insertEventAttachment(EventAttachment eventAttachment);
	
	// 게시글 수정하기 서비스 
	int updateEvent(Event e);
	
	// 게시글 삭제 서비스 
	int updateEvevnt(Event e);
	
	
	
	
	
	
}
