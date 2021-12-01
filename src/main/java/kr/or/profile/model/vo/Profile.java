package kr.or.profile.model.vo;

import lombok.Data;

@Data
public class Profile {
	private int pNo;		 // 프로필번호
	private String pWriter;  // 작성자
	private int pGender;	 // 1.남성 2.여성 3.상관없음
	private int pAge;		 // 1.20대  2.30대  3.40대이상
	private int pLocal;		 // 지역선택
	private int pSmoke;		 // 1.비흡연 2.흡연 
	private int pPet;		 // 1.없음 2.있음
	private int pCleaning;   // 1.좋아함 2.싫어함
	private int pPattern;    // 1.밤 2.낮
}
