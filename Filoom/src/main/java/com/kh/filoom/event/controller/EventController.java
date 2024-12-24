package com.kh.filoom.event.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.filoom.common.model.vo.PageInfo;
import com.kh.filoom.common.template.Pagination;
import com.kh.filoom.coupon.model.vo.Coupon;
import com.kh.filoom.event.model.service.EventService;
import com.kh.filoom.event.model.vo.Applicant;
import com.kh.filoom.event.model.vo.Event;
import com.kh.filoom.event.model.vo.EventAttachment;
import com.kh.filoom.event.model.vo.Reply;

@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	// 사용자

	/**
	 * 241212 ~ 241213 한혜원
	 * 사용자 게시글 목록조회 (페이징 처리 없이) 
	 * ++ 이벤트 종료 여부에 따른 필터링 처리 
	 * @param eventSataus 이벤트 종료 여부
	 * @param model
	 * @return
	 */
	@GetMapping("list.ev")
	public String selectList(@RequestParam(value="eventStatus", required=false)String eventStatus, Model model) {
		
		// 페이징 처리 필요없음 
		// eventStatus 가 없으면 전체 목록, 있으면 그에 맞는 목록을 가져옴
		ArrayList<Event> list;
		String statusTitle = "전체 이벤트"; // 기본제목
		
		// 추천 이벤트 따로 가져오는 로직 추가 
		List<Event> hotList = eventService.selectHotEventList(); // 추천 이벤트 가져오기 
		
		
		// eventStatus 값이 있으면 해당하는 목록만 조회
		if("N".equals(eventStatus)) {
			list = eventService.selectFilterList(eventStatus);
			statusTitle = "진행중인 이벤트"; // 진행중인 이벤트 제목
		} else if("Y".equals(eventStatus)) {
			list = eventService.selectFilterList(eventStatus);
			statusTitle = "지난 이벤트"; // 진행중인 이벤트 제목
		} else {
			// eventStatus 가 없으면 전체 목록을 조회 (기본값) 
			list = eventService.selectList(); // 모든 이벤트를 가져오는 서비스 호출
			statusTitle = "전체 이벤트"; // 진행중인 이벤트 제목
		}
		model.addAttribute("list", list);
		model.addAttribute("statusTitle", statusTitle);  // 제목을 모델에 전달
		model.addAttribute("hotList", hotList);
		
		 // System.out.println(list);
		// System.out.println("list size : " + list.size());
		// System.out.println(statusTitle);
		// System.out.println(eventStatus);
		// System.out.println(hotList);
		
		return "event/eventListView";
	}
	
	
	/**
	 * 241213 한혜원
	 * 사용자 이벤트 게시글 상세조회 페이지 요청(쿼리스트링 이용)
	 * 조회수 처리 x
	 * @return
	 */
	@GetMapping("detail.ev")
	public ModelAndView selectEvent(int eno, ModelAndView mv) {
		
		// System.out.println(eno);
		
		// 게시글 정보, 첨부파일 정보 조회해오기 
		Event e = eventService.selectEvent(eno);
		
		// 게시글이 없는 경우 에러페이지로 포워딩
		if(e == null) {
			mv.setViewName("common/errorPage");
			mv.addObject("errorMsg", "해당 게시글을 찾을 수 없습니다.");
			return mv;
		}
		
		// 게시글 정보와 첨부파일 정보 조회 후 상세페이지 포워딩 
		ArrayList<EventAttachment> list = eventService.selectEventAttachment(eno);
		
		// 조회된 데이터드 담아서 응답페이지로 포워딩 
		mv.addObject("e", e);
		mv.addObject("list", list);
		mv.setViewName("event/eventDetailView");
		
		// System.out.println(e);
		// System.out.println(list);
		
		
		return mv;
		
	}
	
	
	/**
	 * 241217 한혜원 
	 * 댓글 목록조회 요청 (ajax)
	 * @return
	 */
	@ResponseBody
	@GetMapping(value="rlist.ev", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int eno, @RequestParam(value="cpage", defaultValue="1") int currentpage) {
		// System.out.println(eno);
		
		// 댓글 목록의 총 개수 조회 
		int listCount = eventService.seletReplyListCount(eno);
		
		// 페이지당 댓글 수와 페이지번호 설정
		int pageLimit = 10;
		int boardLimit = 10; 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentpage, pageLimit, boardLimit);
		
		// 페이징된 댓글 목록 조회
		ArrayList<Reply> list = eventService.selectReplyList(eno, pi);
		
		// 응답 데이터 JSON 형식으로 반환할 객체 
		Map<String, Object> response = new HashMap<>();
		response.put("list", list);
		response.put("pi", pi);
		
		// System.out.println(list);
		// System.out.println(pi);
		return new Gson().toJson(response);
		
	}
	
	/**
	 * 241217 댓글 작성용 요청
	 * @param r
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="rinsert.ev", produces="text/html; charset=UTF-8")
	public String ajaxInsertReply(Reply r) {
		// System.out.println(r);
		
		// 댓글 작성
		int result = eventService.insertReply(r);
		
		return (result>0) ? "success" : "fail";
	}
	
	/**
	 * 241217~18 댓글 수정용 요청
	 * @param r (replyNo, replyContent, replyWriter)
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="rupdate.ev")
	public Map<String, String> ajaxUpdateReply(@RequestBody Reply r) {
		System.out.println("수정 요청 데이터 : " + r);
		
		// 댓글 수정 결과로 반환하기 
		int result = eventService.updateReply(r);
		
		// 결과를 JSON 형식으로 반환 
		Map<String, String> response = new HashMap<>();
		if(result>0) {
			response.put("status", "success");
			response.put("message", "댓글이 수정되었습니다.");
		} else {
			response.put("status", "fail");
			response.put("message", "댓글 수정에 실패했습니다.");
		}
		
		return response;
	}
	
	
	
	/**
	 * 241218 한혜원 댓글 삭제요청
	 * @param replyNo
	 * @return
	 */
	@RequestMapping(value="rdelete.ev", method=RequestMethod.POST)
	@ResponseBody
	public String ajaxDeleteReply(@RequestParam("replyNo") int replyNo) {
		int result = eventService.deleteReply(replyNo);
		
		if (result>0) {
            return "success"; // 삭제 성공
        } else {
            return "failure"; // 삭제 실패
        }
	}
	
	// 응모버튼 
	/**
	 * 241219 한혜원
	 * 응모 버튼 중복 체크 및 응모하기 
	 * @param a
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="apply.ev", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxParticipateInButton(@RequestBody Applicant a) {
		// System.out.println("요청 보낼 데이터 : " + a);
		
		Map<String, Object> response = new HashMap<>();
		if(eventService.checkUserParticipated(a.getRefEno(), a.getUserNo())) {
			response.put("success", false);
			response.put("message", "이미 이 이벤트를 응모하셨습니다!");
		} else {
			eventService.insertParticipant(a); // 응모 처리
			response.put("success", true);
			response.put("message", "응모가 완료되었습니다!");
		}
		
		return response;
		
	}
	
	// ------------------------------------------------------------------------------------------------- 관리자용 
	/**
	 * 241211 한혜원 
	 * 게시글 작성페이지 요청 
	 * @return
	 */
	@GetMapping("enrollForm.ev")
	public String enrollForm() {
		
		return "admin/event/adminEventEnrollForm";
	}
	

	/**
	 * 241222 한혜원
	 * 쿠폰 등록 페이지 요청
	 * @return
	 */
	@GetMapping("couponForm.ev")
	public String couponForm(@RequestParam("eventNo") int eventNo, Model model) {
		model.addAttribute("eventNo", eventNo); // 쿠폰 등록에서 사용할 이벤트 번호 전달
		return "admin/event/couponEnrollForm"; // 쿠폰 등록 폼 html 반환
	}
	
	
	/**
	 * 241211 ~ 241212 한혜원 
	 * 게시글 작성 요청
	 * @param eventType
	 * @param e
	 * @param upfiles
	 * @param session
	 * @param mv
	 * @return
	 */
	@PostMapping("insert.ev")
	public ModelAndView insertEvent(@RequestParam("eventType") int eventType, Event e, 
	                                @RequestParam("upfiles") MultipartFile[] upfiles, HttpSession session, ModelAndView mv) {
	    // 첨부파일 리스트 생성
	    List<EventAttachment> eventAttachmentList = new ArrayList<>();

	    // Event 객체에 eventType 설정
	    e.setEventType(eventType); // 이벤트 타입 설정

	    int fileLevel = 1; // 대표이미지 1, 일반파일 2

	    // 첨부파일 처리 로직
	    for (MultipartFile upfile : upfiles) {
	        if (!upfile.getOriginalFilename().equals("")) {
	            String changeName = saveFile(upfile, session); // 파일 저장 및 이름 변경
	            EventAttachment eventAttachment = new EventAttachment();
	            eventAttachment.setOriginName(upfile.getOriginalFilename());
	            eventAttachment.setChangeName("/resources/eventUploadFiles/" + changeName);
	            eventAttachment.setFilePath(changeName);
	            

	            // 첫 번째 파일은 대표 이미지로 설정, 이후는 일반 파일로 설정
	            eventAttachment.setFileLevel(fileLevel);
	            if (fileLevel == 1) {
	                fileLevel = 2;
	            }

	            eventAttachmentList.add(eventAttachment); // 리스트에 추가
	        }
	    }

	    // 게시글 저장 서비스 호출
	    int result = eventService.insertEvent(e);

	    if (result > 0) {
	        // 게시글 저장 성공 시, 첨부파일 저장 로직 실행
	        for (EventAttachment eventAttachment : eventAttachmentList) {
	            eventAttachment.setRefEno(e.getEventNo()); // 저장된 게시글 번호를 참조번호로 설정
	            eventService.insertEventAttachment(eventAttachment); // 첨부파일 저장
	        }
	        

	        // 성공 메시지 설정
	        session.setAttribute("alertMsg", "이벤트 게시글 작성 성공!");
	        mv.setViewName("redirect:/list.ev");
	    } else {
	        // 실패 시 에러 페이지로 이동
	        mv.addObject("errorMsg", "이벤트 게시글 작성 실패").setViewName("common/errorPage");
	    }

	    // 디버깅용 로그 출력
	    System.out.println("Event: " + e);
	    System.out.println("Attachments: " + eventAttachmentList);
	    return mv;
	}
	

	/**
	 * 241222 한혜원
	 * 쿠폰 등록
	 * @param eventNo
	 * @param coupon
	 * @param session
	 * @param mv
	 * @return
	 */
	@PostMapping("insertCoupon.ev")
	public ModelAndView insertCoupon(@RequestParam("eventNo")int eventNo, Coupon coupon, HttpSession session, ModelAndView mv) {
		
		// System.out.println(eventNo);
		// 쿠폰 객체 설정 
		coupon.setRefEno(eventNo);
		
		// 1. 쿠폰 등록 
		int couponResult = eventService.insertCoupon(coupon);
		
		if(couponResult>0) {
			session.setAttribute("alertMsg", "쿠폰 등록 성공!");
			mv.setViewName("redirect:/clist.ev?eventNo=" + eventNo); // 쿠폰 등록 후 이벤트 게시글 등록 폼으로 포워딩
		} else {
			mv.addObject("errorMsg", "쿠폰 등록 실패!").setViewName("common/errorPage");
		}
		
		// System.out.println(coupon);
		return mv;
	}
	
	
	/**
	 * 241218 한혜원
	 * 관리자용 이벤트게시글 목록조회 요청 
	 * @param currentpage
	 * @param model
	 * @return
	 */
	@GetMapping("alist.ev")
	public String adminSelectList(@RequestParam(value="cpage", defaultValue="1")int currentpage, Model model) {
		// 게시글 목록조회 후 페이징 처리 변수 필요 
		int listCount = eventService.selectListCount();
		
		int pageLimit = 10;
		int boardLimint = 5;
		PageInfo pi = Pagination.getPageInfo(listCount, currentpage, pageLimit, boardLimint);
		
		ArrayList<Event> list = eventService.adminSelectList(pi);
		
		// 응답데이터로 목록 및 페이징 관련 객체 넘기로 페이지 포워딩
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		// System.out.println(list);
		
		return "admin/event/adminEventListView";
	}
	
	/**
	 * 241218 한혜원
	 * 관리자 이벤트 게시글 상세조회 페이지 (쿼리스트링) 
	 * @param eno
	 * @param mv
	 * @return
	 */
	@GetMapping("adetail.ev")
	public ModelAndView adminSelectEvent(int eno, ModelAndView mv) {
		// System.out.println(eno);
		
		// 게시글정보, 첨부파일 정보 조회 
		Event e = eventService.adminSelectEvent(eno);
		
		// 게시글이 없는 경우 에러페이지로 포워딩 
		if(e == null) {
			mv.setViewName("common/errorPage");
			mv.addObject("errorMsg", "해당 게시글을 찾을 수 없습니다.");
			return mv;
		}
		
		// 게시글 정보와 첨부파일 정보 조회 후 상세페이지 포워딩 
		ArrayList<EventAttachment> list = eventService.selectEventAttachment(eno);
		
		// 조회된 데이터드 담아서 응답페이지로 포워딩 
		mv.addObject("e", e);
		mv.addObject("list", list);
		mv.setViewName("admin/event/adminEventDetailView");
		
		//System.out.println("상세조회 : " + e);
		//System.out.println("상세조회 : " + list);
				
				
		return mv;
	}
	
	
	/**
	 * 241222 한혜원
	 * 게시글 수정하기 페이지 요청
	 * @param eventNo
	 * @param model
	 * @return
	 */
	@PostMapping("updateForm.ev")
	public ModelAndView updateForm(int eno, ModelAndView mv) {
		// System.out.println(eno);
		
		Event e = eventService.selectEvent(eno);
		ArrayList<EventAttachment> list = eventService.selectEventAttachment(eno);
		
		// 조회된 이벤트 정보와 첨부파일 목록 모델에 추가하여 수정페이지로 전달 
		mv.addObject("e", e);
		mv.addObject("list", list);
		
		System.out.println(e);
		System.out.println(list);
		// System.out.println(e.getEventStatus());
		
		
		// 수정 페이지로 이동
		mv.setViewName("admin/event/eventUpdateForm");
		return mv;
		
	}
	
	
	/**
	 * 241224 한혜원
	 * 게시글 수정
	 * @param e
	 * @param newUpFiles
	 * @param deletedFileNos
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="update.ev", method=RequestMethod.POST)
	public ModelAndView updateEvent(Event e,
							  @RequestParam(value="newUpFiles", required=false) MultipartFile[] newUpFiles,
							  @RequestParam(value="deletedFileNos", required=false) Integer[] deletedFileNos,
	                          HttpSession session, ModelAndView mv) {
	    
	    // 새로 넘어온 첨부파일이 있을 경우, 첨부파일 목록을 처리 
	    List<EventAttachment> list = new ArrayList<>();
	    int fileLevel = 1; // 대표이미지 1, 일반 2 
	    
	    for(MultipartFile newUpFile : newUpFiles) {
	    	if(!newUpFile.isEmpty()) {
	    		String changeName = saveFile(newUpFile, session); // 파일 저장 및 이름 변경
	    		
	    		EventAttachment eventAttachment = new EventAttachment();
	    		eventAttachment.setOriginName(newUpFile.getOriginalFilename());
	    		eventAttachment.setChangeName("/resources/eventUploadFiles/" + changeName);
	    		eventAttachment.setFilePath(changeName);
	    		eventAttachment.setFileLevel(fileLevel);
	    		
	    		// 첫번재 파일은 대표이미지로 설정, 이후는 일반 파일로 설정 
	    		if(fileLevel == 1) {
	    			fileLevel = 2;
	    			
	    		}
	    		
	    		list.add(eventAttachment); // 첨부파일 리스트에 추가 
	    	}
	    	
	    }
	    	
	    	// 1. 게시글 수정 서비스 호출 
	    	int eventResult = eventService.updateEvent(e);
	    	
	    	if(eventResult>0) {
	    		// 2. 새로 첨부된 파일들 추가 저장 
	    		for(EventAttachment eventAttachment : list) {
	    			eventAttachment.setRefEno(e.getEventNo()); // 게시글 번호 참조 
	    			eventService.insertEventAttachment(eventAttachment);
	    		}
	    		
	    		// 3. 삭제된 파일의 상태값을 "N" 으로 변경 
	    		if(deletedFileNos != null && deletedFileNos.length>0) {
	    			eventService.updateEventAttachment(Arrays.asList(deletedFileNos), "N");
	    		}
	    		
	    		// 성공 메세지 
	    		session.setAttribute("alertMsg", "이벤트 게시글 수정 성공!");
	    		mv.setViewName("redirect:/detail.ev");
	    	} else {
	    		// 실패 시 에러 페이지로 이동 
	    		mv.addObject("errorMsg", "이벤트 게시글 수정 실패").setViewName("common/errorPage");
	    	}
	    	
	    	System.out.println(e);
	    	System.out.println(list);
	    	return mv;
	    }
	    

	    
		
	
	/*
	public String deleteEvent(int eno, String filePath, Model model, HttpSession session) {
		System.out.println(eno);
		
		int result = eventService.deleteEvent(eno);
		
		if(result>0) {
			if(!filePath.equals("")) {
				String realPath = session.getServletContext().getRealPath(filePath);
				new File(realPath).delete();
			}
			
			// 일회성 알람 문구를 담아서 게시판 리스트 페이지로 url 재요청 
			session.setAttribute("alertMsg", "게시글 삭제 성공!");
			return "redirect:/list.ev";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패!");
			return "common/errorPage";
		}
	} */
	
	
	/**

	 * 241223 한혜원
	 * 쿠폰목록조회
	 * @param eventNo
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@GetMapping("clist.ev")
	public String selectCouponList(@RequestParam(value="eventNo", required=false)int eventNo,
								   @RequestParam(value="cpage", defaultValue="1")int currentPage, 
								   Model model) {
		
		System.out.println(eventNo);
		
		if(eventNo == 0) {
			return "errorPage";
		}
		
		// 쿠폰 목록 조회 후 페이징 처리 변수 필요
		int listCount = eventService.selectCouponListCount(eventNo);
		
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 페이징처리된 쿠폰목록조회 
		Map<String, Object> params = new HashMap<>();
		params.put("eventNo", eventNo);
		params.put("pi", pi);
		
		ArrayList<Coupon> list = eventService.selectCouponList(params);
		
		// 응답데이터로 목록 및 페이징 관련 객체 넘기기
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("eventNo", eventNo);
		System.out.println(params);
		
		// System.out.println(listCount);
		// System.out.println(list);
		
		return "admin/event/adminCouponListView";

	}
	
	
	
	// 응모자 확인 (댓글+버튼) + 버튼 응모자들에게 쿠폰 발급하기 
	/**
	 * 241219 한혜원
	 * 응모자 확인 버튼 클릭시, 해당 타입에 맞는 응모자 목록조회 페이지 요청 
	 * 1이면 댓글 목록
	 * 2이면 버튼 응모 목록
	 * 페이징처리
	 * @param eventNo
	 * @param eventType
	 * @param model
	 * @return
	 */
	@RequestMapping("aplist.ev")
	public String selectApplicantList(@RequestParam("eventNo")int eventNo, 
									  @RequestParam("eventType")int eventType, 
									  @RequestParam(value="cpage", defaultValue="1")int currentpage,
									  Model model) {
		
		// System.out.println(eventNo);
		// System.out.println(eventType);
		
		// 페이지 정보를 계산하기 위한 코드 
		int listCount = 0; 
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = null;
		List<Reply> rlist = null; // 댓글 목록
	    List<Applicant> alist = null; // 응모자 목록

		
		
		// eventNo, eventType 만 사용하여 특정 기능 실행 
		if(eventType == 1) {
			// 댓글 목록일 경우
			listCount = eventService.rlistCount(eventNo); // 댓글 개수 조회 
			pi = Pagination.getPageInfo(listCount, currentpage, pageLimit, boardLimit);
			// System.out.println("댓글 페이지 정보 (pi): " + pi);
			
			// 페이징 적용하여 댓글 목록 조회 
			Map<String, Object> params = new HashMap<>();
			params.put("eventNo", eventNo);
			 params.put("pi", pi);
			
			rlist = eventService.adminSelectReplyList(params);
			model.addAttribute("rlist", rlist);
			model.addAttribute("pi", pi); // 페이징 정보 넘기기
			
			return "admin/event/adminReplyListView"; // 댓글 목록 페이지
			
		} else if(eventType == 2) {
			// 버튼 응모자 목록조회 
			listCount = eventService.aplistCount(eventNo); // 응모자 수 조회 
			pi = Pagination.getPageInfo(listCount, currentpage, pageLimit, boardLimit);
			System.out.println("응모자 페이지 정보 (pi): " + pi);
			
			// 페이징 적용하여 응모자 목록 조회 
			Map<String, Object> params = new HashMap<>();
			params.put("eventNo", eventNo);
			params.put("pi", pi);
			
			
			alist = eventService.adminSelectApplicantList(params);
			// System.out.println("응모자 목록: " + alist);
			
			System.out.println("alist 는 " +alist);
			
			model.addAttribute("alist", alist);
			model.addAttribute("pi", pi); // 페이징 정보 넘기기

			return "admin/event/applicantListView"; // 버튼 응모자 목록 페이지
		} else {
			model.addAttribute("errorMsg", "해당 이벤트는 오프라인 타입입니다.");
			return "admin/event/adminEventListView"; // 에러 페이지로 이동
		}
				
	}
	
	/**
	 * 241220 한혜원
	 * 당첨자 목록 저장
	 * @param winnerData
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="insertWin.ev", produces="application/json; charset=UTF-8")
	public String insertWinners(@RequestParam("eventNo") int eventNo, 
	                            @RequestParam("eventType") int eventType, 
	                            @RequestParam("winners") List<Integer> winners) {
		
		System.out.println(winners);
	    // WINNER_TYPE은 eventType과 동일
	    int winnerType = eventType; 
	    
	    // 서비스에 필요한 데이터 전달
	    Map<String, Object> params = new HashMap<>();
	    params.put("eventNo", eventNo);
	    params.put("winnerType", winnerType);
	    params.put("winners", winners);

	    int result = eventService.insertWinners(params);

	    if (result > 0) {
	        return "redirect:/aplist.ev?eventNo=" + eventNo + "&eventType=" + eventType;
	    } else {
	        // 에러 페이지 처리
	        return "error/adminEventErrorPage";
	    }
	}
	
	/*
	public String sendCoupon(@RequestParam("eventNo")int eventNo,
							 @RequestParam("couponNo")int couponNo,
							 RedirectAttributes redirectAttributes) {
		
	} */
	
	// ------------------------------------------ 파일 저장 메소드
	public String saveFile(MultipartFile upfile, HttpSession session) {
	    // 1. 원본파일명 얻어오기
	    String originName = upfile.getOriginalFilename();

	    // 2. 현재 시간을 기반으로 변경 파일명 생성
	    String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	    int ranNum = (int) (Math.random() * 90000 + 10000); // 5자리 랜덤수 생성
	    String ext = originName.substring(originName.lastIndexOf(".")); // 확장자 추출
	    String changeName = currentTime + ranNum + ext; // 변경된 파일명

	    // 3. 저장 경로 설정
	    String savePath = session.getServletContext().getRealPath("/resources/eventUploadFiles/");
	    
	    // System.out.println("파일이름 : file.getOriginName");
	    // System.out.println("파일경로 : filePath");

	    // 4. 파일 저장
	    try {
	        File targetFile = new File(savePath + changeName);
	        upfile.transferTo(targetFile); // 파일 저장
	        // System.out.println("File saved: " + targetFile.getAbsolutePath()); // 저장 경로 로그
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    

	    return changeName; // 변경된 파일명 반환
	}

	
	
	@PostMapping("insertCoupon.co")
	public int couponInsertEx(@RequestBody Map<String, Object> params) {
	   
		// 전달된 파라미터에서 값을 추출
	    String userNo = (String) params.get("userNo");
	    int eventNo = (int) params.get("eventNo");
	    
	    // 출력
	    System.out.println("userNo: " + userNo);  // 상태 출력
	    System.out.println("eventNo: " + eventNo);  // 이벤트 번호 출력
	    
	    // 서비스 호출
	    int result = eventService.couponInsertEx(params);
	    
	    // 결과 반환
	    return result;
	}
	
	
	
}
