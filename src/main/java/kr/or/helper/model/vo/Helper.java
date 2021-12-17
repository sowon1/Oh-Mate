package kr.or.helper.model.vo;

import java.util.ArrayList;

import kr.or.common.Address;
import kr.or.common.Income;
import kr.or.common.Photo;
import lombok.Data;

@Data
public class Helper {
	private int helperNo;				//헬퍼번호
	private int memberNo;				//헬퍼요청할때 쓰는 회원번호
	private String helperName;			//닉네임
	private String helperCategory;		//심부름 항목
	private String helperStartTime;		//hh:mm 선호시작시간
	private String helperEndTime;		//hh:mm 선호 마감시간
	private int helperRide;				// 이동수단
	private int helperStatus;			// 1. 대기중/ 2. 승인/ 3. 미승인
	private String helperFilepath;		// 프로필사진(증빙용)
	private String helperIntro;			//자기소개
	private String helperCredit;		//헬퍼 자격증 사진
	private String helperRefuse;		//헬퍼 미승인 사유
	private Income income;
	private String likedCheck;				//좋아요 체크용
	private String likeCount;				//좋아요 카운트
}
