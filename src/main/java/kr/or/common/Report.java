package kr.or.common;

import lombok.Data;

@Data
public class Report {
	private int reportNo;			//신고번호
	private int reportCategory;		//분류 1.헬퍼 / 2. 채팅 / 3. 게시판 / 4. 댓글
	private int reportNum;			//분류번호 (헬퍼번호, 채팅방번호, 게시글번호, 댓글번호)
	private int reporter;			//신고자 - 회원번호
	private int atacker;			//가해자 - 회원번호
	private String reportContent;	//사유
	private String reportDate;		//신고일 YYYY-MM-DD
	private int reportStatus;		//상태 1. 미처리 / 2. 처리완료 / 3. 허위신고
}
