package kr.or.board.model.vo;

import lombok.Data;

@Data
public class MateComment {
	private int commentNo;		   // 댓글번호
	private String commentWriter;  // 댓글작성자
	private int boardNo;		   // 게시판번호 외래키로 참조
	private String commentContent; // 댓글내용
	private char regDate;		   // 작성일
	private int status;		       // 신고여부
}
