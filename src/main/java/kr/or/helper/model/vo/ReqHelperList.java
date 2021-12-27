package kr.or.helper.model.vo;

import lombok.Data;

@Data
public class ReqHelperList {
	private int helperNo;
	private int memberNo;
	private String helperCategory;
	private String helperName;
	private String helperStartTime;
	private String helperEndTime;
	private int helperRide;
	private String helperFilepath;
	private String helperCredit;
	private int helpNo;
	private int hMemberNo;
	private String helpTitle;
	private String helpContent;
	private int helpCategory;
	private String helpCharge;
	private int helpStatus;
	private String helpStartTime;
	private String helpEndTime;
	private String helpRequestDate;
	private String helpFinishDate;
	private String helpComplite;
	private int addressNo;
	private String addressCode;
	private String addressName;
	private String addressRoad;
	private String addressLegal;
	private String addressDetail;
	private String memberId;
	private String memberName;
	private String phone;
	private String email;
	
	public String gethelpContentBr() {
		return helpContent.replaceAll("\r\n", "<br>");
	}

	
}
