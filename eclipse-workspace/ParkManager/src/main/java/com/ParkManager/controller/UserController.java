package com.ParkManager.controller;





import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ParkManager.VO.CarVO;
import com.ParkManager.VO.UserVO;
import com.ParkManager.handler.TempClass;
import com.ParkManager.service.ParkService;
import com.ParkManager.validator.RegisterValidator;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	ParkService parkservice;
	
	@RequestMapping(value="/regist", method=RequestMethod.POST, produces="application/text;charset=utf8")
	@ResponseBody
	public void registerAjax(UserVO Uvo, CarVO Cvo, Errors error) {
		TempClass err = null;
		new RegisterValidator().validate(Uvo, error);
		
		if(error.hasErrors()) {
			System.out.println("에러 캐치");
			err = new TempClass("회원가입 에러", "필수 입력 값이 비워있음");
			throw err;
		} else {
			Cvo.setUser(Uvo.getId());
			parkservice.registU(Uvo);
			parkservice.registC(Cvo);
		}

	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(HttpSession session, UserVO Uvo, ModelAndView model, TempClass err) {

		UserVO user = null;
		System.out.println(Uvo.toString());
		
		try {
			System.out.println("로그인 시도");
			user = parkservice.login(Uvo);
		} catch(Exception e) {
			System.out.println("로그인 에러");
			err = new TempClass("에러메세지", "에러타이틀");			
		}
		
		if(user != null) {
			session.setAttribute("user", user);
			model = new ModelAndView("redirect:/main");
		} else {
			model = new ModelAndView("redirect:/parkManager");
		}
		return model;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		
		return "redirect:/parkManager";
		
	}
	
}
