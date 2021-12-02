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

	/* 로그인2
	public int selectOneMember1(HashMap<String, Object> map) {
		return sqlSession.selectOne("member.selectOneMember1", map);
	}
	*/

}
