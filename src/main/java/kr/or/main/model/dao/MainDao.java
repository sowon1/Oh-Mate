package kr.or.main.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.helper.model.vo.Helper;
import kr.or.house.model.vo.House;
import kr.or.main.model.vo.Main;

@Repository
public class MainDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	//전체 헬퍼 조회
	public ArrayList<Helper> selectHelperList() {
		List<Helper> helperList = sqlSession.selectList("main.helperList");
		return (ArrayList<Helper>)helperList;
	}
	//전체 하우스 조회
	public ArrayList<House> selectHouseList() {
		List<House> houseList = sqlSession.selectList("main.houseList");
		return (ArrayList<House>)houseList;
	}
	//토탈 조회
	public int total() {
		return sqlSession.selectOne("main.membertotal");
	}
}
