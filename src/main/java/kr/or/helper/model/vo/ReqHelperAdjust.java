package kr.or.helper.model.vo;

import lombok.Data;

@Data
public class ReqHelperAdjust {
	private String helperName;
	private String helperFilepath;
	private int helperRide;
	private String helperStartTime;
	private String helperEndTime;
	private String helperCategory;
	private String helperCredit;
	private String helpTitle;
	private String payId;
	private String payName;
	private String payDate;
	private String payPrice;
	private String payStatus;
	private String cancelDate;
}
