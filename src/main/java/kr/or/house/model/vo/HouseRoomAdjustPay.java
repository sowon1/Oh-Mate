package kr.or.house.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class HouseRoomAdjustPay {
	//정산내역관련한 하우스 제목 및 룸 정보 , 결제내역 , 정산내역 확인
	private int houseNo;
	private int memberNo;
	private String houseTitle;
	private int houseSelling;
	private int houseGender;
	private int roomNo;
	private String roomTitle;
	private String roomCharge;
	private String roomMonth;
	private int payNo;
	private String payId;
	private String payName;
	private String payNum;
	private String payPrice;
	private String payDate;
	private String payWay;
	private String payStatus;
	private String cancelDate;
	private int adjustNo;
	private int adjustStatus;
}
