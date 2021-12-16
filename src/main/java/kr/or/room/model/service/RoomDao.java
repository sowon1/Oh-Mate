package kr.or.room.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.house.model.vo.House;
import kr.or.room.model.vo.Room;

@Repository
public class RoomDao {
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Room> selectAllRoom(int houseNo) {
		List<Room> list = session.selectList("room.selectAllRoom",houseNo);
		return (ArrayList<Room>)list;
	}

	public int insertRoom(Room r) {
		int result = session.insert("room.insertRoom",r);
		return result;
	}

	public int deleteRoom(Room r) {
		int result =session.delete("room.deleteRoom",r);
		return result;
	}

	public Room selectOneRoom(HashMap<String, Object> map) {
		Room r = session.selectOne("room.selectOneRoom",map);
		return r;
	}

	public int updateRoom(Room r) {
		int result=session.update("room.updateRoom",r);
		return result;
	}
	// 입주신청 - sowon
	public int insertMove(HashMap<String, Object> map) {
		return session.insert("room.insertMove",map);
	}
	// 입주신청 - room 상태 변경 - sowon
	public int updateHouseRoom(HashMap<String, Object> map) {
		return session.update("room.updateHouseRoom",map);
	}
	// 결제정보 - sowon
	public int insertMovePay(HashMap<String, Object> map) {
		return session.insert("room.insertMovePay",map);
	}

	public House selectOneHouse(int houseNo) {
		// TODO Auto-generated method stub
		return session.selectOne("room.houseOneSelect", houseNo);
	}

	public int selectCountRoom(int houseNo) {
		
		return session.selectOne("room.selectRoomCount",houseNo);
	}

	public int updatehouseSelling(int houseNo) {
		
		return session.update("room.updateHouseSelling", houseNo);
	}
}
