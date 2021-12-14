package kr.or.chatmsg.model.vo;

import lombok.Data;

@Data
public class ChatMsg {
	private int messageNo;			//채팅방 번호 시퀀스
	private int chatNo;			//채팅 번호 참조하는거 (채팅리스트번호 참조 / 시퀀스 절대아님)
	private int sender;				//보낸사람
	private String messageContent;	//메세지
	private String messageDate;		//보낸시간 YYYY-MM-DD- HH:MM
	private String messageStatus;	//읽지않은 메세지 구분 Y : 읽음 / N : 읽지않음
}
