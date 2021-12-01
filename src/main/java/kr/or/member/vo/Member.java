package kr.or.member.vo;

import lombok.Data;

@Data
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String phone;
	private String email;
	private String enrollDate;
	private String filepath;
	private int memberLevel;
	private int gender;
	private int age;
	private int profileStatus;
}
