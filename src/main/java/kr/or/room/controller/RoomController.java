package kr.or.room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.room.model.dao.RoomService;

@Controller
public class RoomController {
	@Autowired
	private RoomService service;
}
