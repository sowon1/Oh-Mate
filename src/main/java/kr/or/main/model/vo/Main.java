package kr.or.main.model.vo;

import java.util.ArrayList;

import kr.or.helper.model.vo.Helper;
import kr.or.house.model.vo.House;
import lombok.Data;

@Data
public class Main {
	private ArrayList<House> hlist;
	private ArrayList<Helper> hplist;
	private int memcount;
}
