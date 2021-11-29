package kr.or.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.service.MemberService;
import kr.or.member.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	//회원가입 이동 (일반회원or기업)
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
	
	//회원가입 이동
	@RequestMapping(value="/join")
	public String joinOwner() {
		return "member/join";
	}
	
	//아이디찾기 이동
	@RequestMapping(value="/searchId.do")
	public String searchId() {
		return "member/searchId";
	}
	
	//비밀번호찾기 이동
	@RequestMapping(value="/searchPw.do")
	public String searchPw() {
		return "member/searchPw";
	}
	
	//커뮤니티 이동
	@RequestMapping(value="/communityFrm.do")
	public String communityFrm() {
		return "community/communityFrm";
	}

	
}














