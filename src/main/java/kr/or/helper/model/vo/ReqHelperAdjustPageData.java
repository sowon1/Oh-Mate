package kr.or.helper.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ReqHelperAdjustPageData {
	private ArrayList<ReqHelperAdjust> list;
	private String pageNavi;
	private int start;
	private int totalCount;
}
