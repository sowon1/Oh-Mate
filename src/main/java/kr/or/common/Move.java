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
}
