package kr.or.board.model.vo;



import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardMemberData {
	private Board b;
	private ArrayList<MateComment> list;
}
