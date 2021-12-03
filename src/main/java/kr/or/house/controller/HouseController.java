package kr.or.house.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.house.model.service.HouseService;

@Controller
public class HouseController {
	@Autowired
	private HouseService service;
	
	@RequestMapping(value = "/houseWrite.do")
	public String houseWrite() {
		return "house/houseWriteFrm";
	}
}
