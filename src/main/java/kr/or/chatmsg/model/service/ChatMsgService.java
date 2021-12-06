package kr.or.chatmsg.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chatmsg.model.dao.ChatMsgDao;

@Service
public class ChatMsgService {
	@Autowired
	private ChatMsgDao dao;
}
