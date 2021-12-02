package kr.or.member.controller;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	//로그인1
	@RequestMapping(value="/login.do")
	public String login(Member member, HttpSession session, Model model) {
		Member m = service.selectOneMember(member);
		if(m != null) {
			session.setAttribute("m", m);
			model.addAttribute("msg","로그인 성공~!");
		}else {
			model.addAttribute("msg","아이디 또는 비밀번호를 다시 확인해주세요.");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	/* 로그인2 
	@RequestMapping(value="/login.do")
	public String login1(Member member, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", member.getMemberId());
		map.put("memberPw", member.getMemberPw());
		int m = service.selectOneMember1(map);
		if(m == 1) {
			model.addAttribute("msg","로그인 성공");
		}else {
			model.addAttribute("msg","아이디 또는 비밀번호를 확인해주세요");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	 */

	
	
	//로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//회원가입 이동 (일반회원or기업)
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
	
	//메이트 회원가입 이동
	@RequestMapping(value="/joinMate")
	public String joinMate() {
		return "member/joinMate";
	}
	
	//하우스오더 회원가입 이동
	@RequestMapping(value="/joinOwner")
	public String joinOwner() {
		return "member/joinOwner";
	}
	
	//아이디찾기 이동
	@RequestMapping(value="/searchIdFrm.do")
	public String searchIdFrm() {
		return "member/searchId";
	}
 	
	//아이디찾기
	@RequestMapping(value="/searchId.do")
	public String searchId(Member member, Model model) {
		Member m = service.searchId(member);
		if(m != null) {
			model.addAttribute("msg","아이디는 ["+m.getMemberId()+"] 입니다.");
			
		}else {
			model.addAttribute("msg","회원정보가 없습니다.");
		}
		model.addAttribute("loc","/");
		return "common/msg";	
	}
	
	//비밀번호찾기 이동
	@RequestMapping(value="/searchPwFrm.do")
	public String searchPwFrm() {
		return "member/searchPw";
	}
	
	//비밀번호 찾기
	@RequestMapping(value="/searchPw.do")
	public String searchPw(Member member, Model model) {
		Member m = service.searchPw(member);
		if(m != null) {
			model.addAttribute("msg","비밀번호는 ["+m.getMemberPw()+"] 입니다.");
		}else {
			model.addAttribute("msg","회원정보가 없습니다.");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	//커뮤니티 이동
	@RequestMapping(value="/communityFrm.do")
	public String communityFrm() {
		return "community/communityFrm";
	}

	
}














