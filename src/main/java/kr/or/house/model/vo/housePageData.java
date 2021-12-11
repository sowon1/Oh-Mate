package kr.or.house.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class housePageData {
	private ArrayList<House> list;
	private String pageNavi;
	private int start;
	private int totalCount;
	public housePageData(ArrayList<House> list, String pageNavi, int start, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
	}
	
}
