package kr.or.common;

import lombok.Data;

@Data
public class Tour {
	private int tourNo;				//투어번호
	private int roomNo;				//방번호
	private int memberNo;			//회원번호
	private String tourPhone;		//연락처
	private String tourEmail;		//이메일
	private String houseName;		//하우스명
	private String tourQna;			//문의사항
	private String tourVisit;		//희망방문일
	private int tourStatus;			//상태구분
}
