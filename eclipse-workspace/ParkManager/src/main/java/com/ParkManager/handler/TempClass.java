package com.ParkManager.handler;


public class TempClass extends RuntimeException{
	private static final long serialVersionUID = 1L;
	
	String message;
	String title;
	
	public TempClass() {
	}

	public TempClass(String message, String title) {
		
		this.message = message;
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
