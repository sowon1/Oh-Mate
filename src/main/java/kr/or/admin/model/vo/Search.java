package kr.or.admin.model.vo;

import lombok.Data;

@Data
public class Search {
	private int[] status;
	private int[] cate;
	private int[] level;
	private String addrName;
	private String type;
	private String keyword;
	private String startDate;
	private String endDate;
}
