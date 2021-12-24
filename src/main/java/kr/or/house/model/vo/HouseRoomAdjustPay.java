package kr.or.house.model.vo;


import lombok.Data;

@Data
public class HouseRoomAdjustPay {
	//정산내역관련한 하우스 제목 및 룸 정보 , 결제내역 , 정산내역 확인
	private String houseTitle;
	private String payId;
	private String payPrice;
	private String payDate;
	private String payStatus;
	private String payName;
	private String moveStart;
	private String moveEnd;
	private String movePhone;
	private String roomTitle;
	private int roomStatus;
	private String roomCharge;
	private String roomMonth;
	private String roomPersonnel;
	private int adjustNo;
}
