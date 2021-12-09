package kr.or.room.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.room.model.service.RoomDao;
import kr.or.room.model.vo.Room;

@Service
public class RoomService {
	@Autowired
	private RoomDao dao;

	public ArrayList<Room> selectAllRoom(int houseNo) {
		ArrayList<Room> list=dao.selectAllRoom(houseNo);
		return list;
	}

	public int insertRoom(Room r) {
		int result = dao.insertRoom(r);
		return result;
	}

	public int deleteRoom(Room r) {
		int result = dao.deleteRoom(r);
		return result;
	}

	public Room selectOneRoom(int houseNo, int roomNo) {
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("houseNo", houseNo);
		map.put("roomNo", roomNo);
		Room r = dao.selectOneRoom(map);
		System.out.println(r.getRoomPersonnel());
		return r;
	}

	public int updateRoom(Room r) {
		int result = dao.updateRoom(r);
		return result;
	}
}
