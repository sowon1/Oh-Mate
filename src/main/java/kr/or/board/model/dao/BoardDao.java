package kr.or.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.MateComment;
import kr.or.member.model.vo.Member;
import kr.or.profile.model.vo.Profile;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//프로필 작성
	public int insertProfile(Profile pr) {
		return sqlSession.insert("board.insertProfile",pr);
	}

	//프로필 조회
	public Profile selectProfile(String memberId) {
		return sqlSession.selectOne("board.selectProfile",memberId);
	}

	//프로필 수정
	public int updateProfile(Profile pr) {
		return sqlSession.update("board.updateProfile",pr);
	}

	//프로필 삭제
	public int deleteProfile(String memberId) {
		return sqlSession.delete("board.deleteProfile",memberId);
	}

	//회원조회
	public Member selectOneMember(int memberNo) {
		return sqlSession.selectOne("board.selectOneMember",memberNo);
	}

	//회원조회
	public Member selectMember(String memberId) {
		return sqlSession.selectOne("board.selectMember",memberId);
	}

	//게시글 목록조회
	public ArrayList<Board> selectBoard() {
		List<Board>	list = sqlSession.selectList("board.bdList");
		return (ArrayList<Board>)list;
	}

	//게시글작성
	public int insertBoard(Board b) {
		return sqlSession.insert("board.insertBoard",b);
	}

	//게시글 조회수
	public int updateCount(int boardNo) {
		return sqlSession.update("board.updateCount",boardNo);
	}

	//게시판 상세보기 이동
	public Board selectBoardList(int boardNo) {
		return sqlSession.selectOne("board.boardList",boardNo);
	}

	//게시글 수정
	public int boardUpdate(Board b) {
		return sqlSession.update("board.boardUpdate",b);
	}

	//게시글 삭제
	public int boardDelete(int boardNo) {
		return sqlSession.delete("board.boardDelete",boardNo);
	}

	//게시글_회원 파일경로
	public String selectBoardMember(int boardNo) {
		return sqlSession.selectOne("board.selectBoardMember",boardNo);
	}

	//댓글
	public int insertComment(MateComment mc) {
		return sqlSession.insert("board.insertComment",mc);
	}

	//댓글조회
	public ArrayList<MateComment> selectComment(int boardNo) {
		List<MateComment> list = sqlSession.selectList("board.selectComment",boardNo);
		return (ArrayList<MateComment>)list;
	}

}




