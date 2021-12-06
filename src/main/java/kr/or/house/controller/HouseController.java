package kr.or.house.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.common.Address;
import kr.or.common.Income;
import kr.or.house.model.service.HouseService;
import kr.or.house.model.vo.House;
import kr.or.room.model.vo.Room;

@Controller
public class HouseController {
	@Autowired
	private HouseService service;
	//하우스 등록
	@RequestMapping(value = "/houseWriteFrm.do")
	public String houseWriteFrm() {
		return "house/houseWriteFrm";
	}
	//하우스 리스트 출력
	@RequestMapping(value="/houseList.do")
	public String houseList() {
		return "house/houseList";
	}
	//하우스 등록
	@RequestMapping(value = "/houseWrite.do")
	public String houseWrite(House h,Address address,Income i,Model model) {
		int result = service.insertHouse(h,address,i); // 하우스 등록
		if(result>0) {
			//그전에 등록한 하우스 번호를 가져와야하는 상황
			return "redirect:/roomList.do";
		}else {
			return "house/houseWriteFrm"; 			
		}
	}
}
