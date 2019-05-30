package com.ParkManager.VO;

import java.sql.Date;

public class BoardVO {
	private Integer id;
	private String title;
	private String content;
	private String writer;
	private Date writrDate;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWritrDate() {
		return writrDate;
	}
	public void setWritrDate(Date writrDate) {
		this.writrDate = writrDate;
	}
}
