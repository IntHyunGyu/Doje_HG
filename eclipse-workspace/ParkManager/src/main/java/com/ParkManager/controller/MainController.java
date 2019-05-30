package com.ParkManager.controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MainController {
	
	@RequestMapping(value="parkManager")
	public String parkManager() {
		return "/parkManager";
	}
	
	@RequestMapping(value="regist")
	public String regist() {
		return "/regist/regist";
	}

	@RequestMapping(value="/main")
	public String test() {
		return "/main";
	}
}
