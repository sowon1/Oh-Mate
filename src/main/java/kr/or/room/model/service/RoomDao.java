package kr.or.room.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
