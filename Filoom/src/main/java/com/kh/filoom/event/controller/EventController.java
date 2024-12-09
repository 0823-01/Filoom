package com.kh.filoom.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EventController {

	@GetMapping("list.ev")
	public String selectList() {
		return "event/eventListView";
	}
	
	@GetMapping("detail.ev")
	public String selectEvent() {
		return "event/eventDetailView";
	}
}
