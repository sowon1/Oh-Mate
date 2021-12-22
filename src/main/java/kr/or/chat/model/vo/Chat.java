package kr.or.chat.model.vo;

import lombok.Data;

@Data
public class Chat {
	private int chatNo;					//채팅방번호
	private int sender;					//보낸사람
	private int receiver;				//받는사람
	private String senderName;			//보낸사람 이름
	private String receiverName;		//받는사람 이름
	private String chatContent;			//마지막 대화 내용
	private String chatDate;			//보낸날짜
	private String readCount;			//안읽음개수
	private String filepath;			//보낸사람 프로필 경로
	private String messageDirection;	//보낸메세지, 받은메세지 구분용
}
