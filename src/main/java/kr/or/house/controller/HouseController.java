package kr.or.house.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.common.Address;
import kr.or.common.Income;
import kr.or.house.model.service.HouseService;
import kr.or.house.model.vo.House;

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
	@RequestMapping(value = "/houseWrite.do")
	public String houseWrite(House h,Address address,Income i) {
		int result = service.insertHouse(h,address,i);
		return "house/houseWriteFrm"; 
	}
}
