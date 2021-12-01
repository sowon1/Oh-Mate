package kr.or.house.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.house.model.service.HouseService;

@Controller
public class HouseController {
	@Autowired
	private HouseService service;
}
