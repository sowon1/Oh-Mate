package kr.or.admin.model.vo;

import lombok.Data;

@Data
public class SearchHouse {
	private int[] status;
	private String addrName;
	private String type;
	private String keyword;
}
