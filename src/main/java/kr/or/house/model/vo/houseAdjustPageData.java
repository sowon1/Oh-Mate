package kr.or.house.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class houseAdjustPageData {
	private ArrayList<HouseRoomAdjustPay> list;
	private String pageNavi;
	private int start;
	private int totalCount;
}
