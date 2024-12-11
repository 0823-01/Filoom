package com.kh.filoom.movie.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

public class MovieController {
	
	// private MovieServiceImpl msi;
	
	// == 사용자 페이지 ==
	// 목록, 페이징 처리 필요
	@GetMapping("boxoffice.mo")
	public String viewBoxOffice(ModelAndView mv) {		
		return "movie/boxOffice";
	}
	
	// 상영 중만 보기
	public void viewOpenedOnly() {
		
	}
	
	// 개봉순 정렬 (상영작만)
	public void listByOpenedOrder() {
		
	}
	
	// 평점순 정렬 (상영작만)
	public void listByCritics() {
		
	}
	
	// 가나다순 정렬
	public void listByName() {
		
	}
	
	// 상영 예정작만 보기
	public void viewNotOpened() {
		
	}
	
	// 영화 상세 페이지
	// specific.mo?movieNo=XXX
	public void selectMovie() {
		
	}
	
	// 영화 상세 정보 보기 (스틸컷까지만)
	public void showDetail() {
		
	}
	
	// 리뷰 목록 조회 (+ 페이징 처리) (AJAX 예상)
	public void selectReview() {
		
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
	// "admin/movielist.mo"
	public void selectMovieList() {
		
	}
	
	// 영화 추가 화면으로 이동
	@GetMapping("newmovie.mo")
	public String addMovieForm() {
		System.out.println("NOW LOADING >>>");
		return "admin/movie/addMovie";
	}
	
	// 영화 추가 / 도메인 미확정
	@PostMapping("admin.insertmovie.mo")
	public void addMovie() {
		
	}
	
	// 영화 수정 화면으로 이동
	public void modifyMovie() {
		
	}
	
	// 영화 수정 / 도메인 미확정
	@PostMapping("admin.modifymovie.mo")
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
	
	// -- 여기부터 상세>이미지 관리 화면
	public void showImageList() {
		
	}
	
	public void addImage() {
		
	}
	
	public void updateImage() {
		
	}
	
	public void deleteImage() {
		
	}
	
	// (관리자) 리뷰 목록 확인 (+ 페이징 처리)
	public void reviewPatrol() {
		
	}
	
	// 관리자가 리뷰 삭제 (목록에서 해당 리뷰 상단의 '-' 버튼을 눌렀을 때)
	public void adminDeleteReview() {
		
	}
	
}
