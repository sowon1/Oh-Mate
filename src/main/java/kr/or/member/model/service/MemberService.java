package kr.or.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public Member selectOneMember(Member member) {
		return dao.selectOneMember(member);
	}

	/* 로그인2
	public int selectOneMember1(HashMap<String, Object> map) {
		return dao.selectOneMember1(map);
	} 
	*/

}
