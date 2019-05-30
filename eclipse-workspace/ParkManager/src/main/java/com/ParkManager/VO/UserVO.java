package com.ParkManager.VO;


	
public class UserVO {
	private String id;
	private String password;
	private String name;
	private String phone;
	private String regDate;
	
	public UserVO() {
		
	}

	public UserVO(String id, String password, String name, String phone, String regDate) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", phone=" + phone + ", regDate="
				+ regDate + "]";
	}

	
}
