package kr.or.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.notice.model.dao.NoticeDao;
import kr.or.notice.model.vo.FileVO;
import kr.or.notice.model.vo.Notice;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;

	public ArrayList<Notice> selectAllNotice() {
		// TODO Auto-generated method stub
		
		return null;
	}

	public int insertNotice(Notice n, ArrayList<FileVO> list) {
		// TODO Auto-generated method stub
		int result1 = dao.insertNotice(n);
		int result = 0;
		if(result1>0) {
			for(FileVO fv : list) {
				fv.setNoticeNo(n.getNoticeNo());
				result += dao.insertFile(fv);
			}
		}else {
			return -1;
		}
		return result;
	}
}
