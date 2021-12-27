package kr.or.common;

import lombok.Data;

@Data
public class HelpReview {
	private int reviewNo;					//후기번호
	private int memberNo;					//작성자
	private int helperNo;					//헬퍼
	private String reviewTitle;				//제목
	private String reviewContent;			//내용
	private int asterion;					//별점
	private String reviewDate;				//작성시간
	private String likedCheck;				//좋아요 체크용
	private String likeCount;				//좋아요 카운트
	private String memberId;				//작성자 아이디
	private int star5;						//별점5
	private int star4;						//별점4
	private int helpNo;						//헬프번호		
}
