package kr.or.board.model.vo;

import java.util.ArrayList;

import kr.or.member.model.vo.Member;
import kr.or.profile.model.vo.Profile;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardMemberData {
	private Board b;
	private ArrayList<Member> fileImg;		 
	private ArrayList<MateComment> list;
	private String profileOption; 
}
