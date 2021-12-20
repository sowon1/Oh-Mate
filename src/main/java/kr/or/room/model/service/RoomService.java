package kr.or.room.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.Move;
import kr.or.common.Pay;
import kr.or.house.model.vo.House;
import kr.or.common.Tour;
import kr.or.room.model.dao.RoomDao;
import kr.or.room.model.vo.Room;
import kr.or.room.model.vo.RoomTMPageData;

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
	public RoomTMPageData selectOneRoomTM(int roomNo, int houseNo, int movePage, int tourPage) {
		
		//룸선택시 해당룸에 대한 투어 및 입주내역리스트 정의하기 위한 mapping값 설정
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("roomNo", roomNo);
		map.put("houseNo", houseNo);
		Room r = dao.selectOneRoomTM(map);
		
		//해당 룸 투어 내용 페이징 처리
		int tournumPerPage=5;
		int tourend = tourPage*tournumPerPage;
		int tourstart = tourend-tournumPerPage+1;
		map.put("tourstart", tourstart);
		map.put("tourend", tourend);
		
		ArrayList<Tour> tourlist= dao.selectAllTourList(map);
		for(int i=0; i<tourlist.size();i++) {
			int tourMemberNo=tourlist.get(i).getMemberNo();
			String tourMemberName=dao.selectOneMemberName(tourMemberNo);
			Tour t = tourlist.get(i);
			t.setMemberName(tourMemberName);
		}
		int tourTotalCount = dao.tourTotalCount(map);
		int tourTotalPage = 0;
		
		if(tourTotalCount%tournumPerPage == 0) {
			tourTotalPage = tourTotalCount/tournumPerPage;
		}else {
			tourTotalPage = tourTotalCount/tournumPerPage + 1;
		}
		
		int tourpageNaviSize=5;
		int tourpageNo=1;
		if(tourPage>4) {
			tourpageNo=tourPage-2;
			if(tourTotalPage - tourPage < (tourpageNaviSize-1)) {
				tourpageNo = tourTotalPage-(tourpageNaviSize-1);
			}
		}
		String tourpageNavi = "<ul class='pagination pagination-lg'>";
		if(tourpageNo != 1) {
			tourpageNavi += "<li class='page-item-mate-mate'><a href='/roomTourMoveChk.do?roomNo="+roomNo+"&houseNo="+houseNo+"&movePage=1&tourPage="+(tourPage-1)+"'>&lt;</a></li>";
		}
		for(int i=0;i<tourpageNaviSize;i++) {
			if(tourpageNo == tourPage) {
				tourpageNavi += "<li class='page-item-mate-mate active'><a href='/roomTourMoveChk.do?roomNo="+roomNo+"&houseNo="+houseNo+"&movePage=1&tourPage="+tourpageNo+"'>"+tourpageNo+"</a></li>";
			}else {
				tourpageNavi += "<li class='page-item-mate-mate'><a href='/roomTourMoveChk.do?roomNo="+roomNo+"&houseNo="+houseNo+"&movePage=1&tourPage="+tourpageNo+"'>"+tourpageNo+"</a></li>";
			}
			tourpageNo++;
			if(tourpageNo > tourTotalPage) {
				break;
			}
		}
		if(tourpageNo <= tourTotalPage) {
			tourpageNavi += "<li class='page-item-mate-mate'><a href='/roomTourMoveChk.do?roomNo="+roomNo+"&houseNo="+houseNo+"&movePage=1&tourPage="+(tourPage+1)+"'>&gt;</a><li>";
		}
		tourpageNavi += "</ul>";
		//해당 룸 입주 내용 페이징 처리
		int movenumPerPage=5;
		int moveend = movePage*movenumPerPage;
		int movestart = moveend-movenumPerPage+1;
		
		map.put("movestart", movestart);
		map.put("moveend", moveend);
		
		ArrayList<Move> movelist=dao.selectallMoveList(map);
		for (int j = 0; j < movelist.size(); j++) {
			int moveMemberNo=movelist.get(j).getMemberNo();
			String moveMemberName = dao.selectOneMemberName(moveMemberNo);
			Move m = movelist.get(j);
			m.setMemberName(moveMemberName);
		}
		int movetotalCount = dao.moveTotalCount(map);
		int movetotalPage = 0;
		
		if(movetotalCount%movenumPerPage == 0) {
			movetotalPage = movetotalCount/movenumPerPage;
		}else {
			movetotalPage = movetotalCount/movenumPerPage + 1;
		}
		
		int movepageNaviSize=5;
		int movepageNo=1;
		if(movePage>4) {
			movepageNo=movePage-2;
			if(movetotalPage - movePage < (movepageNaviSize-1)) {
				movepageNo = movetotalPage-(movepageNaviSize-1);
			}
		}
		
		String movepageNavi = "<ul class='pagination pagination-lg'>";
		if(movepageNo != 1) {
			movepageNavi += "<li class='page-item-mate-mate'><a href='/roomTourMoveChk.do?roomNo="+roomNo+"&houseNo="+houseNo+"&movePage="+(movePage-1)+"&tourPage=1'>&lt;</a></li>";
		}
		for(int i=0;i<movepageNaviSize;i++) {
			if(movepageNo == movePage) {
				movepageNavi += "<li class='page-item-mate-mate active'><a href='/roomTourMoveChk.do?roomNo="+roomNo+"&houseNo="+houseNo+"&movePage="+movepageNo+"&tourPage=1'>"+movepageNo+"</a></li>";
			}else {
				movepageNavi += "<li class='page-item-mate-mate'><a href='/roomTourMoveChk.do?roomNo="+roomNo+"&houseNo="+houseNo+"&movePage="+movepageNo+"&tourPage=1'>"+movepageNo+"</a></li>";
			}
			movepageNo++;
			if(movepageNo > movetotalPage) {
				break;
			}
		}
		if(movepageNo <= movetotalPage) {
			movepageNavi += "<li class='page-item-mate-mate'><a href='/roomTourMoveChk.do?roomNo="+roomNo+"&houseNo="+houseNo+"&movePage="+(movePage+1)+"&tourPage=1'>&gt;</a><li>";
		}
		movepageNavi += "</ul>";
		//룸vo에 투어 리스트 및 입주 리스트 넣기
		r.setRoomTour(tourlist);
		r.setRoomMove(movelist);
		RoomTMPageData rtm= new RoomTMPageData();
		rtm.setR(r);
		rtm.setTourStart(tourstart);
		rtm.setMoveStart(movestart);
		rtm.setTourPage(tourpageNavi);
		rtm.setMovePage(movepageNavi);
		return rtm;
	}

	public int updateTourStatus(int tourNo, int tourStatus) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tourNo", tourNo);
		map.put("tourStatus", tourStatus);
		int result = dao.updateTourStatus(map);
		return result;
	}
}