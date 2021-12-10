package kr.or.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;
import kr.or.profile.model.vo.Profile;

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

	//회원가입
	@Transactional
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
	
	//마이페이지
	public Member selectMyPageFrm(String memberId) {
		System.out.println("memberId :" +  memberId);
		return dao.selectMyPageFrm(memberId);
	}

	//마이페이지_수정
	@Transactional
	public int myPageUpdate(Member member) {
		return dao.myPageUpdate(member);
	}

	//회원탈퇴
	@Transactional
	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}

	//프로필등록 이동
	public Profile profile(String memberId) {
		return dao.selectProfile(memberId);
	}
	
	//프로필 작성
	@Transactional
	public int insertProfile(Profile pr) {
		return dao.insertProfile(pr);
	}

	public Profile profileUpdate(String memberId) {
		return dao.profileUpdate(memberId);
	}



}
