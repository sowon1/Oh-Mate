package kr.or.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;

@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Member> selectAllMember(HashMap<String, Object> map) {
		List<Member> list = session.selectList("admin.selectAllMember", map);
		return (ArrayList<Member>)list;
	}

	public int totalCount() {
		return session.selectOne("admin.memberTotal");
	}
}
