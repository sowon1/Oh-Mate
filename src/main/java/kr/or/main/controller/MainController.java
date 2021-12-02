package kr.or.main.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.helper.model.vo.Helper;
import kr.or.house.model.vo.House;
import kr.or.main.model.service.MainService;
import kr.or.main.model.vo.Main;

@Controller
public class MainController {
	@Autowired
	private MainService service;
	
	//main.jsp로 정보주면서 페이지 이동
	@RequestMapping(value="/main.do")
	public String main(Model model) {
		Main main = service.selectMainList();
		model.addAttribute("hplist",main.getHplist());
		model.addAttribute("hlist",main.getHlist());
		model.addAttribute("memcount",main.getMemcount());
		model.addAttribute("loc","/");
		return "common/main";
	}
}
