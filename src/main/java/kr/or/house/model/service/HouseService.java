package kr.or.house.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.Address;
import kr.or.common.Housesearch;
import kr.or.common.Income;
import kr.or.common.Move;
import kr.or.common.Photo;
import kr.or.common.Tour;
import kr.or.house.model.dao.HouseDao;
import kr.or.house.model.vo.House;
import kr.or.house.model.vo.HouseResult;
import kr.or.house.model.vo.housePageData;
import kr.or.room.model.vo.Room;

@Service
public class HouseService {
	@Autowired
	private HouseDao dao;

	public HouseResult insertHouse(House h, Address address, Income i) {
		int result1 = dao.insertHouse(h); // 하우스등록 >> 등록 후 houseNo불러옴 >> address에 address_number에 대입
		if (result1 > 0) {
			System.out.println(h.getHouseNo());
			// 하우스 넘버를 넣어줌
			address.setAddressNumber(h.getHouseNo());
			int result2 = dao.insertAddress(address); // 주소등록(하우스주소)
			if (result2 > 0) {
				i.setIncomeNum(h.getHouseNo());
				int result3 = dao.insertIncome(i);// 계좌등록
				if (result3 > 0) {
					HouseResult hr = new HouseResult();
					hr.setHouseNo(h.getHouseNo());
					hr.setResult(result3);
					return hr;
				} else {
					return null;
				}
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	// 하우스 리스트 출력 - sowon
	public ArrayList<House> selectAllHouse(House h) {
		ArrayList<House> list = dao.selectAllHouse(h);
		for (int i = 0; i < list.size(); i++) {
			int houseNo = list.get(i).getHouseNo();
			ArrayList<Address> addressArray = dao.selectAddress(houseNo);
			list.get(i).setHouseAddressView(addressArray);
		}
		return list;
	}

	// 하우스 리스트 출력 - ajax - sowon
	public HashMap<String, Object> selectAjaxHouse(int pageNum, int memberNo) {
		// 한 페이지에 몇개 보여줄건지
		int numPerPage = 9;
		// 보여줄 페이지의 시작 ROWNUM - 0부터 시작
		// 보여줄 페이지의 끝 ROWNUM
		int end = pageNum * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo", memberNo);
		ArrayList<House> list = dao.selectAjaxHouse(map);
		for (int i = 0; i < list.size(); i++) {
			int houseNo = list.get(i).getHouseNo();
			ArrayList<Address> addressArray = dao.selectAddress(houseNo);
			list.get(i).setHouseAddressView(addressArray);
		}
		int totalRow = dao.selectAjaxTotal();
		// 전체 페이지의 갯수 구하기
		int totalPageCount = (totalRow % numPerPage == 0) ? (totalRow / numPerPage) : (totalRow / numPerPage + 1);
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("list", list);
		data.put("totalPageCount", totalPageCount);
		data.put("startPageNum", start);
		return data;
	}

	public int insertImgfiles(ArrayList<Photo> list, int houseNo) {
		int result = 0;
		for (Photo p : list) {
			p.setPhotoNum(houseNo);
			result += dao.insertImgFiles(p);
		}
		return result;
	}

	// 하우스 상세보기 - sowon
	public House selectHouseOneView(int houseNo, int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("houseNo", houseNo);
		map.put("memberNo", memberNo);
		House h = dao.selectHouseOneView(map);
		ArrayList<Room> houseRoomView = dao.selectHouseRoomView(houseNo);
		ArrayList<Photo> photoList = dao.selectHousePhotoView(houseNo);
		h.setPhotoList(photoList);
		h.setHouseRoomView(houseRoomView);
		return h;
	}

	// 하우스오너리스트 가져오기
	public housePageData selectHouseOwnerList(int memberNo, int reqPage) {
		// 한 페이지에 몇개 보여줄건지
		int numPerPage = 5;
		// 보여줄 페이지의 시작 ROWNUM - 0부터 시작
		// 보여줄 페이지의 끝 ROWNUM
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo", memberNo);
		ArrayList<House> list = dao.selectHouseOwnerList(map);
		for (int i = 0; i < list.size(); i++) {
			int houseNo = list.get(i).getHouseNo();

			ArrayList<Photo> photoArray = dao.selectPhoto(houseNo);
			ArrayList<Room> roomArray = dao.selectHouseRoomList(houseNo);
			for(int j = 0; j<roomArray.size();j++) {
				int roomNo = roomArray.get(j).getRoomNo();
				System.out.println(roomNo);
				ArrayList<Tour> tourArray = dao.selectTourList(roomNo);
				ArrayList<Move> moveArray = dao.selectMoveList(roomNo);
				int tourCount = dao.tourCount(roomNo);
				roomArray.get(j).setHouseTour(tourArray);
				roomArray.get(j).setHouseMove(moveArray);
				roomArray.get(j).setTourCount(tourCount);
			}
			ArrayList<Income> incomeArray = dao.selectIncome(houseNo);
			ArrayList<Address> addressArray = dao.selectAddress(houseNo);
			
			int roomCount = dao.selectCount(houseNo);
			if (list.get(i).getHouseAllow() == 2) {
				// 하우스 승인시==>하우스 판매중으로 변경
				int houseRoomCh1 = dao.updateRoomSelling1(list.get(i).getHouseNo());
				if (list.get(i).getHouseRoom() == list.get(i).getRoomCount()) {
					// 하우스 승인되있을 시 방이 다차면
					int houseRoomCh2 = dao.updateRoomSelling2(houseNo);
				}
			}
			list.get(i).setPhotoList(photoArray);
			list.get(i).setHouseRoomView(roomArray);
			list.get(i).setHouseIncome(incomeArray);
			list.get(i).setHouseAddressView(addressArray);
			list.get(i).setRoomCount(roomCount);

		}
		int totalCount = dao.houseTotalCount(memberNo);
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination pagination'>";
		if (pageNo != 1) {
			pageNavi += "<li class = 'page-item-mate'>";
			pageNavi += "<a class='page-link' href='/houseOwnerList.do?memberNo=" + memberNo + "&reqPage="
					+ (pageNo - 1) + "'>";
			pageNavi += "&lt;</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate active'>";
				pageNavi += "<a class='page-link' href='/houseOwnerList.do?memberNo=" + memberNo + "&reqPage=" + pageNo
						+ "'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item-mate'>";
				pageNavi += "<a class='page-link' href='/houseOwnerList.do?memberNo=" + memberNo + "&reqPage=" + pageNo
						+ "'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/houseownerList?reqPage=" + pageNo + "&memberNo=" + memberNo + "'>";
			pageNavi += "&gt;</a></li>";// ">" 표현 &gt
		}
		pageNavi += "</ul>";
		housePageData hpd = new housePageData(list, pageNavi, start, totalCount);
		return hpd;
	}

	// 투어신청 - sowon
	public int insertTour(Tour t) {
		return dao.insertTour(t);
	}

	// 하우스 업데이트 값 불러오기
	public House selectHouseUpdateOneView(int houseNo, int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("houseNo", houseNo);
		map.put("memberNo", memberNo);
		House h = dao.selectHouseUpdateOneView(map);
		ArrayList<Photo> arrayPhoto = dao.selectHousePhotoView(houseNo);
		ArrayList<Address> arrayAddress = dao.selectAddress(houseNo);
		ArrayList<Income> arrayIncome = dao.selectIncome(houseNo);
		h.setPhotoList(arrayPhoto);
		h.setHouseAddressView(arrayAddress);
		h.setHouseIncome(arrayIncome);
		return h;
	}

	public int deletePhoto(String[] delPhotoPath, int[] delPhotoNo) {
		int length = delPhotoNo.length;
		// 포토 삭제부분(for문이용)
		for (int i = 0; i < length; i++) {
			int result = dao.deletePhoto(delPhotoNo);
			if (result == 0) {
				return 0;
			}
		}
		return 1;
	}

	public int updateHouse(House h, Income i) {
		int result = dao.updateHouse(h);
		if (result > 0) {
			int houseNo = h.getHouseNo();
			int result2 = dao.updateIncome(i);
			if (result2 > 0) {
				return result2;
			} else {
				return 0;
			}
		} else {

			return 0;
		}
	}

	// 입주신청 페이지 이동 - 정보 넘겨주기
	public Room selectRoom(int roomNo, int houseNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("roomNo", roomNo);
		map.put("houseNo", houseNo);
		Room r = dao.selectRoom(map);
		ArrayList<House> house = dao.selectRoomHouse(houseNo);
		ArrayList<Photo> photoList = dao.selectHousePhotoView(houseNo);
		r.setPhotoList(photoList);
		r.setHouse(house);
		return r;
	}

	// 하우스 삭제
	public int deleteHouse(int memberNo, int houseNo) {
		// 하우스 삭제
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("houseNo", houseNo);
		int result = dao.deleteHouse(map);
		if (result > 0) {
			int result2 = dao.deleteAllroom(map);
			if (result2 > 0) {
				int result3 = dao.deleteIncome(map);
				if (result3 > 0) {
					int result4 = dao.deleteAddress(map);
					if (result4 > 0) {
						int result5 = dao.deleteAllPhoto(map);
						return result;
					} else {
						return 0;
					}
				} else {
					return 0;
				}
			} else {
				return 0;
			}
		} else {
			return 0;
		}
	}
	//하우스오너 하우스상세보기
	public House selectHouseownerOneHouse(int houseNo, int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("houseNo", houseNo);
		map.put("memberNo", memberNo);
		House h = dao.selectHouseownerOneHouse(map);
		return null;
	}

	//찜목록 불러오기-jjh
	public ArrayList<House> selectBookmarkHouse(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectBookmarkHouse(memberNo);
	}

}
