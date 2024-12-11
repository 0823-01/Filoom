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
	// 사용자 게시글 목록조회 페이지 요청 
	@GetMapping("list.ev")
	public String selectList() {
		return "event/eventListView";
	}
	
	// 사용자 게시글 상세조회 페이지 요청 
	@GetMapping("detail.ev")
	public String selectEvent() {
		return "event/eventDetailView";
	}
	
	
	
	
	// 관리자용 
	// 관리자 게시글 작성페이지 요청
	@GetMapping("enrollForm.ev")
	public String enrollForm() {
		
		return "admin/event/adminEventEnrollForm";
	}
	
	// 관리자 게시글 작성 요청 
	@PostMapping("insert.ev")
	public ModelAndView insertEvent(@RequestParam("eventType") int eventType, Event e, MultipartFile[] upfiles, HttpSession session, ModelAndView mv) {
	    List<EventAttachment> eventAttachmentList = new ArrayList<>();
	    
	    // eventType을 Event 객체에 설정
	    e.setEventType(eventType);  // eventType을 Event 객체의 필드에 설정

	    int fileLevel = 1; // 대표이미지 1, 기본 2
	    
	    for (MultipartFile upfile : upfiles) {
	        if (!upfile.getOriginalFilename().equals("")) {
	            String changeName = saveFile(upfile, session); // 각 파일에 대해 이름 변경 및 저장
	            EventAttachment eventAttachment = new EventAttachment();
	            eventAttachment.setOriginName(upfile.getOriginalFilename());
	            eventAttachment.setChangeName("/resources/eventUploadFiles/" + changeName);
	            
	            // 첫번째 파일을 대표 이미지로 설정
	            eventAttachment.setFileLevel(fileLevel);
	            
	            // 나머지 기본 파일은 fileLevel 2로 설정
	            fileLevel = 2; 
	            eventAttachmentList.add(eventAttachment);
	        }
	    }
	    
	    // 게시글 등록 및 첨부파일 저장 서비스 호출 
	    int result = eventService.insertEvent(e);
	    
	    if (result > 0) { // 성공
	        // 이벤트가 등록된 후, 첨부파일에 eventNo을 추가하여 저장 
	        for (EventAttachment eventAttachment : eventAttachmentList) {
	            eventAttachment.setRefEno(e.getEventNo());
	            eventService.insertEventAttachment(eventAttachment); // 첨부파일 저장
	        }
	        
	        session.setAttribute("alertMsg", "이벤트 게시글 작성 성공!");
	        mv.setViewName("redirect:/list.ev");
	        
	    } else {
	        // 실패
	        mv.addObject("errorMsg", "이벤트 게시글 작성 실패").setViewName("common/errorPage");
	    }
	    System.out.println(e);
	    
	    return mv;
	}
	
	
	
	
	
	// ------------------------------------------ 파일 저장을 위한 일반 메소드 
	public String saveFile(MultipartFile upfile, HttpSession session) {
		// 1. 원본파일명 얻어오기 
		String originName = upfile.getOriginalFilename();
		
		// 2. 현재 시간을 년월시분초로 뽑아내기 
		// yyyyMMddHHmmss > SimpleDateFormat 객체 활용 
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 3. 뒤에 붙을 5자리 랜덤수 뽑아내기 
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 4. 원본파일명으로부터 확장자명 뽑아오기 
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 5. 모두 이어 붙이기 
		String changeName = currentTime + ranNum + ext; 
		
		// 6. 업로드하고자 하는 서버의 물리적인 경로 알아내기 
		// > applicationScope 객체를 이용해서 얻어낸다. 
		String savePath = session.getServletContext().getRealPath("/resources/eventUploadFiles/");
		
		// 7. 경로와 수정파일명을 합체 후 파일을 업로드해주기 
		// MultipartFile 객체에서 제공하는 transferTo 메소드 활용 
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	
	
	
}
