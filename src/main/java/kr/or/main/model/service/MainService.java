package kr.or.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.Bookmark;
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
	public Main selectMainList(int memberNo) {
		ArrayList<Helper> helperList = dao.selectHelperList(memberNo);
		ArrayList<House> houseList = dao.selectHouseList(memberNo);
		int total = dao.total();
		Main main = new Main();
		main.setHlist(houseList);
		main.setHplist(helperList);
		main.setMemcount(total);		
		return main;
	}
	//house like select 
	public int houseLike(int memberNo, int houseNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("houseNo", houseNo);		
		return dao.houseLike(map);
	}
	//house like insert
	public int insertHouseLike(int memberNo, int houseNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("houseNo", houseNo);
		return dao.insertHouseLike(map);
	}
	//house like delete
	public int deleteHouseLike(int memberNo, int houseNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("houseNo", houseNo);
		return dao.deleteHouseLike(map);
	}
	//house like total
	public int houseLikeCount(int houseNo) {
		return dao.houseLikeCount(houseNo);
	}

	
}
