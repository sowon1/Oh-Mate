package kr.or.board.model.vo;

import java.util.ArrayList;

import kr.or.member.model.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardData {
	private ArrayList<Board> b;
	private int totalCount;
}
