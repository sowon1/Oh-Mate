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

	public ArrayList<Room> selectAllRoom(int houseNo, int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("houseNo", houseNo);
		map.put("memberNo", memberNo);
		ArrayList<Room> r=dao.selectAllRoom(map);
		return null;
	}
}
