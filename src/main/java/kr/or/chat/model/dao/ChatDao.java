package kr.or.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chat.model.vo.Chat;

@Repository
public class ChatDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//채팅 리스트 조회
	public ArrayList<Chat> selectMateTalkList(int receiver) {
		List list = sqlSession.selectList("chat.selectMateTalkList",receiver);
		return (ArrayList<Chat>)list;
	}
	
}
