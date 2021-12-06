package kr.or.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	//로그인
	public Member selectOneMember(Member member) {
		return dao.selectOneMember(member);
	}

	/* 로그인2
	public int selectOneMember1(HashMap<String, Object> map) {
		return dao.selectOneMember1(map);
	} 
	*/

	//아이디찾기
	public Member searchId(Member member) {
		return dao.searchId(member);
	}

	//비밀번호찾기
	public Member searchPw(Member member) {
		return dao.searchPw(member);
	}

	//메이트 회원가입 
	public int join(Member m) {
		return dao.join(m);
	}

	//회원가입_아이디 중복체크
	public Member idCheck(String memberId) {
		return dao.idCheck(memberId);
	}

	//회원가입_이메일 중복체크
	public Member emailCheck(String email) {
		return dao.emailCheck(email);
	}


}
