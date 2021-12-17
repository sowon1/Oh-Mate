package kr.or.board.model.vo;

import lombok.Data;

@Data
public class MateComment {
	private int commentNo;		   // 댓글번호
	private int commentLevel;	   // 1:댓글, 2:대댓글
	private String commentWriter;  // 작성자
	private String commentContent; // 댓글내용
	private String regDate;		   // 작성일
	private int boardNo;		   // 게시판번호 참조
	private int boardRef;		   // 댓글 참조
	private int status;		       // 신고여부
}

