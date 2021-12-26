package kr.or.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chat.model.dao.ChatDao;
import kr.or.chat.model.vo.Chat;
import kr.or.chatmsg.model.dao.ChatMsgDao;
import kr.or.chatmsg.model.vo.ChatMsg;

@Service
public class ChatService {
	@Autowired
	private ChatDao dao;
	@Autowired
	private ChatMsgDao chdao;

	//채팅 리스트 조회
	public ArrayList<Chat> selectMateTalkList(int receiver) {
		return dao.selectMateTalkList(receiver);
	}
	//헬프 상세보기 채팅 버튼 눌렀을때 채팅 목록 있는지 조회
	public int chatSelect(int receiver, int helpNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("receiver", receiver);
		map.put("helpNo", helpNo);
		int chatNo = 0;
		chatNo = dao.chatSelect(map);
		if(chatNo == 0) {
			int result = dao.insertChat(map);
			if(result > 0) {
				chatNo = dao.chatSelect(map);
			}
		}		
		return chatNo;
	}
	public ArrayList<ChatMsg> selectChat(int chatNo) {
		ArrayList<ChatMsg> list = chdao.selectChatOneMsg(chatNo);
		return null;
	}
	
}
