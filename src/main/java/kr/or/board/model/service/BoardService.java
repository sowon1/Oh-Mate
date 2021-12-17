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

	//게시판 상세보기 이동
	@Transactional
	public BoardMemberData selectBoardList(int boardNo) {
		dao.updateCount(boardNo);
		Board b = dao.selectBoardList(boardNo);
		ArrayList<MateComment> list = dao.selectComment(boardNo);
		BoardMemberData bmd = new BoardMemberData(b,list);
		return bmd;
	}
	
	//게시판 수정 이동
	public Board selectBoard(int boardNo) {
		dao.updateCount(boardNo);
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

}
