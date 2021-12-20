package kr.or.house.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class housePageData {
	private ArrayList<House> list;
	private String pageNavi;
	private int start;
	private int totalCount;
	private int moveTotalCount;
	private int tourTotalCount;
	
}
