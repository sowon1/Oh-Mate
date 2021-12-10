package kr.or.common;

import lombok.Data;

@Data
public class Address {
	private int addressNo; 				//주소 번호
	private int addressNumber; 			//1.하우스 번호 or 2.헬퍼번호
	private String addressCode;				//우편번호(addressCode??)
	private String addressName;			//서울시 강서구 (addressName)
	private String addressRoad;		// 판교역로 (addressRoad)
	private String addressLegal;			//화곡동(addressLegal)
	private int addressCategory;    
	private String addressDetail;	//상세주소
}
