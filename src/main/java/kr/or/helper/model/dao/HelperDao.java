package kr.or.helper.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.Address;
import kr.or.common.Income;
import kr.or.helper.model.vo.Helper;

@Repository
public class HelperDao {
	@Autowired
	private SqlSessionTemplate session;

	public int heplerRequestNoImg(Helper h) {
		
		return session.insert("helper.insertHelperReqNoImg",h);
	}

	public int insertAddress(Address addr) {
		// TODO Auto-generated method stub
		return session.insert("helper.insertAddress",addr);
	}

	public int insertHouseAndImg(Helper h) {
		// TODO Auto-generated method stub
		System.out.println(h);
		return session.insert("helper.insertHelperAndImg",h);
	}

	public Helper selectOneHelper(String helperName) {
		return session.selectOne("helper.selectOneHelper",helperName);
	}

	public int insertIncomeHelper(Income i2) {
		// TODO Auto-generated method stub
		return session.insert("helper.insertIncomeHelper",i2);
		
	}

	public Helper selectOneHelperMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("helper.selectOneHelperMemberNo",memberNo);
	}

	public Income selectOneIncome(int helperNo) {
		
		return session.selectOne("helper.selectOneIncome", helperNo);
	}
	
}
