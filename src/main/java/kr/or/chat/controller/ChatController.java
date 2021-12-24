package kr.or.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.chat.model.service.ChatService;
import kr.or.chat.model.vo.Chat;
import kr.or.chatmsg.model.vo.ChatMsg;

@Controller
public class ChatController {
	@Autowired
	private ChatService service;
	
	//채팅 리스트 조회
	@ResponseBody
	@RequestMapping(value="/matetalkList.do", produces = "application/json;charset=utf-8")
	public String matetalkList(int receiver) {
		ArrayList<Chat> data = service.selectMateTalkList(receiver);
		return new Gson().toJson(data);
	}
	
}
