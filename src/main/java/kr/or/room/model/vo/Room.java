package kr.or.room.model.vo;

import java.util.ArrayList;

import kr.or.common.Move;
import kr.or.common.Photo;
import kr.or.common.Tour;
import kr.or.house.model.vo.House;
import lombok.Data;

@Data
public class Room {
	private int roomNo;				//방번호
	private int houseNo;			//하우스번호
	private String roomTitle;		//방 이름
	private String roomSize;		//방 평수
	private String roomPhone;		//연락처
	private int roomStatus;			//상태
	private String roomCharge;		//보증금
	private String roomContent;		//방 상세내역
	private String roomPersonnel;	//방수용인원
	private String roomMonth;		//첫달월세
	ArrayList<House> house;			//해당 방이 있는 하우스 정보
	ArrayList<Photo> photoList;		//해당 방이 있는 하우스 사진
	private ArrayList<Tour> houseTour; //해당 방의 투어 리스트
	private ArrayList<Move> houseMove; //해당 방 입주 리스트(과거이력까지)
}
