package kr.or.house.model.vo;

import java.util.ArrayList;

import kr.or.common.Photo;
import lombok.Data;

@Data
public class House {
	private int houseNo;				//하우스번호
	private int memberNo;				//하우스관련 회원번호
	private String houseTitle;			//제목
	private String houseownerDeadline;	//yyyy-mm-dd
	private String houseSelling;		//1. 판매중 / 2. 판매완료
	private String refuseReason;		//관리자가 미승인 처리시 마이페이지에서 사유 확인가능
	private String houseContent;		//하우스 시설소개 (집구조 사진까지 포함 summernote 사용)
	private int houseRoom;				//방갯수
	private String houseCharge;			// 대락적인 보증금
	private String houseRule;			// 규칙
	private String houseForm;			//주거형태(아파트,단독, 빌라 , 기타)
	private int houseGender;			//1,남 2. 여 3. 남녀공용
	private String houseConvenience;	//제공시설
	private int houseAllow;				//1. 승인대기 2, 승인 3, 승인거부
	private ArrayList<Photo> photoList; //사진테이블
}
