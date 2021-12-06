package kr.or.chat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chat.model.dao.ChatDao;

@Service
public class ChatService {
	@Autowired
	private ChatDao dao;
}
