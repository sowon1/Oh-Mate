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
	@Transactional
	public int updateComment(HashMap<String, Object> map) {
		return dao.updateComment(map);
	}

	//댓글삭제
	@Transactional
	public int deleteComment(int commentNo) {
		return dao.deleteComment(commentNo);
	}

	//마이페이지_커뮤니티 게시글 보기
	public HashMap<String, Object> communityConfirm(int reqPage, String memberId) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberId", memberId);
		
		ArrayList<Board> list = dao.communityConfirm(map);
		int totalCount = dao.totalCount(memberId);
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
			pageNavi += "<a href='/communityList.do?reqPage="+(pageNo-1)+"&memberId="+memberId+"'>&laquo;</a></li>";
		}
		
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'>";
				pageNavi += "<a href='/communityList.do?reqPage="+pageNo+"&memberId="+memberId+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page-item-mate-mate'>";
				pageNavi += "<a href='/communityList.do?reqPage="+pageNo+"&memberId="+memberId+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
			if(pageNo <= totalPage) {
				pageNavi += "<li class='page-item-mate-mate'>";
				pageNavi += "<a href='/communityList.do?reqPage="+pageNo+"&memberId="+memberId+"'>";
				pageNavi += "&raquo;</a></li>";
			}
			pageNavi += "</ul>";
			
			map.put("pageNavi", pageNavi);
			map.put("list", list);
			map.put("start", start);
			return map;
	}

	//마이페이지_커뮤니티 댓글 보기
	public HashMap<String, Object> commentConfirm(int reqPage, String memberId) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberId", memberId);
		
		ArrayList<Board> list = dao.commentConfirm(map);
		int totalCount = dao.totalCountcm(memberId);
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
			pageNavi += "<a href='/myCommunity.do?reqPage="+(pageNo-1)+"&memberId="+memberId+"'>&laquo;</a></li>";
		}
		
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'>";
				pageNavi += "<a href='/myCommunity.do?reqPage="+pageNo+"&memberId="+memberId+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page-item-mate-mate'>";
				pageNavi += "<a href='/myCommunity.do?reqPage="+pageNo+"&memberId="+memberId+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
			if(pageNo <= totalPage) {
				pageNavi += "<li class='page-item-mate-mate'>";
				pageNavi += "<a href='/myCommunity.do?reqPage="+pageNo+"&memberId="+memberId+"'>";
				pageNavi += "&raquo;</a></li>";
			}
			pageNavi += "</ul>";
			
			map.put("pageNavi", pageNavi);
			map.put("list", list);
			map.put("start", start);
			return map;
	}

	//게시판 검색
	public ArrayList<Board> mateSearch(String keyword) {
		ArrayList<Board> list = dao.mateSearch(keyword);
		return list;
	}

	//더보기
	public ArrayList<Board> communityMore(int start) {
		int length = 8;
		int end = start+length-1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end", end);
		ArrayList<Board> list = dao.communityMore(map);
		//System.out.println("service:"+map);
		return list;
	}

	//조건검색
	public ArrayList<Board> searchOption(String profileOption) {
		return dao.searchOption(profileOption);
	}

	//메이트 게시글 신고
	@Transactional
	public int mateReport(int boardNo, int memberNo, String reportContent) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("memberNo", memberNo);
		map.put("reportContent", reportContent);
		return dao.mateReport(map);
	}

	//메이트 댓글 신고
	@Transactional
	public int commentReport(int commentNo, int memberNo, String reportContent) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("commentNo", commentNo);
		map.put("memberNo", memberNo);
		map.put("reportContent", reportContent);
		return dao.commentReport(map);
	}
	
	

}





