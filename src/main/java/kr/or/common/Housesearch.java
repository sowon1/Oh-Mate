package kr.or.common;

import lombok.Data;

@Data
public class Housesearch {
	private String keyword;
	private int gender;
	private String room;
	private String housetype;
	private int roomCharge1;
	private int roomCharge2;
}
