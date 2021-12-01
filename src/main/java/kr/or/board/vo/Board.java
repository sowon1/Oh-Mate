package kr.or.board.vo;

import lombok.Data;

@Data
public class Board {
	private int boardNo;  		 // 게시판번호
	private String boardWriter;  // 작성자
	private String boardTitle;	 // 제목
	private String boardContent; // 내용
	private int readCount;		 // 조회수
	private char regDate;		 // 작성날짜(YYYY-MM-DD HH:MM)
	private String filePath;	 // 첨부파일경로
	private String option;		 // 0/0/00/0/0/0/0
}
