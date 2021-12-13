package kr.or.house.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.Address;
import kr.or.common.Housesearch;
import kr.or.common.Income;
import kr.or.common.Photo;
import kr.or.common.Tour;
import kr.or.house.model.vo.House;
import kr.or.room.model.vo.Room;

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
	public ArrayList<House> selectAllHouse(House h) {
		List<House> list = session.selectList("house.selectAllHouse",h);
		return (ArrayList<House>)list;
	}
	//하우스 리스트 출력 - ajax - sowon
	public ArrayList<House> selectAjaxHouse(HashMap<String, Object> map) {
		List<House> list = session.selectList("house.selectAjaxHouse",map);
		return (ArrayList<House>)list;
	}
	//글의 개수
	public int selectAjaxTotal() {		
		return session.selectOne("house.houseTotal");
	}


	public int insertImgFiles(Photo p) {
		int result =session.insert("house.insertImgFile",p);
		return result;
	}
	//하우스 상세보기 - sowon
	public House selectHouseOneView(HashMap<String, Object> map) {
		return session.selectOne("house.selectHouseOneView",map);
	}
	//하우스 오너 리스트 출력
	public ArrayList<House> selectHouseOwnerList(HashMap<String, Object> map) {
		List<House> h = session.selectList("house.selectHouseOwnerList", map);
		return (ArrayList<House>)h;
	}
	//하우스 상세보기 - 룸 정보
	public ArrayList<Room> selectHouseRoomView(int houseNo) {
		List<Room> houseRoomView = session.selectList("house.selectHouseRoomView",houseNo);
		return (ArrayList<Room>)houseRoomView;
	}
	//하우스 상세보기 - 사진 정보
	public ArrayList<Photo> selectHousePhotoView(int houseNo) {
		List<Photo> photoList = session.selectList("house.selectHousePhotoView",houseNo);
		return (ArrayList<Photo>)photoList;
	}
	//하우스오너 리스트 출력
	public ArrayList<Photo> selectPhoto(int houseNo) {
		List<Photo> photo = session.selectList("house.selelctPhotolist",houseNo);
		return (ArrayList<Photo>)photo;
	}

	public ArrayList<Room> selectHouseRoomList(int houseNo) {
		List<Room> room = session.selectList("house.selectHouseRoomView",houseNo); 
		return (ArrayList<Room>)room;
	}

	public ArrayList<Income> selectIncome(int houseNo) {
		List<Income> income = session.selectList("house.selectIncomeList",houseNo);
		return (ArrayList<Income>)income;
	}

	public ArrayList<Address> selectAddress(int houseNo) {
		List<Address> address = session.selectList("house.selectAddressList",houseNo);
		return (ArrayList<Address>)address;
	}

	public int selectCount(int houseNo) {
		int roomCount= session.selectOne("house.selectRoomCount",houseNo);
		return roomCount;
	}

	public int houseTotalCount(int memberNo) {
		int totalCount = session.selectOne("house.houseTotalCount", memberNo);
		return totalCount;
	}
	//투어신청 - sowon
	public int insertTour(Tour t) {
		return session.insert("house.insertTour",t);
	}

}
