package kr.or.chatmsg.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chatmsg.model.vo.ChatMsg;

@Repository
public class ChatMsgDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//채팅 메세지 조회
	public ArrayList<ChatMsg> selectChatOneMsg(int chatNo) {
		List list = sqlSession.selectList("chatmsg.selectChatOneMsg",chatNo);
		return (ArrayList<ChatMsg>)list;
	}
}
