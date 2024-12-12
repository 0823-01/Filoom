package com.kh.filoom.event.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.filoom.event.model.service.EventService;
import com.kh.filoom.event.model.vo.Event;
import com.kh.filoom.event.model.vo.EventAttachment;

@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	// 사용자

	/**
	 * 241212 한혜원
	 * 사용자 게시글 목록조회 (페이징처리 없이) 
	 * @param model
	 * @return
	 */
	@GetMapping("list.ev")
	public String selectList(Model model) {
		
		// 페이징 처리 필요없음 
		// 게시글 목록 조회
		ArrayList<Event> list = eventService.selectList();
		
		// 응답데이터로 목록 객체 넘기고 게시글 목록 조회 페이지 포워딩 
		model.addAttribute("list", list);
		
		System.out.println(list);
		
		return "event/eventListView";
	}
	
	
	
	// 사용자 게시글 상세조회 페이지 요청 
	@GetMapping("detail.ev")
	public String selectEvent() {
		return "event/eventDetailView";
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
