package kr.or.main.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.Photo;
import kr.or.helper.model.vo.Helper;
import kr.or.house.model.vo.House;
import kr.or.main.model.dao.MainDao;
import kr.or.main.model.vo.Main;

@Service
public class MainService {
	@Autowired
	private MainDao dao;
	//하우스, 헬퍼, 멤버카운트 
	public Main selectMainList() {
		ArrayList<Helper> helperList = dao.selectHelperList();
		ArrayList<House> houseList = dao.selectHouseList();
		int total = dao.total();
		Main main = new Main();
		main.setHlist(houseList);
		main.setHplist(helperList);
		main.setMemcount(total);		
		return main;
	}
	
}
