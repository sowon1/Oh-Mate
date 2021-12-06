package kr.or.common;

import lombok.Data;

@Data
public class Bookmark {
	private int bookmarkNo;			//찜 번호
	private int bookmarker;			//누른사람
	private int bookmarkNum;		//눌려진 것의 no (회원번호(헬퍼), 하우스번호, 후기번호 등)
	private int bookmarkCategory;	//구분용 (1. 헬퍼 / 2. 하우스 / 3. 후기)
	private String bookmarkDate;	//날짜 YYYY-MM-DD
}
