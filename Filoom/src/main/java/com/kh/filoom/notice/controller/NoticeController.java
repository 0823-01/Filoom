package com.kh.filoom.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class NoticeController {
	
	@GetMapping("list.no")
	public String selectList() {
		return "notice/noticeListView";
	}
	
	@GetMapping("detail.no")
	public String selectNotice() {
		
		System.out.println("왜 안돼");
		return "notice/noticeDetailView";
	}
	
	@GetMapping("enrollForm.no")
	public String enrollForm() {
		return "admin/notice/adminNoticeEnrollForm";
	}
}
