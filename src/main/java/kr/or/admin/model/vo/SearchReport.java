package kr.or.admin.model.vo;

import lombok.Data;

@Data
public class SearchReport {
	private int[] status;
	private int[] cate;
	private String type;
	private String keyword;
}
