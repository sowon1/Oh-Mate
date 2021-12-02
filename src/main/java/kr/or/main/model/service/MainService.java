package kr.or.main.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.helper.model.dao.HelperDao;
import kr.or.helper.model.vo.Helper;
import kr.or.house.model.dao.HouseDao;
import kr.or.house.model.vo.House;

@Service
public class MainService {
	@Autowired
	private HouseDao hDao;
	@Autowired
	private HelperDao hpDao;
	
	//하우스 리스트 출력
	public ArrayList<House> selectHouseList() {
		// TODO Auto-generated method stub
		return null;
	}
	//헬퍼 리스트 출력
	public ArrayList<Helper> selectHelperList() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
