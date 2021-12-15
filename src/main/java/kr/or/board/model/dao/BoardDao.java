package kr.or.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
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

	//게시글목록조회
	public ArrayList<Board> selectBoard() {
		List<Board>	list = sqlSession.selectList("board.boardList");
		return (ArrayList<Board>)list;
	}

	//게시글작성
	public int insertBoard(Board b) {
		return sqlSession.insert("board.insertBoard",b);
	}



}




