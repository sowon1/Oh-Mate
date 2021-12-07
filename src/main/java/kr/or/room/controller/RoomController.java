package kr.or.room.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.house.model.vo.House;
import kr.or.room.model.dao.RoomService;
import kr.or.room.model.vo.Room;

@Controller
public class RoomController {
	@Autowired
	private RoomService service;
	
	//하우스오너 방리스트 출력
	@RequestMapping(value = "/roomList.do")
	public String roomList(int houseNo,int memberNo) {
		ArrayList<Room> list = service.selectAllRoom(houseNo,memberNo);
		return "";
	}
}
