package com.kh.filoom.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.filoom.common.model.vo.PageInfo;
import com.kh.filoom.common.template.Pagination;
import com.kh.filoom.movie.model.service.MovieServiceImpl;
import com.kh.filoom.movie.model.vo.Movie;

/**
 * @author 정원섭
 * === MovieController v 0.3 ===
 * 작업 착수일 : 2024-12-13
 * 최종 수정일 : 2024-12-19
 */

/* 작업 내역
 * v 0.1 - 틀 잡기
 * v 0.2 - 영화 목록 출력 (평점순 제외)
 * v 0.3 - 검색을 제외한 각 영화 목록에 페이징바 추가
 * 
 * */
@Controller
public class MovieController {
	
	@Autowired
	private MovieServiceImpl msi;
	
	// 페이징 처리용 변수 (현재 페이징처리 쓰는 모든 곳에서 값 동일)
	private int pgLimit = 10;
	
	/* select4랑 select16을 따로 나눠야 할 듯
	 * 그래야 4개만 출력할 때랑 16개 출력할 때를 구분해서 넣지
	 */
	
	// == 사용자 페이지 ==
	@GetMapping("movies.mo")
	public String viewMovieSelectTop(Model model) {
		// premiere = 'y'인 쪽에서 movie_no 역순으로 4편
		ArrayList<Movie> now = msi.selectNow4();
		
		// premiere = 'n'인 쪽에서 open_date 빠른 순으로 4편
		ArrayList<Movie> pre = msi.selectPre4();
		
		model.addAttribute("now",now);
		model.addAttribute("pre",pre);
		return "movie/movieSelectTop";
	}
	
	// 박스오피스 페이지
	@GetMapping("boxoffice.mo")
	public String viewBoxOfficePage() {
		return "movie/boxOffice";
	}
	
	
	// 박스오피스 내 목록 보기, 목록은 ajax로 띄움
	// ajax로 JSTL을 띄우는 방식이라 responsebody 필요없다고 함
	// 박스오피스 전체
	@GetMapping("viewall.mo")
	public String viewBoxOffice(@RequestParam(value="cpage", defaultValue="1")int cpage, Model model) {
		int boardLimit = 16;
		int listCount = msi.checkVideoCount();
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pgLimit, boardLimit);
		
