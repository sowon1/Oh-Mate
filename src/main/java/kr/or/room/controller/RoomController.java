package kr.or.room.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.common.Move;
import kr.or.common.Pay;
import kr.or.house.model.vo.House;
import kr.or.member.model.vo.Member;
import kr.or.room.model.service.RoomService;
import kr.or.room.model.vo.Room;
import kr.or.room.model.vo.RoomTMPageData;

@Controller
public class RoomController {
	@Autowired
	private RoomService service;

	// 하우스오너 방리스트 출력
	@RequestMapping(value = "/roomList.do")
	public String roomList(int houseNo, int houseRoom, Model model) {
		ArrayList<Room> list = service.selectAllRoom(houseNo);
		model.addAttribute("list", list);
		model.addAttribute("houseRoom", houseRoom);
		model.addAttribute("houseNo", houseNo);
		return "room/roomList";
	}

	@RequestMapping(value = "/roomWriteFrm.do")
	public String roomWriteFrm(int houseNo, int houseRoom, Model model) {
		System.out.println(houseRoom);
		model.addAttribute("houseNo", houseNo);
		model.addAttribute("houseRoom", houseRoom);
		return "room/roomWriteFrm";
	}

	@RequestMapping(value = "/roomWrite.do")
	public String roomWrite(Room r, int houseRoom, Model model) {
		int houseNo = r.getHouseNo();
		System.out.println(houseNo);
		int result = service.insertRoom(r);
		if (result > 0) {
			model.addAttribute("msg", "방 등록성공!!");
			return "redirect:/roomList.do?houseNo=" + houseNo + "&houseRoom=" + houseRoom;

		} else {
			model.addAttribute("msg", "방 등록실패!");
			return "redirect:/roomList.do?houseNo=" + houseNo + "&houseRoom=" + houseRoom;
		}
	}

	@RequestMapping(value = "/roomDel.do")
	public String roomDel(int houseNo, int roomNo, int houseRoom, Model model) {
		Room r = new Room();
		r.setHouseNo(houseNo);
		r.setRoomNo(roomNo);
		int result = service.deleteRoom(r);
		if (result > 0) {
			model.addAttribute("msg", "삭제 성공");
			return "redirect:/roomList.do?houseNo=" + houseNo + "&houseRoom=" + houseRoom;
		} else {
			model.addAttribute("msg", "삭제 실패");
			return "redirect:/roomList.do?houseNo=" + houseNo + "&houseRoom=" + houseRoom;
		}
	}

	@RequestMapping(value = "/roomMod.do")
	public String roomMod(int houseNo, int roomNo, int houseRoom, Model model) {
		Room r = service.selectOneRoom(houseNo, roomNo);
		if (r != null) {
			model.addAttribute("r", r);
			model.addAttribute("houseRoom", houseRoom);
			return "room/roomUpdateFrm";
		} else {
			model.addAttribute("msg", "조회하신 방이 없습니다.");
			return "redirect:/roomList.do?houseNo=" + houseNo + "&houseRoom=" + houseRoom;
		}
	}

	@RequestMapping(value = "/roomUpdate.do")
	public String roomUpdate(Room r, int houseRoom, Model model) {
		int result = service.updateRoom(r);
		int houseNo = r.getHouseNo();
		if (result > 0) {
			model.addAttribute("msg", "수정성공");
			return "redirect:/roomList.do?houseNo=" + houseNo + "&houseRoom=" + houseRoom;
		} else {
			model.addAttribute("msg", "수정실패");
			return "redirect:/roomList.do?houseNo=" + houseNo + "&houseRoom=" + houseRoom;
		}
	}

	// 입주신청 - sowon
	@RequestMapping(value = "/movePayment.do")
	public String movePayment(Pay p, Room r, Move m, int memberNo,Model model) {
		int result = service.insertMove(p, r, m, memberNo);
		if (result > 0) {
			model.addAttribute("loc","/moveInList.do?reqPage=1");
			return "common/msg";
		} else {
			return "/";
		}
	}

	// 하우스 오너 입주신청 & 투어신청 >> 결제내역까지 가져와야함
	@RequestMapping(value = "/roomTourMoveChk.do")
	public String roomTourMoveChk(int roomNo, int houseNo,int movePage,int tourPage,Model model,HttpSession session) {
		RoomTMPageData r = service.selectOneRoomTM(roomNo, houseNo,movePage,tourPage);
		int memberNo = 0;
		if(r == null) {
			if (session != null) {
				Member m = (Member) session.getAttribute("m");

				if (m != null) {
					memberNo = m.getMemberNo();
					model.addAttribute("msg", "오류)룸 정보가 없습니다.");
					return "redirect:/houseOwnerRoom.do?houseNo="+houseNo+"&memberNo="+memberNo;
				}
			}else {
				return "/";
			}
		}else{
			model.addAttribute("r", r.getR());
			model.addAttribute("movePage", r.getMovePage());
			model.addAttribute("moveStart",r.getMoveStart());
			model.addAttribute("totalMove", r.getMovetotalcnt());
			model.addAttribute("tourPage", r.getTourPage());
			model.addAttribute("tourStart", r.getTourStart());
			model.addAttribute("totalTour", r.getTourtotalcnt());
		}
		return "room/roomDetailPage";
		
	}
	@RequestMapping(value = "/updateTourStatus.do")
	public String updateTourStatus(int houseNo,int roomNo,int movePage,int tourPage,int tourStatus,int tourNo) {
			int result = service.updateTourStatus(tourNo,tourStatus);
		return "redirect:/roomTourMoveChk.do?roomNo="+roomNo+"&houseNo="+houseNo+"&movePage="+movePage+"&tourPage="+tourPage;
	}
}
