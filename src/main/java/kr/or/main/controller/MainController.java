package kr.or.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.common.Bookmark;
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
	public String main(Model model, HttpSession session) {
		Main main = service.selectMainList();
		model.addAttribute("hplist",main.getHplist());
		model.addAttribute("hlist",main.getHlist());
		model.addAttribute("memcount",main.getMemcount());
		model.addAttribute("loc","/");
		return "common/main";
	}
	
	//house 좋아요
	@ResponseBody
	@RequestMapping(value="/houseLike.do", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String houseLike(int memberNo, int houseNo) {
		int like_check = 0;
		like_check = service.houseLike(memberNo,houseNo);
		if(like_check == 0) {
			like_check++;
			int like_up = service.insertHouseLike(memberNo,houseNo);
		}else {
			like_check--;
			int like_down = service.deleteHouseLike(memberNo,houseNo);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("like_check", like_check);
		return "like_check";
	}
}
