package kr.or.chat.model.vo;

import lombok.Data;

@Data
public class Chat {
	private int chatNo;		//채팅방번호
	private int sender;		//보낸사람
	private int receiver;	//받는사람
}
