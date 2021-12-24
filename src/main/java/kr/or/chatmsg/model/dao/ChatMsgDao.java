package kr.or.chatmsg.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chat.model.vo.Chat;
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
	//채팅방 번호 조회
	public int selectChatNo(HashMap<String, Object> map) {
		return sqlSession.selectOne("chatmsg.selectChatOneNo",map);
	}
	//상태 업데이트 읽음으로
	public int updateChatStatus(HashMap<String, Object> map) {
		return sqlSession.update("chatmsg.updateChatStatus",map);
	}
}
