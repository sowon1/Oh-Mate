package kr.or.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.mail.Session;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.annotation.SessionScope;

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

	//댓글
	public int insertComment(MateComment mc) {
		return sqlSession.insert("board.insertComment",mc);
	}

	//댓글조회
	public ArrayList<MateComment> selectComment(int boardNo) {
		List<MateComment> list = sqlSession.selectList("board.selectComment",boardNo);
		return (ArrayList<MateComment>)list;
	}

	//댓글 프로필사진 넣기 / 수정예정
	public ArrayList<Member> selectfileImg(int boardNo) {
		List<Member> list = sqlSession.selectList("board.selectcommentMember",boardNo);
		return (ArrayList<Member>)list;
	}

	//댓글 수정
	public int updateComment(HashMap<String, Object> map) {
		return sqlSession.update("board.updateComment",map);
	}

	//댓글 삭제
	public int deleteComment(int commentNo) {
		return sqlSession.delete("board.delteComment",commentNo);
	}

	//게시판_프로필옵션
	public String selectBoardPr(int boardNo) {
		return sqlSession.selectOne("board.selectBoardPr",boardNo);
	}

	//마이페이지_커뮤니티 게시글 
	public ArrayList<Board> communityConfirm(HashMap<String, Object> map) {
		List<Board> list = sqlSession.selectList("board.communityConfirm",map);
		return (ArrayList<Board>)list;
	}

	//마이페이지_전체 게시물 수
	public int totalCount(String memberId) {
		return sqlSession.selectOne("board.totalCount",memberId);
	}

	//마이페이지_커뮤니티 댓글
	public ArrayList<Board> commentConfirm(HashMap<String, Object> map) {
		List<Board> list = sqlSession.selectList("board.commentConfirm",map);
		return (ArrayList<Board>)list;
	}

	//마이페이지_전체 댓글 수
	public int totalCountcm(String memberId) {
		return sqlSession.selectOne("board.totalCountcm",memberId);
	}

	//게시판 검색
	public ArrayList<Board> mateSearch(String keyword) {
		List<Board> list = sqlSession.selectList("board.mateSearch",keyword);
		return (ArrayList<Board>)list;
	}

	//더보기
	public ArrayList<Board> communityMore(HashMap<String, Object> map) {
		List<Board> list = sqlSession.selectList("board.communityMore",map);
		return (ArrayList<Board>)list;
	}

	//조건검색
	public ArrayList<Board> searchOption(String profileOption) {
		List<Board> list = sqlSession.selectList("board.searchOption",profileOption);
		return (ArrayList<Board>)list;
	}

	//메이트 게시글 신고
	public int mateReport(HashMap<String, Object> map) {
		return sqlSession.insert("board.mateReport",map);
	}

	//메이트 댓글 신고
	public int commentReport(HashMap<String, Object> map) {
		return sqlSession.insert("board.commentReport",map);
	}

	
}




