package com.kh.filoom.movie.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.filoom.common.model.vo.PageInfo;
import com.kh.filoom.common.template.Pagination;
import com.kh.filoom.movie.model.service.MovieServiceImpl;
import com.kh.filoom.movie.model.vo.Movie;
import com.kh.filoom.movie.model.vo.Poster;

/**
 * @author 정원섭
 * === MovieController v 0.5.1 ===
 * 작업 착수일 : 2024-12-13
 * 최종 수정일 : 2024-12-23
 */

/* 작업 내역
 * v 0.1 - 틀 잡기
 * v 0.2 - 영화 목록 출력 (평점순 제외)
 * v 0.3 - 검색을 제외한 각 영화 목록에 페이징바 추가
 * v 0.4 - 관리자 영화 추가 페이지 & 수정 페이지 착수
 * v 0.4.1 - 관리자 영화 추가 페이지 완료, 이미지가 안 뜨는 문제 원인 확인
 * v 0.4.2 - 상세 페이지 리뷰 페이징바 삭제 외 일부 사소한 변경 사항
 * v 0.5 - 영화 수정 페이지 & 삭제 페이지 완료, 상세 페이지 내 스위치 클릭시 개봉 여부 바뀜
 * v 0.5.1 - 박스오피스 기본 정렬 기준 변경 외 크고 작은 문제 수정 
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
		// System.out.println(list); // 확인용
		
		model.addAttribute("list", list);
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
	
	
	// ↓ === 관리자 메뉴 === ↓
	
	@GetMapping("movielist_ad.mo")
	public String selectMovieList() {
		return "admin/movie/manageMovieList";
	}
	
	// 관리자 전용 목록 조회 쿼리 실행용
	@GetMapping("admin.viewlist.mo")
	public String adminMovieList(int isOpen, Model model) {
		ArrayList<Movie> list = msi.adminMovieList(isOpen);
		model.addAttribute("list",list);
		 
		return "admin/movie/adminlist_taglib";
	}
	
	// 관리자 영화 관리 목록 검색 기능
	// 원래 int side 변수를 추가하여 사용자 쪽과 통합하려 했는데
	// 이러면 개발자 도구를 열고 side를 바꾸면 관리자 페이지가 뚫리므로 분리하였음
	// 정렬 기준이 MOVIE_NO DESC인 것 같아서 이건 원래 기준을 이쪽에 맞추면 될 듯
	@GetMapping("admin.searchMovie.mo")
	public String adminSearchMovie(String keyword, int status, Model model) {
		// status : 0 = 전체, 1 = 개봉작만. 2는 미개봉작에 쓰는 건데 관리자는 해당 사항 X
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("status", status);
		
		ArrayList<Movie> searched = msi.searchMovie(map);
		model.addAttribute("list", searched);
		return "admin/movie/adminlist_taglib";
	}
	
	// 영화 추가 화면으로 이동
	@GetMapping("newmovie.mo")
	public String addMovieForm() {
		System.out.println("NOW LOADING >>>");
		return "admin/movie/addMovie";
	}
	
	// 이미지 추가 - 영화 추가 / 수정 공통
	// EventController의 String saveFile과 같은 로직이나 변수명이 달라서 만약을 대비해 따로 썼음
	public String addImage(MultipartFile upfile, HttpSession session) {
		// copied from method "insertBoard"
		// 1. 원본파일명 얻어오기
		String fileName = upfile.getOriginalFilename();
		
		// 2. 현재 시간 + 5자리 난수로 파일의 코드네임 생성
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int randInt = (int)(Math.random() * 90000 + 10000);
		String ext = fileName.substring(fileName.lastIndexOf(".")); // 확장자
		
		String fileCodename = currentTime + randInt + ext; 
		
		// > 수동 업로드 (보안 문제 이전에 자동 업로드가 안됨)
		// 3. 저장 경로 설정
		String savePath = session.getServletContext().getRealPath("/resources/images/posters/");

		// 4. 파일 업로드 - MultipartFile 객체에서 제공하는 transferTo 메소드를 활용함
		try {
			upfile.transferTo(new File(savePath + fileCodename));
		} catch(IOException e) {
			e.printStackTrace();
		}
		return fileCodename;
	}
	
	// 영화 추가
	@ResponseBody
	@PostMapping("admin.insertmovie.mo")
	public String addMovie(HttpServletRequest request, @RequestParam("img")MultipartFile img,
			Movie m, Model model, HttpSession session) {
		int mvresult = 0; // 영화 삽입이 성공해야 이미지 삽입을 시도할 수 있음
		int result = 0; // 이미지 삽입까지 포함한 최종 결과
		
		// 영화 정보 넣는 것까진 성공
		System.out.println(m);
		
		// 이미지 넣기
		// maxUploadSize는 root-context.xml에 있으니까 굳이 안 써도 됨
		Poster p = new Poster();
		
		System.out.println("fileName = " + img.getOriginalFilename());
		
		
		//for(img : imglist) {
			if(!img.getOriginalFilename().equals("")) {
				String fileCodename = addImage(img, session);
				System.out.println(fileCodename);
				p.setFileName(img.getOriginalFilename());
				p.setFileCodename(fileCodename);
				p.setImagePath("/resources/images/posters/" + fileCodename);
				p.setFileLevel(1); // 1 = 대표 이미지라는 뜻
			}
		//}
		
		System.out.println(p);
		
		// 순서상 영화 추가를 먼저 하는 것이 맞음
		mvresult = msi.addMovie(m); // 결과값으로 movieNo를 뱉음
		if(mvresult > 0) {
			p.setMovieNo(mvresult);
			result = msi.addPoster(p);
			if(result <= 0) {
				int del = msi.undoAddMovie(mvresult);
				if (del > 0)
					System.out.println("Adding movie has reverted because adding image is failed.");
				// 영화부터 추가 시도하니까 귀찮게 File(realpath) 안해도 됨
				return "half_failure";
			}
		}
		
		/*
		 * 딴 데 쓰려고 일부러 남겨놨음
		// 이미지는 첨부했으나 정작 영화 추가가 안 됐을 경우, 첨부하려던 이미지를 삭제한다
		String realPath = session.getServletContext().getRealPath(p.getFileCodename());
		new File(realPath).delete();
		*/	
		return (result > 0) ? "success" : "failure";
	}
	
	// 영화 수정 화면으로 이동
	@GetMapping("modifymovie.mo")
	public String modifyMovie(int movieNo, Model model) {
		Movie m = msi.selectMovietoModify(movieNo);
		model.addAttribute("target", m);
		return "admin/movie/modifyMovie";
	}
	
	// 영화 수정
	@ResponseBody
	@PostMapping("admin.updatemovie.mo")
	public String updateMovie(HttpServletRequest request, @RequestParam(value="img")MultipartFile img,
			@RequestParam(value="prevpath")String prevpath,
			Movie m, Model model, HttpSession session) {
		
		// System.out.println(m);
		
		// 굳이 이것부터 하는 이유 : 수정은 이미지를 새로 첨부할 필요가 없으므로
		int result = msi.updateMovie(m);
		if(result > 0) {
			// img == null이면 변경 로직 안 거치고 끝
			if(img != null) {
				// 기존 이미지의 경로 받기 - 변경 성공시 삭제할 용도
				System.out.println("prevpath = "+prevpath);
				
				String fileCodename = addImage(img, session);
				Poster p = new Poster();
				p.setMovieNo(m.getMovieNo());
				p.setFileName(img.getOriginalFilename());
				p.setFileCodename(fileCodename);
				p.setImagePath("/resources/images/posters/" + fileCodename);
				p.setFileLevel(1);
				
				System.out.println(p);
				
				int imgresult = msi.changePoster(p);
				if(imgresult > 0)
					new File(prevpath).delete();
				else // if (imgresult <= 0)
					return "half_success";
			}
			return "success";
		} else
			return "failure";
	}
	
	// 영화 삭제
	@ResponseBody
	@PostMapping("admin.deletemovie.mo")
	public String deleteMovie(int movieNo) {
		int result = 0;
		// 포스터 삭제부터
		int picresult = msi.deletePoster(movieNo);
		
		if(picresult > 0) {
			result = msi.deleteMovie(movieNo);
			return (result > 0) ? "success" : "failure";
		} else
			return "failure";
	}
	
	
	// (관리자) 영화 관리 상세 - 페이지 띄우기
	@GetMapping("admin.managemovie.mo")
	public String movieManage(int movieNo, Model model) {
		Movie m = msi.selectMovietoModify(movieNo);
		// System.out.println(m); // 확인용
		
		model.addAttribute("target", m);
		return "admin/movie/manageMovieDetail";
	}
	
	
	
	// === (관리자) 영화 관리 상세 페이지 ===
	// (관리자) 상영 여부 변경
	@ResponseBody
	@PostMapping("admin.premiere.mo")
	public String togglePremiere(int movieNo, boolean premiere) {
		// premiere = 눌렀을 때 바뀐 스위치 값 (= 미개봉(false)상태에서 눌러 실행시키면 true로 받음)
		// String isOpen = premiere ? "Y" : "N"; // 굳이?
		System.out.println(premiere);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("movieNo", movieNo);
		map.put("premiere", premiere ? 1 : 0);
		
		int result = msi.togglePremiere(movieNo, map);
		
		return (result > 0) ? "success" : "failure"; 
	}
	
	// 상영 정보 추가
	public void newRunInfo() {
		
	}
	
	// 상영 정보 제거
	public void removeRunInfo() {
		
	}
	
	/* -- 여기부터 상세>이미지 관리 화면
	public void showImageList() {
		
	}
	
	public void addImage() {
		
	}
	
	public void updateImage() {
		
	}
	
	public void deleteImage() {
		
	}
	*/
	
	
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
