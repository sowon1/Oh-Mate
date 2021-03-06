package kr.or.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

	public ArrayList<Notice> selectNoticeList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<Notice> list = sqlSession.selectList("notice.selectList",map);
		return (ArrayList<Notice>)list;
	}

	public int totalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.totalCount");
	}

	public Notice selectNoticeList(int noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.selectNotice", noticeNo);
	}

	public int updateReadCount(int noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("notice.updateReadCount", noticeNo);
	}

	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		
		return sqlSession.delete("notice.deleteNotice", noticeNo);
	}

	public int deleteFile(int fileNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("notice.deleteFile", fileNo);
	}

	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.update("notice.updateNotice", n);
	}

	
}
