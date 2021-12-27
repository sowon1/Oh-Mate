package kr.or.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chat.model.vo.Chat;
import kr.or.common.Report;

@Repository
public class ChatDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//채팅 리스트 조회
	public ArrayList<Chat> selectMateTalkList(int receiver) {
		List list = sqlSession.selectList("chat.selectMateTalkList",receiver);
		return (ArrayList<Chat>)list;
	}
	//헬프 상세보기 채팅 버튼 눌렀을때 채팅 목록 있는지 조회
	public int chatSelect(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("chat.chatSelect",map);
		return result;
	}
	public int insertChat(HashMap<String, Object> map) {
		return sqlSession.insert("chat.insertChat",map);
	}
	//채팅 - 신고
	public int insertChatReport(Report report) {
		return sqlSession.insert("chat.insertChatReport",report);
	}
	
}
