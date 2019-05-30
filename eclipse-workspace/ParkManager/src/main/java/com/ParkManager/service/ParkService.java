package com.ParkManager.service;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ParkManager.Dao.ParkManagerDao;
import com.ParkManager.VO.CarVO;
import com.ParkManager.VO.UserVO;





@Service
public class ParkService {
	
	@Autowired ParkManagerDao parkmanagerdao;
	
	public void registU(UserVO Uvo) {
		parkmanagerdao.registU(Uvo);	
	}
	
	public void registC(CarVO Cvo) {
		parkmanagerdao.registC(Cvo);
	}

	public UserVO login(UserVO vo) {
		return parkmanagerdao.loginSelectID(vo);
	}
}
