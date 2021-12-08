package kr.or.notice.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private int NoticeReadCount;
	private ArrayList<FileVO> list;
}
