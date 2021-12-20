package kr.or.common;

import java.util.ArrayList;

import lombok.Data;

@Data
public class HelpList {
	private int helpNo;						//헬프신청번호
	private int memberNo;					//회원번호
	private int helperNo;					//헬퍼번호
	private String helpTitle;				//타이틀
	private String helpContent;				//헬프내용
	private String helpCategory;			//선호분야
	private String helpCharge;				//심부름비
	private int helpStatus;					//처리상태 [1.요청중 / 2.처리중 / 3. 처리완료 / 4. 취소]
	private String helpStartTime;			//시작시간 [HH:MM]
	private String helpEndTime;				//마감시간 [HH:MM]
	private String helpRequestDate;			//신청일시 [YYYY-MM-DD]
	private String helpFinishDate;			//처리일시 [YYYY-MM-DD]
	private String helpComplite;			//헬프완료내역
}
