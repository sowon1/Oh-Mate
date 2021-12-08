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
		if(reqPage>3) {
			pageNo= reqPage-2;
			if(totalPage - reqPage < (pageNaviSize-1)) {
				pageNo = totalPage-(pageNaviSize-1);
			}
		}
		
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href='/noticeList?reqPage="+(reqPage-1)+".do'>[이전]</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi = "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/noticeList?reqPage="+pageNo+".do'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/noticeList?reqPage="+(reqPage+1)+".do'>[다음]</a>";
		}
		
		map.put("pageNavi", pageNavi);
		map.put("list",	list);
		
		return map;
	}

	@Transactional
	public Notice selectNotice(int noticeNo) {
		// TODO Auto-generated method stub
		int result = dao.updateReadCount(noticeNo);
		Notice n = dao.selectNoticeList(noticeNo);
		return n;
	}
	
}
