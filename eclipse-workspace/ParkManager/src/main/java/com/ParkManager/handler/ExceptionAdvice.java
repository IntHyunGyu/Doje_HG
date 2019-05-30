package com.ParkManager.handler;

import java.io.UnsupportedEncodingException;


import java.net.URLEncoder;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.WebRequest;

@ControllerAdvice
public class ExceptionAdvice {
	
	@ExceptionHandler(value = {com.ParkManager.handler.TempClass.class})
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	@ResponseBody
	protected String ajaxException(TempClass err, WebRequest request) throws UnsupportedEncodingException {
		String reulstData = URLEncoder.encode(err.getMessage(), "UTF-8");
		String alertMsg = URLEncoder.encode(err.getTitle(), "UTF-8");
	
		System.out.println(alertMsg);
		return alertMsg;
	}
}
