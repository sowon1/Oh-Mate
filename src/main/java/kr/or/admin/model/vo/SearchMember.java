package kr.or.admin.model.vo;

import lombok.Data;

@Data
public class SearchMember {
	private int[] level;
	private String type;
	private String keyword;
}
