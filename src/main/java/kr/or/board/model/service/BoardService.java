package kr.or.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.board.model.dao.BoardDao;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardMemberData;
import kr.or.board.model.vo.MateComment;
import kr.or.member.model.vo.Member;
import kr.or.profile.model.vo.Profile;

@Service
public class BoardService {
	@Autowired
	private BoardDao dao;

	//프로필 작성
	@Transactional
	public int insertProfile(Profile pr) {
		return dao.insertProfile(pr);
	}

	//프로필 조회
	public Profile selectProfile(String memberId) {
		return dao.selectProfile(memberId);
	}

	//프로필 수정
	@Transactional
	public int updateProfile(Profile pr) {
		return dao.updateProfile(pr);
	}

	//프로필 삭제
	@Transactional
	public int deleteProfile(String memberId) {
		return dao.deleteProfile(memberId);
	}
	
	//회원조회
	public Member selectOneMember(int memberNo) {
		return dao.selectOneMember(memberNo);
	}

	//회원조회
	public Member selectMember(String memberId) {
		return dao.selectMember(memberId);
	}
		
	//게시글 목록 조회
	public ArrayList<Board> selectBoard() {
		ArrayList<Board> list = dao.selectBoard();
		return list;
	}

	//게시글작성
	@Transactional
	public int insertBoard(Board b) {
		return dao.insertBoard(b);
	}

	//게시판 상세보기 이동 / 수정예정
	@Transactional
	public BoardMemberData selectBoardList(int boardNo) {
		dao.updateCount(boardNo);
		Board b = dao.selectBoardList(boardNo);
		ArrayList<Member> fileImg = dao.selectfileImg(boardNo);
		ArrayList<MateComment> list = dao.selectComment(boardNo);
		String profileOption = dao.selectBoardPr(boardNo);
		BoardMemberData bmd = new BoardMemberData(b,fileImg,list,profileOption);
		return bmd;
	}
	
	//게시판 수정 이동
	@Transactional
	public Board selectBoard(int boardNo) {
		Board b = dao.selectBoardList(boardNo);
		return b;
	}

	//게시글 수정
	@Transactional
	public int boardUpdate(Board b) {
		return dao.boardUpdate(b);
	}

	//게시글 삭제
	@Transactional
	public int boardDelete(int boardNo) {
		return dao.boardDelete(boardNo);
	}

	//댓글
	@Transactional
	public int insertComment(MateComment mc) {
		return dao.insertComment(mc);
	}

	//댓글수정
	public int updateComment(HashMap<String, Object> map) {
		return dao.updateComment(map);
	}

	//댓글삭제
	public int deleteComment(int commentNo) {
		return dao.deleteComment(commentNo);
	}

	//커뮤니티 게시글/댓글
	public HashMap<String, Object> communityConfirm(int reqPage) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Board> list = dao.communityConfirm(map);
		int totalCount = dao.totalCount();
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;  //시작
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item-mate-mate'>";
			pageNavi += "<a href='/communityConfirm.do?reqPage="+(pageNo-1)+"'>&laquo;</a></li>";
		}
		
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'>";
				pageNavi += "<a href='/communityConfirm.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page-item-mate-mate active'>";
				pageNavi += "<a href='/communityConfirm.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
			
			if(pageNo <= totalPage) {
				pageNavi += "<li class='page-item-mate-mate'>";
				pageNavi += "<a href='/communityConfirm.do?reqPage="+pageNo+"'>";
				pageNavi += "&raquo;</a></li>";
			}
			pageNavi += "</ul>";
			
			map.put("pageNavi", pageNavi);
			map.put("list", list);
			map.put("start", start);
		}
		return map;
	}

}





