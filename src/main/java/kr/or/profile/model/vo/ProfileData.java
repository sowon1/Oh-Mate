package kr.or.profile.model.vo;

import java.util.ArrayList;

import kr.or.board.model.vo.Board;
import lombok.Data;
@Data
public class ProfileData {
	public ProfileData(String p, ArrayList<Board> list) {
		// TODO Auto-generated constructor stub
	}
	private Profile p;
	private ArrayList<Board> list;
}