		ArrayList<Movie> box = msi.selectBoxOffice(cpage);
		model.addAttribute("box", box);
		model.addAttribute("pi", pi);
		return "movie/list_using_taglib";
	}
	
	// ajax-jstl 테스트용
	@GetMapping("viewopened.mo")
	public String viewOpenedOnly(@RequestParam(value="cpage", defaultValue="1")int cpage, Model model) {
		int boardLimit = 16;
		int listCount = msi.checkOpenedVideoCount();
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pgLimit, boardLimit);

		ArrayList<Movie> box = msi.selectNowPlaying(cpage);
		model.addAttribute("box", box);
		model.addAttribute("pi", pi);
		
		return "movie/list_using_taglib";
	}
	
	// 개봉순 정렬 (개봉작만) - 테스트 중
	// 미개봉작을 포함한 개봉순 정렬은 만들 예정 없음
	// @GetMapping("openorder.mo?cpage=x")
	@GetMapping("openorder.mo")
	public String listbyOpenedOrder(@RequestParam(value="cpage", defaultValue="1")int cpage, Model model) {
		int boardLimit = 16;
		int listCount = msi.checkOpenedVideoCount();
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pgLimit, boardLimit);
		
		ArrayList<Movie> nowplaying = msi.listbyOpenedOrder(cpage);
		model.addAttribute("box", nowplaying);
		model.addAttribute("pi", pi);
		return "movie/list_using_taglib";
	}
	
	// 가나다순 정렬
	@GetMapping("nameorder.mo")
	public String listbyName(@RequestParam(value="cpage", defaultValue="1")int cpage, Model model) {
		int boardLimit = 16;
		int listCount = msi.checkVideoCount();
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pgLimit, boardLimit);
		
		ArrayList<Movie> nowplaying = msi.listbyName(cpage);
		model.addAttribute("box", nowplaying);
		model.addAttribute("pi", pi);
		return "movie/list_using_taglib";
	}
	
	// 가나다순 정렬 (상영작만)
	@GetMapping("nameorderplaying.mo")
	public String listbyNamePlaying(@RequestParam(value="cpage", defaultValue="1")int cpage, Model model) {
		int boardLimit = 16;
		int listCount = msi.checkVideoCount();
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pgLimit, boardLimit);
		
		ArrayList<Movie> nowplaying = msi.listbyNamePlaying(cpage);
		model.addAttribute("box", nowplaying);
		model.addAttribute("pi", pi);
		return "movie/list_using_taglib";
	}
	
	/*
	
	// 평점순 정렬 (상영작만)
	@GetMapping("criticchoice.mo")
	public String listbyCritics(@RequestParam(value="cpage", defaultValue="1")int cpage, Model model) {
		int boardLimit = 16;
		int listCount = msi.checkOpenedVideoCount();
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pgLimit, boardLimit);

		ArrayList<Movie> bestlist = msi.listbyCritics(cpage);
		model.addAttribute("box", bestlist);
		model.addAttribute("pi", pi);
		return "movie/list_using_taglib";
	}
	*/
	
	
	// 상영 예정작만 보기 - 페이지 띄우기
	@GetMapping("preopen.mo")
	public String viewNotOpened() {
		// ArrayList<Movie> tbs = msi.selectMovieListPre();
		return "movie/movieNotOpened";
	}

	
	// 개봉예정작의 개봉순 정렬 - 기본값이 됨에 따라 viewNotOpened로 통합 예정
	@GetMapping("openorderpre.mo")
	public String listbyOpenOrder(@RequestParam(value="cpage", defaultValue="1")int cpage, Model model) {
		int boardLimit = 16;
		int listCount = msi.checkNotOpenVideoCount();
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pgLimit, boardLimit);
		
		ArrayList<Movie> comingsoon = msi.listbyOpenOrder(cpage);
		model.addAttribute("box",comingsoon);
		model.addAttribute("pi",pi);
		
		return "movie/list_using_taglib";
	}
		
	// 개봉예정작의 가나다순 정렬
	@GetMapping("nameorderpre.mo")
	public String listWaitingByName(@RequestParam(value="cpage", defaultValue="1")int cpage, Model model) {
		int boardLimit = 16;
		int listCount = msi.checkNotOpenVideoCount();
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pgLimit, boardLimit);
		
		ArrayList<Movie> comingsoon = msi.listbyNamePre(cpage);
		model.addAttribute("box",comingsoon);
		model.addAttribute("pi",pi);
		return "movie/list_using_taglib";
	}
	
	// 모든 검색은 제목으로만 가능하며, 정렬 기준은 MOVIE_NO DESC 하나로 고정
	// (해당 : 박스오피스, 개봉 예정작, 관리자 영화 관리 목록)
	@GetMapping("searchMovie.mo")
	public String searchMovie(String keyword, int status, Model model) {
		// status : 0 = 전체, 1 = 개봉작만, 2 = 미개봉작만(searchFromPreOpen에서 이것만 씀)
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("status", status);
		
		ArrayList<Movie> searched = msi.searchMovie(map);
		model.addAttribute("box", searched);
		return "movie/list_using_taglib";
	}

	
	// 영화 상세 페이지
	// specific.mo?movieNo=XXX
	// 임시로 하드코딩한 <위키드>의 상세 페이지로 연결해놨으며, 이에 따라 boxOffice.jsp의 <위키드>에만 상세페이지를 링크해놨음
	// 도메인 미확정
	/*
	@GetMapping("detail.mo")
	public String selectMovie(int movieNo, Model model) {
		
		
		return "movie/movieDetail";
	}
	*/
	
	// 영화 상세 정보 조회 (스틸컷까지만)
	@GetMapping("detail.mo")
	public String showDetail(int movieNo, Model model) {
		
		
		Movie list = msi.showDetail(movieNo);
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		
		msi.showDetail(movieNo);
		
		return "movie/movieDetail";
	}
	
	// 리뷰 목록 조회 (+ 페이징 처리) (AJAX 예상)
	public void selectReview(@RequestParam(value="cpage", defaultValue="1")int cpage) {
		int boardLimit = 10;
		int listCount = 42; // 임시숫자
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pgLimit, boardLimit);
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
	@GetMapping("movielist_ad.mo")
	public String selectMovieList() {
		return "admin/movie/manageMovieList";
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
		/* 사용할 쿼리
		 * INSERT INTO MOVIE (
				MOVIE_NO, MOVIE_TITLE, OPEN_DATE, DIRECTOR,
				GENRE, RUNTIME, SCREEN_TYPE, FILM_RATE,
				DESCRIPTION, STARRING, TRAILER
			) VALUES (
				SEQ_MOV.NEXTVAL, #{movieTitle}, #{openDate}, #{director},
				#{genre}, #{runtime}, #{screenType}, #{filmRate},
				#{description}, #{starring}, #{trailer}_OR_NULL
			)
		 */
	}
	
	// 영화 수정 화면으로 이동
	@GetMapping("modifymovie.mo")
	public String modifyMovie() {
		return "admin/movie/modifyMovie";
	}
	
	// 영화 수정 / 도메인 미확정
	@PostMapping("admin.updatemovie.mo")
	public void updateMovie() {
		
	}
	
	// 영화 삭제 / 도메인 미확정
	@PostMapping("admin.deletemovie.mo")
	public void deleteMovie() {
		/* 사용할 쿼리
		 * UPDATE MOVIE
			SET STATUS = 'N'
			WHERE MOVIE_NO = #{movieNo}
		 */
	}
	
	
	// (관리자) 영화 관리 상세 - 페이지 띄우기
	@GetMapping("admin.managemovie.mo")
	public String movieManage() {
		return "admin/movie/manageMovieDetail";
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
	@GetMapping("admin.managereview.mo")
	public String reviewPatrol(/*PageInfo pi*/) {
		return "admin/movie/manageReview";
	}
	
	// 관리자가 리뷰 삭제 (목록에서 해당 리뷰 상단의 '-' 버튼을 눌렀을 때)
	public void adminDeleteReview() {
		/* 사용할 쿼리
		 * UPDATE REVIEW
			SET IS_DELETED = 'Y'
			WHERE REVIEW_ID = #{reviewId}
		 */
	}
	
}
