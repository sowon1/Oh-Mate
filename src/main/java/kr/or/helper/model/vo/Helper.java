package kr.or.helper.model.vo;

import java.util.ArrayList;

import kr.or.common.HelpList;
import kr.or.common.HelpReview;
import kr.or.common.Income;
import lombok.Data;

@Data
public class Helper {
	private int helperNo;					//헬퍼번호
	private int memberNo;					//헬퍼요청할때 쓰는 회원번호
	private String helperName;				//닉네임
	private String helperCategory;			//심부름 항목
	private String helperStartTime;			//hh:mm 선호시작시간
	private String helperEndTime;			//hh:mm 선호 마감시간
	private int helperRide;					// 이동수단
	private int helperStatus;				// 1. 대기중/ 2. 승인/ 3. 미승인
	private String helperFilepath;			// 프로필사진(증빙용)
	private String helperIntro;				//자기소개
	private String helperCredit;			//헬퍼 자격증 사진
	private String helperRefuse;			//헬퍼 미승인 사유
	private Income income;
	private String likedCheck;				//좋아요 체크용
	private String likeCount;				//좋아요 카운트
	private String addressName;				//주소 (구)
	private String memberId;				//회원 아이디
	private String memberName;				//회원 이름
	private int memberLevel;				//관리자 페이지 사용, 활동 여부 판단용
	private int age;						// 성별구분 1.남 2.여
	private int gender;						// 나이구분 1.20대 2.30대 3.40대이상
	private ArrayList<HelpReview> review;	//후기 
	private String helpStatus3;				//헬프 신청 완료 카운트
	private String helpStatus4;				//헬프 신청 취소 카운트
}
