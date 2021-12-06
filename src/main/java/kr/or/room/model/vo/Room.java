package kr.or.room.model.vo;

import lombok.Data;

@Data
public class Room {
	private int roomNo;
	private int houseNo;
	private String roomTitle;
	private String roomSize;
	private String roomPhone;
	private int roomStatus;
	private String roomCharge;
	private String roomContent;
	private String roomPersonnel;
	private String roomMonth;
}
