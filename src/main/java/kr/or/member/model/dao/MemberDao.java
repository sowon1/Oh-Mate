package kr.or.member.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//로그인1
	public Member selectOneMember(Member member) {
		return sqlSession.selectOne("member.selectOneMember",member);
	}

	//아이디찾기
	public Member searchId(Member member) {
		return sqlSession.selectOne("member.searchId",member);
	}

	//비밀번호찾기
	public Member searchPw(Member member) {
		return sqlSession.selectOne("member.searchPw",member);
	}

	//메이트 회원가입 
	public int join(Member m) {
		return sqlSession.insert("member.join",m);
	}

	//회원가입_아이디 중복체크
	public Member idCheck(String memberId) {
		return sqlSession.selectOne("member.idCheck",memberId);
	}

	//회원가입_이메일 중복체크
	public Member emailCheck(String email) {
		return sqlSession.selectOne("member.emailCheck",email);
	}


	/* 로그인2
	public int selectOneMember1(HashMap<String, Object> map) {
		return sqlSession.selectOne("member.selectOneMember1", map);
	}
	*/

}
