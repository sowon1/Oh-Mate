package kr.or.room.model.vo;

import lombok.Data;

@Data
public class Room {
	private int roomNo;				//방번호
	private int houseNo;			//하우스번호
	private String roomTitle;		//방 이름
	private String roomSize;		//방 평수
	private String roomPhone;		//연락처
	private int roomStatus;			//상태
	private String roomCharge;		//보증금
	private String roomContent;		//방 상세내역
	private String roomPersonnel;	//방수용인원
	private String roomMonth;		//첫달월세
}
