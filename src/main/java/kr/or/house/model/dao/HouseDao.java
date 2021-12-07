package kr.or.house.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.Address;
import kr.or.common.Housesearch;
import kr.or.common.Income;
import kr.or.house.model.vo.House;

@Repository
public class HouseDao {
	@Autowired
	private SqlSessionTemplate session;

	public int insertHouse(House h) {
		int result = session.insert("house.insertHouse",h);
		return result;
	}

	public int insertAddress(Address address) {
		int result= session.insert("house.insertAddress",address);
		return result;
	}

	public int insertIncome(Income i) {
		int result = session.insert("house.insertIncome",i);
		return result;
	}
	//하우스 리스트 출력 - sowon
	public ArrayList<House> selectSearchHouse(Housesearch search) {
		List<House> list = session.selectList("house.selectSearchHouse",search);
		return (ArrayList<House>)list;
	}


}
