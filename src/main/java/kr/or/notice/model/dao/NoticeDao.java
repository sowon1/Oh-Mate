package kr.or.notice.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.notice.model.vo.FileVO;
import kr.or.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.insert("notice.insertNotice",n);
	}

	public int insertFile(FileVO fv) {
		// TODO Auto-generated method stub
		return sqlSession.insert("notice.insertFile",fv);
	}
	
}
