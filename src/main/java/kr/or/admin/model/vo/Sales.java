package kr.or.admin.model.vo;

import lombok.Data;

@Data
public class Sales {
	private int payNo;
	private int payCategory;
	private int payGoods;
	private int pMemberNo;
	private int sMemberNo;
	private String pMemberId;
	private String sMemberId;
	private String payDate;
	private String payPrice;
	private int settlement;
}
