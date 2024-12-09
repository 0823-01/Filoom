package com.kh.filoom.movie.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

public class MovieController {
	
	// 목록, 페이징 처리 필요
	@GetMapping("boxoffice.mo")
	public String viewBoxOffice() {
		return "movie/boxoffice";
	}
	
	// 상영 예정작만 보기
	public void viewNotOpened() {
		
	}
	
	// 영화 상세 페이지 + 리뷰 목록 조회 (+ 페이징 처리)
	public void showDetail() {
		
	}
	
	
	// 리뷰 작성 페이지
	public void reviewForm() {
		
	}
	
	// 작성
	public void writeReview() {
		
	}
	
	// 수정
	public void updateReview() {
		
	}
	
	// 삭제
	public void deleteReview() {
		
	}
	
	
	
	// === 관리자 메뉴 === : admin 폴더를 따로 만들 경우 그쪽으로 옮길 예정
	public void insertMovie() {
		
	}
	
	public void modifyMovie() {
		
	}
	
	public void deleteMovie() {
		
	}
	
	// (관리자) 영화 관리 상세 - 페이지 띄우기
	public void movieManage() {
		
	}
	
	// (관리자) 상영 여부 변경
	public void togglePremiere() {
		
	}
	
	// 상영 정보 추가
	public void newRunInfo() {
		
	}
	
	// 상영 정보 제거
	public void removeRunInfo() {
		
	}
	
	// (관리자) 리뷰 목록 확인 (+ 페이징 처리)
	public void reviewPatrol() {
		
	}
	
	public void adminDeleteReview() {
		
	}
	
}
