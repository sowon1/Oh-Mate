package kr.or.chatbot.model.vo;

import lombok.Data;

@Data
public class ChatBot {
	private int chatbotNo;			// 챗봇번호
	private String chatbotRequest;  // 챗봇질문
	private String chatbotAnswer;   // 챗봇답변
}
