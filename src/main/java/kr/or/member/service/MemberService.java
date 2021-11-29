package kr.or.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.dao.MemberDao;
import kr.or.member.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

}
