package kr.or.chatmsg.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatMsgDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
