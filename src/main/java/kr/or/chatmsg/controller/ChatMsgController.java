package kr.or.chatmsg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.chatmsg.model.service.ChatMsgService;

@Controller
public class ChatMsgController {
	@Autowired
	private ChatMsgService service;
}
