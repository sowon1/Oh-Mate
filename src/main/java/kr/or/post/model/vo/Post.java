package kr.or.post.model.vo;

import lombok.Data;

@Data
public class Post {
	private int postNo;		    // 쪽지번호
	private String postFrom;    // 수신자
	private String postTo;	    // 발신자
	private String postTitle;   // 쪽지제목
	private String postContent; // 쪽지내용
	private char postDate;		// 쪽지작성일 (YYYY-MM-DD HH:MM)
	private char postRead;	    // Y:읽음  N:안읽음
}
