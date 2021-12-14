package kr.or.helper.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.helper.model.vo.Helper;

@Repository
public class HelperDao {
	@Autowired
	private SqlSessionTemplate session;

	public int heplerRequestNoImg(Helper h) {
		
		return session.insert("helper.insertHelperReqNoImg",h);
	}
	
}
