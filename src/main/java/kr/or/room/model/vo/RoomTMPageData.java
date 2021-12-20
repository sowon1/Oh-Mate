package kr.or.room.model.vo;

import lombok.Data;

@Data
public class RoomTMPageData {
	private Room r;
	private String movePage;
	private String tourPage;
	private int moveStart;
	private int tourStart;
	private int movetotalcnt;
	private int tourtotalcnt;
}
