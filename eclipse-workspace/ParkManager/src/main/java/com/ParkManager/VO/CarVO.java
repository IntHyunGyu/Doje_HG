package com.ParkManager.VO;

public class CarVO {	
	private String carNum;
	private String user;
	private String carType;
	
	public CarVO() {

	}

	public CarVO(String carNum, String user, String carType) {
		this.carNum = carNum;
		this.user = user;
		this.carType = carType;
	}

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	@Override
	public String toString() {
		return "CarVO [carNum=" + carNum + ", user=" + user + ", carType=" + carType + "]";
	}
	
	
	
	
}
