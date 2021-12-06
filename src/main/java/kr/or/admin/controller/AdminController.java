package kr.or.admin.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.SearchMember;
import kr.or.admin.model.vo.UpdateMember;
import kr.or.member.model.vo.Member;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/memberMgr.do")
	public String memberMgr(int reqPage, Model model) {
		HashMap<String, Object> data = service.selectAllMember(reqPage);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		return "admin/memberMgr";
	}
	@RequestMapping(value="/adminMemberSearch.do")
	public String memberSearch(int reqPage, SearchMember sm, Model model) {
		HashMap<String, Object> data = service.memberSearch(reqPage, sm);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		model.addAttribute("sm", sm);
		return "admin/memberSearch";
	}
	@RequestMapping(value="adminMemberView.do")
	public String memberView(int memberNo, Model model) {
		Member m = service.selectMemberInfo(memberNo);
		model.addAttribute("m", m);
		return "admin/memberView";
	}
	@RequestMapping(value="/adminMemberUpdate.do")
	public String memberUpdate(UpdateMember um, Model model) {
		System.out.println(um.getHelperStatus());
		int result = service.memberUpdate(um);
		if(result>0) {
			model.addAttribute("msg", "정보 수정 완료");
		}else {
			model.addAttribute("msg", "정보 수정 실패");
		}
		model.addAttribute("loc", "/adminMemberView.do?memberNo="+um.getMemberNo());
		return "common/msg";
	}
}
