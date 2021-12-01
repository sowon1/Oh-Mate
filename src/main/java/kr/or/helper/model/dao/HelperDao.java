package kr.or.helper.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HelperDao {
	@Autowired
	private SqlSessionTemplate session;
	
}
