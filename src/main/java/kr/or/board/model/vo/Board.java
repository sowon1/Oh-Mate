package kr.or.board.model.vo;

import lombok.Data;

@Data
public class Board {
	private int boardNo;  		 // 게시판번호
	private String boardWriter;  // 작성자
	private String boardTitle;	 // 제목
	private String boardContent; // 내용
	private int readCount;		 // 조회수
	private String regDate;		 // 작성날짜(YYYY-MM-DD hh24:mi)
	private String filePath;	 // 첨부파일경로
	private String profileOption;// 프로필선택
	private int status;		     // 신고여부 1.신고없음 2.신고있음
	private String fileImg;		 // 회원파일이미지
	
	public String getboardContentBr() {
		return boardContent.replaceAll("\r\n","<br>");
	}
}
