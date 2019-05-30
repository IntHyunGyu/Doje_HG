package com.ParkManager.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	
	@RequestMapping(value="/free")
	public String freeViewPage() {
		return "user/board/free/list";
	}
	
	@RequestMapping("/write")
	public String freeWritePage() {
		return "user/board/free/write";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="notice")
	public String noticeViewPage() {
		return "user/board/notice/list";
	}
	
}
