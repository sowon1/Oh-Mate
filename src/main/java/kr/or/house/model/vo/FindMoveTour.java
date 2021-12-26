package kr.or.house.model.vo;

import java.util.ArrayList;

import kr.or.common.Move;
import kr.or.common.Tour;
import lombok.Data;

@Data
public class FindMoveTour {
	private ArrayList<Move> moveList;
	private ArrayList<Tour> tourList;
}
