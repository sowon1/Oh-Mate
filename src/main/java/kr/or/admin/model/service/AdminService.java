package kr.or.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.admin.model.dao.AdminDao;
import kr.or.admin.model.vo.SearchMember;
import kr.or.admin.model.vo.SearchReport;
import kr.or.admin.model.vo.UpdateMember;
import kr.or.common.Report;
import kr.or.member.model.vo.Member;
import kr.or.profile.model.vo.Profile;

@Service
public class AdminService {
	@Autowired
	private AdminDao dao;

	public HashMap<String, Object> selectAllMember(int reqPage) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Member> list = dao.selectAllMember(map);
		int totalCnt = dao.totalCount();
		int totalPage = (totalCnt % numPerPage == 0) ? (totalCnt / numPerPage) : (totalCnt / numPerPage + 1);
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize) * pageNaviSize +1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/memberMgr.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'><a href='/memberMgr.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item-mate-mate'><a href='/memberMgr.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/memberMgr.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("pageNavi", pageNavi);
		data.put("list", list);
		data.put("start", start);
		return data;
	}

	public HashMap<String, Object> memberSearch(int reqPage, SearchMember sm) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("level", sm.getLevel());
		map.put("type", sm.getType());
		map.put("keyword", sm.getKeyword());
		ArrayList<Member> list = dao.memberSearch(map);
		int totalCnt = dao.totalSearchCnt(map);
		int totalPage = (totalCnt % numPerPage == 0) ? (totalCnt / numPerPage) : (totalCnt / numPerPage + 1);
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize) * pageNaviSize +1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/adminMemberSearch.do?reqPage="+(pageNo-1)+"&type="+sm.getType()+"&keyword="+sm.getKeyword();
			if(sm.getLevel() != null) {
				for(int i=0;i<sm.getLevel().length;i++) {
					pageNavi += "&level="+sm.getLevel()[i];
				}
			}
			pageNavi += "'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'><a href='/adminMemberSearch.do?reqPage="+pageNo+"&type="+sm.getType()+"&keyword="+sm.getKeyword();
				if(sm.getLevel() != null) {
					for(int j=0;j<sm.getLevel().length;j++) {
						pageNavi += "&level="+sm.getLevel()[j];
					}
				}
				pageNavi += "'>"+pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item-mate-mate'><a href='/adminMemberSearch.do?reqPage="+pageNo+"&type="+sm.getType()+"&keyword="+sm.getKeyword();
				if(sm.getLevel() != null) {
					for(int j=0;j<sm.getLevel().length;j++) {
						pageNavi += "&level="+sm.getLevel()[j];				
					}
				}
				pageNavi += "'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/adminMemberSearch.do?reqPage="+pageNo+"&type="+sm.getType()+"&keyword="+sm.getKeyword();
			if(sm.getLevel() != null) {
				for(int i=0;i<sm.getLevel().length;i++) {
					pageNavi += "&level="+sm.getLevel()[i];				
				}
			}
			pageNavi += "'>&gt;</a></li>";
		}
		pageNavi += "</ul>";
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("pageNavi", pageNavi);
		data.put("list", list);
		data.put("start", start);
		return data;
	}

	public Member selectMemberInfo(int memberNo) {
		return dao.selectMemberInfo(memberNo);
	}
	@Transactional
	public int memberUpdate(UpdateMember um) {
		return dao.memberUpdate(um);
	}

	public Profile selectProfile(String memberId) {
		return dao.selectProfile(memberId);
	}
	@Transactional
	public int insertProfile(Profile p) {
		return dao.insertProfile(p);
	}
	@Transactional
	public int updateProfile(Profile p) {
		return dao.updateProfile(p);
	}
	@Transactional
	public int deleteProfile(String pWriter) {
		return dao.deleteProfile(pWriter);
	}

	public HashMap<String, Object> selectAllReport(int reqPage) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Report> list = dao.selectAllReport(map);
		int totalCnt = dao.totalReportCount();
		int totalPage = (totalCnt % numPerPage == 0) ? (totalCnt / numPerPage) : (totalCnt / numPerPage + 1);
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize) * pageNaviSize +1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/reportMgr.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'><a href='/reportMgr.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item-mate-mate'><a href='/reportMgr.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/reportMgr.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("pageNavi", pageNavi);
		data.put("list", list);
		data.put("start", start);
		return data;
	}

	public HashMap<String, Object> reportSearch(int reqPage, SearchReport sr) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("status", sr.getStatus());
		map.put("cate", sr.getCate());
		map.put("type", sr.getType());
		map.put("keyword", sr.getKeyword());
		ArrayList<Report> list = dao.reportSearch(map);
		int totalCnt = dao.totalSearchReportCnt(map);
		int totalPage = (totalCnt % numPerPage == 0) ? (totalCnt / numPerPage) : (totalCnt / numPerPage + 1);
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize) * pageNaviSize +1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/reportSearch.do?reqPage="+(pageNo-1)+"&type="+sr.getType()+"&keyword="+sr.getKeyword();
			if(sr.getStatus() != null) {
				for(int i=0;i<sr.getStatus().length;i++) {
					pageNavi += "&status="+sr.getStatus()[i];
				}
			}
			if(sr.getCate() != null) {
				for(int i=0;i<sr.getCate().length;i++) {
					pageNavi += "&cate="+sr.getCate()[i];
				}
			}
			pageNavi += "'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'><a href='/reportSearch.do?reqPage="+pageNo+"&type="+sr.getType()+"&keyword="+sr.getKeyword();
				if(sr.getStatus() != null) {
					for(int j=0;j<sr.getStatus().length;j++) {
						pageNavi += "&status="+sr.getStatus()[j];
					}
				}
				if(sr.getCate() != null) {
					for(int j=0;j<sr.getCate().length;j++) {
						pageNavi += "&cate="+sr.getCate()[j];
					}
				}
				pageNavi += "'>"+pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item-mate-mate'><a href='/reportSearch.do?reqPage="+pageNo+"&type="+sr.getType()+"&keyword="+sr.getKeyword();
				if(sr.getStatus() != null) {
					for(int j=0;j<sr.getStatus().length;j++) {
						pageNavi += "&status="+sr.getStatus()[j];				
					}
				}
				if(sr.getCate() != null) {
					for(int j=0;j<sr.getCate().length;j++) {
						pageNavi += "&cate="+sr.getCate()[j];
					}
				}
				pageNavi += "'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/reportSearch.do?reqPage="+pageNo+"&type="+sr.getType()+"&keyword="+sr.getKeyword();
			if(sr.getStatus() != null) {
				for(int i=0;i<sr.getStatus().length;i++) {
					pageNavi += "&status="+sr.getStatus()[i];				
				}
			}
			if(sr.getCate() != null) {
				for(int i=0;i<sr.getCate().length;i++) {
					pageNavi += "&cate="+sr.getCate()[i];
				}
			}
			pageNavi += "'>&gt;</a></li>";
		}
		pageNavi += "</ul>";
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("pageNavi", pageNavi);
		data.put("list", list);
		data.put("start", start);
		return data;
	}

	public Report selectOneReport(int reportNo) {
		return dao.selectOneReport(reportNo);
	}
	@Transactional
	public int updateReport(Report rp) {
		return dao.updateReport(rp);
	}
}
