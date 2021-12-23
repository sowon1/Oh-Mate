package kr.or.common;

import lombok.Data;

@Data
public class Move {
	private int moveNo;				//입주신청번호
	private int roomNo;				//방번호
	private int memberNo;			//회원번호
	private String moveStart;		//계약시작일
	private String moveEnd;			//퇴거일자
	private String movePhone;		//연락처
	private String memberName;		// 입주자 회원 이름
	private int houseNo;			//하우스 번호
	private String houseTitle;		//하우스 이름
	private String roomTitle;		//방이름
	private int payPrice;			//결제금액
	private String payDate;			//계약일
}
