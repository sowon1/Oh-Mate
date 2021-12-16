package kr.or.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.board.model.dao.BoardDao;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardMember;
import kr.or.board.model.vo.BoardMemberData;
import kr.or.member.model.vo.Member;
import kr.or.profile.model.vo.Profile;
import kr.or.profile.model.vo.ProfileData;

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
		
	//게시글목록조회
	public BoardMemberData selectBoard(Board b) {
		ArrayList<Board> list = dao.selectBoard();
		String filepath = dao.selectBoardMember(b);
		BoardMemberData bmd = new BoardMemberData(list,filepath);
		return bmd;
	}

	//게시글작성
	@Transactional
	public int insertBoard(Board b) {
		return dao.insertBoard(b);
	}

	//게시판 상세보기 이동
	@Transactional
	public ArrayList<Board> selectBoardList(int boardNo) {
		dao.updateCount(boardNo);
		ArrayList<Board> list = dao.selectBoardList(boardNo);
		return list;
	}

	//게시글 수정
	public int boardUpdate(Board b) {
		return dao.boardUpdate(b);
	}

	//게시글 삭제
	public int boardDelete(int boardNo) {
		return dao.boardDelete(boardNo);
	}

}
