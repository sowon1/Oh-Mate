package kr.or.room.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.Move;
import kr.or.common.Pay;
import kr.or.house.model.vo.House;
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
	//입주신청 - sowon
	public int insertMove(Pay p, Room r, Move m, int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("roomNo",r.getRoomNo());
		map.put("m", m);
		// 입주신청 등록 
		int result = dao.insertMove(map);
		if(result > 0) {
			map.put("houseNo",r.getHouseNo());
			// 하우스 - 방 업데이트 
			int house = dao.updateHouseRoom(map);
			House h =new House();
			int houseNo= r.getHouseNo();
			//하우스 정보조회
			h=dao.selectOneHouse(houseNo);
			int houseRoom = h.getHouseRoom();
			int houseSelling=h.getHouseSelling();
			int roomCount = dao.selectCountRoom(houseNo);
			if(houseRoom==roomCount && houseSelling==2) {
				int updateHouseSelling = dao.updatehouseSelling(houseNo);
				if(updateHouseSelling > 0) {
					map.put("p", p);
					// 결제 테이블 
					int pay = dao.insertMovePay(map);
					if(pay > 0) {
						System.out.println("결제테이블 등록 성공");
					}else {
						System.out.println("결제테이블 등록 실패");
					}
				}else {
					System.out.println("룸 업데이트 오류");
				}
			}else {
				
				if(house > 0) {
					map.put("p", p);
					// 결제 테이블 
					int pay = dao.insertMovePay(map);
					if(pay > 0) {
						System.out.println("결제테이블 등록 성공");
					}else {
						System.out.println("결제테이블 등록 실패");
					}
				}else {
					System.out.println("룸 업데이트 오류");
				}
			}
		}else {
			System.out.println("입주신청 오류..");
		}
		return result;
	}
}
