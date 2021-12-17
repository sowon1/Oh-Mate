package kr.or.house.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.Address;
import kr.or.common.Income;
import kr.or.common.Move;
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
	public ArrayList<House> selectAllHouse(HashMap<String, Object> map) {
		List<House> list = session.selectList("house.selectAllHouse",map);
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

	public int updateRoomSelling1(int houseNo) {
		int result = session.update("house.houseRoomSelling1",houseNo);
		return result;
	}

	public int updateRoomSelling2(int houseNo) {
		int result =session.update("house.houseRoomSelling2",houseNo);
		return result;
	}


	public House selectHouseUpdateOneView(HashMap<String, Object> map) {
		return session.selectOne("house.houseUpdateOne",map);
	}
	//하우스 수정중 사진삭제
	public int deletePhoto(int[] delPhotoNo) {
		
		return session.delete("house.housePhotoDelete",delPhotoNo);
	}
	//하우스 업데이트
	public int updateHouse(House h) {
		return session.update("house.houseUpdate", h);
	}
	//하우스 계좌업데이트
	public int updateIncome(Income i) {
		return session.update("house.incomeupdate", i);
	}

	//입주신청 페이지 이동 - 정보 넘겨주기.
	public Room selectRoom(HashMap<String, Object> map) {
		return session.selectOne("house.selectRoom",map);
	}
	//하우스 정보 조회
	public ArrayList<House> selectRoomHouse(int houseNo) {
		List<House> house = session.selectList("house.selectRoomHouse",houseNo);
		return (ArrayList<House>)house;
	}

	//하우스 삭제1-하우스삭제
	public int deleteHouse(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return session.delete("house.deleteHouse", map);
	}
	//하우스 삭제2-방삭제
	public int deleteAllroom(HashMap<String, Object> map) {
		
		return session.delete("house.deleteAllRoom",map);
	}
	//하우스 삭제3-계좌삭제
	public int deleteIncome(HashMap<String, Object> map) {
		
		return session.delete("house.deleteIncome",map);
	}
	//하우스 삭제 4-주소삭제
	public int deleteAddress(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return session.delete("house.deleteAddress",map);
	}
	//하우스 삭제5 - 사진삭제
	public int deleteAllPhoto(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return session.delete("house.deleteAllPhoto", map);
	}
	//하우스오너 하우스 상세보기 출력
	public House selectHouseownerOneHouse(HashMap<String, Object> map) {
		House h = session.selectOne("house.selectHouseownerOneHouse",map);
		return h;
	}
	//하우스오너 투어리스트
	public ArrayList<Tour> selectTourList(int roomNo) {
		List<Tour> list = session.selectList("house.selectTourList", roomNo);
		return (ArrayList<Tour>)list;
	}

	public ArrayList<Move> selectMoveList(int roomNo) {
		List<Move> list = session.selectList("house.selectMoveList", roomNo);
		return (ArrayList<Move>)list;
	}

	public int tourCount(int houseNo) {
		int result = session.selectOne("house.tourCount", houseNo);
		return result;
	}

	public ArrayList<House> selectBookmarkHouse(int memberNo) {
		// TODO Auto-generated method stub
		List<House> list = session.selectList("house.selectBookmarkHouse", memberNo);
		return (ArrayList<House>)list;
	}

	public int deletePhoto(Photo p) {
		return session.delete("house.deletePhoto",p);
	}

}
