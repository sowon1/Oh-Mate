package kr.or.member.model.vo;

import lombok.Data;

@Data
public class Member {
	private int memberNo;		// 회원번호
	private String memberId;	// 아이디
	private String memberPw;	// 비밀번호
	private String memberName;	// 회원이름
	private String phone;		// 전화번호 010-0000-0000
	private String email;		// 이메일
	private String enrollDate;	// 가입일 YYYY-MM-DD
	private String filepath;	// 파일경로
	private int memberLevel;	// 회원구분 0.관리자 1.메이트 2.하우스오너 3.계정정지(신고 3번 당할시/허위신고 5번) 4.이력없음(헬퍼) 5.헬퍼박탈 -> 5인 경우 헬퍼 신청 불가
	private int gender;			// 성별구분 1.남 2.여
	private int age;			// 나이구분 1.20대 2.30대 3.40대이상
	private int profileStatus;	// 프로필등록여부 1.등록 2.미등록
}
