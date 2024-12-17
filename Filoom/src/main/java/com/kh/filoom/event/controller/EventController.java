package com.kh.filoom.event.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.filoom.event.model.service.EventService;
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
		
		// System.out.println(list);
		// System.out.println("list size : " + list.size());
		// System.out.println(statusTitle);
		// System.out.println(eventStatus);
		
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
	public String ajaxSelectReplyList(int eno) {
		// System.out.println(eno);
		ArrayList<Reply> list = eventService.selectReplyList(eno);
		// System.out.println(list);
		return new Gson().toJson(list);
		
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
	 * 241217 댓글 수정용 요청
	 * @param r (replyNo, replyContent)
	 * @return
	 */
	@ResponseBody
	@GetMapping(value="rupdate.ev", produces="text/html; charset=UTF-8")
	public String ajaxUpdateReply(Reply r) {
		System.out.println(r);
		
		// 댓글 수정 로직 처리 
		int result = eventService.updateReply(r);
		
		return (result>0) ? "success" : "fail";
		
	}

	// 관리자용 
	
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
	    // System.out.println("Event: " + e);
	    // System.out.println("Attachments: " + eventAttachmentList);
	    return mv;
	}

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

	
	
	
	
}
