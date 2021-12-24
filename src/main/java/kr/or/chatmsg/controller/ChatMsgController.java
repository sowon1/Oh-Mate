package kr.or.chatmsg.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.chatmsg.model.service.ChatMsgService;
import kr.or.chatmsg.model.vo.ChatMsg;

@Controller
public class ChatMsgController {
	@Autowired
	private ChatMsgService service;
	
	//채팅 메세지 조회
	@ResponseBody
	@RequestMapping(value="/chatOpenMsg.do", produces = "application/json;charset=utf-8")
	public String chatOpenMsg(int chatNo) {
		ArrayList<ChatMsg> data = service.selectChatOneMsg(chatNo);
		return new Gson().toJson(data);
	}
}
