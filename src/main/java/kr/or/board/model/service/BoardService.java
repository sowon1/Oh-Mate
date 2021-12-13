package kr.or.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.board.model.dao.BoardDao;
import kr.or.board.model.vo.Board;
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
	public int updateProfile(Profile pr) {
		return dao.updateProfile(pr);
	}

	//프로필 삭제
	public int deleteProfile(String memberId) {
		return dao.deleteProfile(memberId);
	}
		
	//게시글목록조회
	public ArrayList<Board> selectBoard() {
		ArrayList<Board> list = dao.selectBoard();
		return (ArrayList<Board>)list;
	}

	//게시글작성
	public int insertBoard(Board b) {
		return dao.insertBoard(b);
	}
	
}
