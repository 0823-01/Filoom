package com.kh.filoom.event.model.service;

import java.util.ArrayList;

import com.kh.filoom.event.model.vo.Event;
import com.kh.filoom.event.model.vo.EventAttachment;
import com.kh.filoom.event.model.vo.Reply;

public interface EventService {

	// 사용자
	// 게시판 리스조회 서비스 
	// 게시글 총 갯수 조회 
	int selectListCount();
	
	// 게시글 목록조회 
	ArrayList<Event> selectList();
	
	// 게시글 상세조회 서비스 
	Event selectEvent(int EventNo);
	
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
