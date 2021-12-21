package kr.or.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.admin.model.dao.AdminDao;
import kr.or.admin.model.vo.Search;
import kr.or.admin.model.vo.UpdateMember;
import kr.or.common.Report;
import kr.or.helper.model.vo.Helper;
import kr.or.house.model.vo.House;
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

	public HashMap<String, Object> memberSearch(int reqPage, Search s) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("level", s.getLevel());
		map.put("type", s.getType());
		map.put("keyword", s.getKeyword());
		ArrayList<Member> list = dao.memberSearch(map);
		int totalCnt = dao.totalSearchCnt(map);
		int totalPage = (totalCnt % numPerPage == 0) ? (totalCnt / numPerPage) : (totalCnt / numPerPage + 1);
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize) * pageNaviSize +1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/adminMemberSearch.do?reqPage="+(pageNo-1)+"&type="+s.getType()+"&keyword="+s.getKeyword();
			if(s.getLevel() != null) {
				for(int i=0;i<s.getLevel().length;i++) {
					pageNavi += "&level="+s.getLevel()[i];
				}
			}
			pageNavi += "'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'><a href='/adminMemberSearch.do?reqPage="+pageNo+"&type="+s.getType()+"&keyword="+s.getKeyword();
				if(s.getLevel() != null) {
					for(int j=0;j<s.getLevel().length;j++) {
						pageNavi += "&level="+s.getLevel()[j];
					}
				}
				pageNavi += "'>"+pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item-mate-mate'><a href='/adminMemberSearch.do?reqPage="+pageNo+"&type="+s.getType()+"&keyword="+s.getKeyword();
				if(s.getLevel() != null) {
					for(int j=0;j<s.getLevel().length;j++) {
						pageNavi += "&level="+s.getLevel()[j];				
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
			pageNavi += "<li class='page-item-mate-mate'><a href='/adminMemberSearch.do?reqPage="+pageNo+"&type="+s.getType()+"&keyword="+s.getKeyword();
			if(s.getLevel() != null) {
				for(int i=0;i<s.getLevel().length;i++) {
					pageNavi += "&level="+s.getLevel()[i];				
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

	public HashMap<String, Object> reportSearch(int reqPage, Search s) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("status", s.getStatus());
		map.put("cate", s.getCate());
		map.put("type", s.getType());
		map.put("keyword", s.getKeyword());
		ArrayList<Report> list = dao.reportSearch(map);
		int totalCnt = dao.totalSearchReportCnt(map);
		int totalPage = (totalCnt % numPerPage == 0) ? (totalCnt / numPerPage) : (totalCnt / numPerPage + 1);
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize) * pageNaviSize +1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/reportSearch.do?reqPage="+(pageNo-1)+"&type="+s.getType()+"&keyword="+s.getKeyword();
			if(s.getStatus() != null) {
				for(int i=0;i<s.getStatus().length;i++) {
					pageNavi += "&status="+s.getStatus()[i];
				}
			}
			if(s.getCate() != null) {
				for(int i=0;i<s.getCate().length;i++) {
					pageNavi += "&cate="+s.getCate()[i];
				}
			}
			pageNavi += "'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'><a href='/reportSearch.do?reqPage="+pageNo+"&type="+s.getType()+"&keyword="+s.getKeyword();
				if(s.getStatus() != null) {
					for(int j=0;j<s.getStatus().length;j++) {
						pageNavi += "&status="+s.getStatus()[j];
					}
				}
				if(s.getCate() != null) {
					for(int j=0;j<s.getCate().length;j++) {
						pageNavi += "&cate="+s.getCate()[j];
					}
				}
				pageNavi += "'>"+pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item-mate-mate'><a href='/reportSearch.do?reqPage="+pageNo+"&type="+s.getType()+"&keyword="+s.getKeyword();
				if(s.getStatus() != null) {
					for(int j=0;j<s.getStatus().length;j++) {
						pageNavi += "&status="+s.getStatus()[j];				
					}
				}
				if(s.getCate() != null) {
					for(int j=0;j<s.getCate().length;j++) {
						pageNavi += "&cate="+s.getCate()[j];
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
			pageNavi += "<li class='page-item-mate-mate'><a href='/reportSearch.do?reqPage="+pageNo+"&type="+s.getType()+"&keyword="+s.getKeyword();
			if(s.getStatus() != null) {
				for(int i=0;i<s.getStatus().length;i++) {
					pageNavi += "&status="+s.getStatus()[i];				
				}
			}
			if(s.getCate() != null) {
				for(int i=0;i<s.getCate().length;i++) {
					pageNavi += "&cate="+s.getCate()[i];
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

	public HashMap<String, Object> selectAllHouse(int reqPage) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<House> list = dao.selectAllHouse(map);
		int totalCnt = dao.totalHouseCount();
		int totalPage = (totalCnt % numPerPage == 0) ? (totalCnt / numPerPage) : (totalCnt / numPerPage + 1);
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize) * pageNaviSize +1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/houseMgr.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'><a href='/houseMgr.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item-mate-mate'><a href='/houseMgr.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/houseMgr.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("pageNavi", pageNavi);
		data.put("list", list);
		data.put("start", start);
		return data;
	}

	public HashMap<String, Object> houseSearch(int reqPage, Search s) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("status", s.getStatus());
		map.put("addrName", s.getAddrName());
		map.put("type", s.getType());
		map.put("keyword", s.getKeyword());
		ArrayList<House> list = dao.houseSearch(map);
		int totalCnt = dao.totalSearchHouseCnt(map);
		int totalPage = (totalCnt % numPerPage == 0) ? (totalCnt / numPerPage) : (totalCnt / numPerPage + 1);
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize) * pageNaviSize +1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/adminHouseSearch.do?reqPage="+(pageNo-1)+"&type="+s.getType()+"&keyword="+s.getKeyword()+"&addrName="+s.getAddrName();
			if(s.getStatus() != null) {
				for(int i=0;i<s.getStatus().length;i++) {
					pageNavi += "&status="+s.getStatus()[i];
				}
			}
			pageNavi += "'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'><a href='/adminHouseSearch.do?reqPage="+pageNo+"&type="+s.getType()+"&keyword="+s.getKeyword()+"&addrName="+s.getAddrName();
				if(s.getStatus() != null) {
					for(int j=0;j<s.getStatus().length;j++) {
						pageNavi += "&status="+s.getStatus()[j];
					}
				}
				pageNavi += "'>"+pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item-mate-mate'><a href='/adminHouseSearch.do?reqPage="+pageNo+"&type="+s.getType()+"&keyword="+s.getKeyword()+"&addrName="+s.getAddrName();
				if(s.getStatus() != null) {
					for(int j=0;j<s.getStatus().length;j++) {
						pageNavi += "&status="+s.getStatus()[j];				
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
			pageNavi += "<li class='page-item-mate-mate'><a href='/adminHouseSearch.do?reqPage="+pageNo+"&type="+s.getType()+"&keyword="+s.getKeyword()+"&addrName="+s.getAddrName();
			if(s.getStatus() != null) {
				for(int i=0;i<s.getStatus().length;i++) {
					pageNavi += "&status="+s.getStatus()[i];				
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

	public House selectOneHouse(int houseNo) {
		House h = dao.selectOneHouse(houseNo);
		h.setHouseRoomView(dao.selectHouseRoom(houseNo));
		h.setPhotoList(dao.selectHousePhoto(houseNo));
		return h;
	}
	@Transactional
	public int updateHouse(House h) {
		return dao.updateHouse(h);
	}

	public HashMap<String, Object> selectAllHelper(int reqPage) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Helper> list = dao.selectAllHelper(map);
		int totalCnt = dao.totalHelperCount();
		int totalPage = (totalCnt % numPerPage == 0) ? (totalCnt / numPerPage) : (totalCnt / numPerPage + 1);
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize) * pageNaviSize +1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/helperMgr.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'><a href='/helperMgr.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item-mate-mate'><a href='/helperMgr.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/helperMgr.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("pageNavi", pageNavi);
		data.put("list", list);
		data.put("start", start);
		return data;
	}

	public HashMap<String, Object> helperSearch(int reqPage, Search s) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("status", s.getStatus());
		map.put("addrName", s.getAddrName());
		map.put("type", s.getType());
		map.put("keyword", s.getKeyword());
		ArrayList<Helper> list = dao.helperSearch(map);
		int totalCnt = dao.totalSearchHelperCnt(map);
		int totalPage = (totalCnt % numPerPage == 0) ? (totalCnt / numPerPage) : (totalCnt / numPerPage + 1);
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize) * pageNaviSize +1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/adminHelperSearch.do?reqPage="+(pageNo-1)+"&type="+s.getType()+"&keyword="+s.getKeyword()+"&addrName="+s.getAddrName();
			if(s.getStatus() != null) {
				for(int i=0;i<s.getStatus().length;i++) {
					pageNavi += "&status="+s.getStatus()[i];
				}
			}
			pageNavi += "'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'><a href='/adminHelperSearch.do?reqPage="+pageNo+"&type="+s.getType()+"&keyword="+s.getKeyword()+"&addrName="+s.getAddrName();
				if(s.getStatus() != null) {
					for(int j=0;j<s.getStatus().length;j++) {
						pageNavi += "&status="+s.getStatus()[j];
					}
				}
				pageNavi += "'>"+pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item-mate-mate'><a href='/adminHelperSearch.do?reqPage="+pageNo+"&type="+s.getType()+"&keyword="+s.getKeyword()+"&addrName="+s.getAddrName();
				if(s.getStatus() != null) {
					for(int j=0;j<s.getStatus().length;j++) {
						pageNavi += "&status="+s.getStatus()[j];				
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
			pageNavi += "<li class='page-item-mate-mate'><a href='/adminHelperSearch.do?reqPage="+pageNo+"&type="+s.getType()+"&keyword="+s.getKeyword()+"&addrName="+s.getAddrName();
			if(s.getStatus() != null) {
				for(int i=0;i<s.getStatus().length;i++) {
					pageNavi += "&status="+s.getStatus()[i];				
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

	public Helper selectOneHelper(int helperNo) {
		Helper hp = dao.selectOneHelper(helperNo);
		hp.setAddr(dao.selectHelperAddr(helperNo));
		return hp;
	}
	@Transactional
	public int updateHelper(Helper hp) {
		return dao.updateHelper(hp);
	}
}
