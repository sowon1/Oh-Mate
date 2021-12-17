package kr.or.room.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.common.Move;
import kr.or.common.Pay;
import kr.or.house.model.vo.House;
import kr.or.room.model.dao.RoomService;
import kr.or.room.model.vo.Room;

@Controller
public class RoomController {
	@Autowired
	private RoomService service;
	
	//하우스오너 방리스트 출력
	@RequestMapping(value = "/roomList.do")
	public String roomList(int houseNo,int houseRoom,Model model) {
		ArrayList<Room> list = service.selectAllRoom(houseNo);
		model.addAttribute("list", list);
		model.addAttribute("houseRoom", houseRoom);
		model.addAttribute("houseNo", houseNo);
		return "room/roomList";
	}
	@RequestMapping(value = "/roomWriteFrm.do")
	public String roomWriteFrm(int houseNo,int houseRoom,Model model) {
		System.out.println(houseRoom);
		model.addAttribute("houseNo", houseNo);
		model.addAttribute("houseRoom", houseRoom);
		return "room/roomWriteFrm";
	}
	@RequestMapping(value = "/roomWrite.do")
	public String roomWrite(Room r,int houseRoom,Model model) {
		int houseNo=r.getHouseNo();
		System.out.println(houseNo);
		int result = service.insertRoom(r);
		if(result>0) {
			model.addAttribute("msg", "방 등록성공!!");
			return "redirect:/roomList.do?houseNo="+houseNo+"&houseRoom="+houseRoom;
			
		}else {
			model.addAttribute("msg", "방 등록실패!");
			return "redirect:/roomList.do?houseNo="+houseNo+"&houseRoom="+houseRoom;
		}
	}
	@RequestMapping(value = "/roomDel.do")
	public String roomDel(int houseNo, int roomNo,int houseRoom,Model model) {
		Room r = new Room();
		r.setHouseNo(houseNo);
		r.setRoomNo(roomNo);
		int result = service.deleteRoom(r);
		if(result>0) {
			model.addAttribute("msg", "삭제 성공");
			return "redirect:/roomList.do?houseNo="+houseNo+"&houseRoom="+houseRoom;
		}else {
			model.addAttribute("msg", "삭제 실패");
			return "redirect:/roomList.do?houseNo="+houseNo+"&houseRoom="+houseRoom;
		}
	}
	@RequestMapping(value = "/roomMod.do")
	public String roomMod(int houseNo, int roomNo, int houseRoom, Model model) {
		Room r = service.selectOneRoom(houseNo,roomNo);
		if(r!=null) {
			model.addAttribute("r", r);
			model.addAttribute("houseRoom", houseRoom);
			return "room/roomUpdateFrm";
		}else {
			model.addAttribute("msg", "조회하신 방이 없습니다.");
			return "redirect:/roomList.do?houseNo="+houseNo+"&houseRoom="+houseRoom;
		}
	}
	@RequestMapping(value = "/roomUpdate.do")
	public String roomUpdate(Room r,int houseRoom,Model model) {
		int result = service.updateRoom(r);
		int houseNo = r.getHouseNo();
		if(result>0) {
			model.addAttribute("msg", "수정성공");
			return "redirect:/roomList.do?houseNo="+houseNo+"&houseRoom="+houseRoom;
		}else {
			model.addAttribute("msg", "수정실패");
			return "redirect:/roomList.do?houseNo="+houseNo+"&houseRoom="+houseRoom;
		}
	}
	
	// 입주신청 - sowon
	@RequestMapping(value="/movePayment.do")
	public String movePayment(Pay p, Room r, Move m, int memberNo, Model model) {
		int result = service.insertMove(p,r,m,memberNo);
		if(result > 0) {
			return "/";
		}else {
			return "/";
		}
	}
	//하우스 오너 입주신청 & 투어신청 >> 결제내역까지 가져와야함
	@RequestMapping(value = "/roomTourMoveChk.do")
	public String roomTourMoveChk(int roomNo,int houseNo) {
		Room r = service.selectOneRoomTM(roomNo,houseNo);
		return"";
	}
}
