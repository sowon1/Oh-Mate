package kr.or.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.notice.model.dao.NoticeDao;
import kr.or.notice.model.vo.FileVO;
import kr.or.notice.model.vo.Notice;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;
	
	@Transactional
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

	public HashMap<String, Object> selectNoticeList(int reqPage) {
		// TODO Auto-generated method stub
		int numPerPage=10;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Notice> list = dao.selectNoticeList(map);
		
		int totalCount = dao.totalCount();
		int totalPage=0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage +1;
		}
		int pageNaviSize=5;
		int pageNo = 1;
		if(reqPage>4) {
			pageNo= reqPage-2;
			if(totalPage - reqPage < (pageNaviSize-1)) {
				pageNo = totalPage-(pageNaviSize-1);
			}
		}
		
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'><a href='/noticeList.do?reqPage="+(reqPage-1)+"'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'><a href='/noticeList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item'><a href='/noticeList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'><a href='/noticeList.do?reqPage="+(reqPage+1)+"'>&gt;</a><li>";
		}
		pageNavi += "</ul>";
		
		map.put("pageNavi", pageNavi);
		map.put("list",	list);
		
		return map;
	}

	@Transactional
	public Notice selectNotice(int noticeNo) {
		// TODO Auto-generated method stub
		dao.updateReadCount(noticeNo);
		Notice n = dao.selectNoticeList(noticeNo);
		return n;
	}

	@Transactional
	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.deleteNotice(noticeNo);
	}

	public Notice selectOneNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.selectNoticeList(noticeNo);
	}
	
	@Transactional
	public int deleteFile(int fileNo) {
		// TODO Auto-generated method stub
		return dao.deleteFile(fileNo);
	}

	@Transactional
	public int updateNotice(Notice n, ArrayList<FileVO> list) {
		// TODO Auto-generated method stub
		int result1 = dao.updateNotice(n);
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
