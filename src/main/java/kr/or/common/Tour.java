package kr.or.common;

import java.util.ArrayList;

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
	private int houseNo;			//하우스 번호
	private String addressName;		//주소1
	private String addressRoad;     //주소2
	private String addressLegal;	//주소3
	private ArrayList<Photo> photoList; 	//사진테이블
	private String memberName;		//투어 신청자 이름 
	private String roomTitle;		//방 이름
	private int roomStatus;			//입실가능 여부
	private String roomPersonnel;	//몇 인실
}
