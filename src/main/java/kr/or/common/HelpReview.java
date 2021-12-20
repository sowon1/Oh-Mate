package kr.or.common;

import java.util.ArrayList;

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
}
