package kr.or.chat.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chat.model.dao.ChatDao;
import kr.or.chat.model.vo.Chat;
import kr.or.chatmsg.model.vo.ChatMsg;

@Service
public class ChatService {
	@Autowired
	private ChatDao dao;

	//채팅 리스트 조회
	public ArrayList<Chat> selectMateTalkList(int receiver) {
		return dao.selectMateTalkList(receiver);
	}
	//채팅 메세지 조회
	public ArrayList<ChatMsg> selectChatOneMsg(int chatNo) {
		ArrayList<ChatMsg> list = dao.selectChatOneMsg(chatNo);
		return list;
	}
}
