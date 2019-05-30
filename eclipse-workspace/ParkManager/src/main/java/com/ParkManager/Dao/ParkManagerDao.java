package com.ParkManager.Dao;



import org.apache.ibatis.annotations.Mapper;


import com.ParkManager.VO.CarVO;
import com.ParkManager.VO.UserVO;

@Mapper
public interface ParkManagerDao {
	public void registU(UserVO Uvo);
	public void registC(CarVO cvo);
	public UserVO loginSelectID(UserVO uvo);	
}
