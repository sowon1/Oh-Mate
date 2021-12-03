package kr.or.helper.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.helper.model.service.HelperService;
import kr.or.member.model.vo.Member;

@Controller
public class HelperController {
	@Autowired
	private HelperService service;
	
	//헬퍼 요청양식 이동
	@RequestMapping(value = "/helperRequestFrm.do")
	public String helperRequestFrm(Model model) {
		return "helper/helperRequestFrm";
	}
	//헬퍼 리스트 출력
	@RequestMapping(value="/helperList.do")
	public String helperList() {
		return "helper/helperList";
	}

}
