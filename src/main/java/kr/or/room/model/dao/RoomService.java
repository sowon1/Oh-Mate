package kr.or.room.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.Move;
import kr.or.common.Pay;
import kr.or.house.model.vo.House;
import kr.or.common.Tour;
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
	
	public HashMap<String, Object> tourRequestList(int memberNo, int reqPage) {
		// TODO Auto-generated method stub
		int numPerPage=3;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo",memberNo);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Tour> list = dao.selectTourRequest(map);
		int totalCount = dao.tourRequestCount(memberNo);
		int totalPage = 0;
		
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize=5;
		int pageNo=1;
		if(reqPage>4) {
			pageNo=reqPage-2;
			if(totalPage - reqPage < (pageNaviSize-1)) {
				pageNo = totalPage-(pageNaviSize-1);
			}
		}
		
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/tourRequestList.do?reqPage="+(reqPage-1)+"'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'><a href='/tourRequestList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item-mate-mate'><a href='/tourRequestList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/tourRequestList.do?reqPage="+(reqPage+1)+"'>&gt;</a><li>";
		}
		pageNavi += "</ul>";
		
		map.put("pageNavi", pageNavi);
		map.put("list",	list);
		
		return map;
	}

	public Room selectOneRoomTM(int roomNo, int houseNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("roomNo", roomNo);
		map.put("houseNo", houseNo);
		Room r = dao.selectOneRoomTM(map);
		return null;
	}
}