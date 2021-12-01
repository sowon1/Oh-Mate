package kr.or.helper.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.helper.model.service.HelperService;

@Controller
public class HelperController {
	@Autowired
	private HelperService service;
	

}
