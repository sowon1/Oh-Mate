package kr.or.helper.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.common.Address;
import kr.or.common.HelpList;
import kr.or.common.HelpReview;
import kr.or.common.Income;
import kr.or.common.Pay;
import kr.or.common.Photo;
import kr.or.common.Report;
import kr.or.helper.model.dao.HelperDao;
import kr.or.helper.model.vo.Helper;
import kr.or.helper.model.vo.ReqHelpListPageData;
import kr.or.helper.model.vo.ReqHelperAdjust;
import kr.or.helper.model.vo.ReqHelperAdjustPageData;
import kr.or.helper.model.vo.ReqHelperList;
import kr.or.house.model.dao.HouseDao;
import kr.or.house.model.vo.House;
import kr.or.member.model.vo.Member;

@Service
public class HelperService {
	@Autowired
	private HelperDao dao;
	@Autowired
	private HouseDao hdao;

	// 사진없을때
	public int helperRequestNoImg(Helper h, Income i2, String[] addressCode, String[] addressName, String[] addressRoad,
			String[] addressLegal) {
		int result = dao.heplerRequestNoImg(h);
		if (result > 0) {
			// 배열인 주소 하나씩 꺼내기
			int helperNo = h.getHelperNo();
			for (int i = 0; i < addressCode.length; i++) {
				Address addr = new Address();
				addr.setAddressCode(addressCode[i]);
				addr.setAddressName(addressName[i]);
				addr.setAddressLegal(addressLegal[i]);
				addr.setAddressRoad(addressRoad[i]);
				addr.setAddressNumber(helperNo);
				int result1 = dao.insertAddress(addr);
			}
			i2.setIncomeNum(helperNo);
			int result2 = dao.insertIncomeHelper(i2);
			if (result2 > 0) {
				return result;

			} else {
				return 0;
			}
		} else {
			return 0;
		}
	}

	// 사진 있을때 헬퍼 요청등록
	public int insertHouseAndImg(Helper h, Income i2, String[] addressCode, String[] addressName, String[] addressRoad,
			String[] addressLegal) {
		int result = dao.insertHouseAndImg(h);
		if (result > 0) {
			int helperNo = h.getHelperNo();
			for (int i = 0; i < addressCode.length; i++) {
				Address addr = new Address();
				addr.setAddressCode(addressCode[i]);
				addr.setAddressName(addressName[i]);
				addr.setAddressLegal(addressLegal[i]);
				addr.setAddressRoad(addressRoad[i]);
				addr.setAddressNumber(helperNo);
				int result1 = dao.insertAddress(addr);
			}
			i2.setIncomeNum(helperNo);
			int result2 = dao.insertIncomeHelper(i2);
			if (result2 > 0) {
				return result;

			} else {
				return 0;
			}
		}
		return 0;
	}

	public Helper selectOneHelper(String helperName) {
		Helper h = dao.selectOneHelper(helperName);
		return h;
	}

	public Helper selectOneHelperMemberNo(int memberNo) {
		Helper h =dao.selectOneHelperMemberNo(memberNo);
		return h;
	}

	public Helper selectOneHelperMemberNoUpdate(int memberNo) {
		Helper h =dao.selectOneHelperMemberNo(memberNo);
		Income i = dao.selectOneIncome(h.getHelperNo());
		h.setIncome(i);
		return h;
	}
	//헬퍼 등록 요청 사진x 수정
	public int helperRequestNoImgUpdate(Helper h, Income i2, String[] addressCode, String[] addressName,
			String[] addressRoad, String[] addressLegal) {
		int result = dao.updateHelperReqNoImg(h);
		int helperNo = h.getHelperNo();
		if(result>0) {
			//미리 있던 헬퍼관련 선호 주소삭제
			System.out.println(helperNo);
			int addressNumber= helperNo;
			int result2 = dao.deleteAddresss(addressNumber);
			if(result2>0) {
				for (int i = 0; i < addressCode.length; i++) {
					Address addr = new Address();
					addr.setAddressCode(addressCode[i]);
					addr.setAddressName(addressName[i]);
					addr.setAddressLegal(addressLegal[i]);
					addr.setAddressRoad(addressRoad[i]);
					addr.setAddressNumber(helperNo);
					int resultAddr = dao.insertAddress(addr);
				}
				i2.setIncomeNum(helperNo);
				int result3 = dao.insertIncomeHelperUpdate(i2);
				return result3;
			}else {
				return 0;
			}
		}else {
			return 0;
		}
	}
	//이미지 있는 헬퍼 등록 요청 수정
	public int insertHouseAndImgUpdate(Helper h, Income i2, String[] addressCode, String[] addressName,
			String[] addressRoad, String[] addressLegal) {
			int result = dao.insertHouseAndImgUpdate(h);
			int helperNo = h.getHelperNo();
			if(result>0) {
				//미리 있던 헬퍼관련 선호 주소삭제
				int addressNumber= helperNo;
				int result2 = dao.deleteAddresss(addressNumber);
				if(result2>0) {
					for (int i = 0; i < addressCode.length; i++) {
						Address addr = new Address();
						addr.setAddressCode(addressCode[i]);
						addr.setAddressName(addressName[i]);
						addr.setAddressLegal(addressLegal[i]);
						addr.setAddressRoad(addressRoad[i]);
						addr.setAddressNumber(helperNo);
						int resultAddr = dao.insertAddress(addr);
					}
					i2.setIncomeNum(helperNo);
					int result3 = dao.insertIncomeHelperUpdate(i2);
					return result3;
				}else {
					return 0;
				}
			}else {
				return 0;
			}
	
	}
	//헬퍼 리스트 출력 부분 - sowon
	public HashMap<String, Object> selectAjaxHelper(int pageNum, int memberNo, String keyword, Helper h, Member mem) {
		// 한 페이지에 몇개 보여줄건지
		int numPerPage = 9;
		// 보여줄 페이지의 시작 ROWNUM - 0부터 시작
		// 보여줄 페이지의 끝 ROWNUM
		int end = pageNum * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo", memberNo);
		map.put("keyword", keyword);
		map.put("gender", mem.getGender());
		map.put("age", mem.getAge());
		map.put("helperStartTime", h.getHelperStartTime());
		map.put("helperEndTime",h.getHelperEndTime());
		map.put("helperCategory",h.getHelperCategory());
		ArrayList<Helper> list = dao.selectAjaxHelper(map);
		int totalRow = hdao.selectAjaxTotal();
		// 전체 페이지의 갯수 구하기
		int totalPageCount = (totalRow % numPerPage == 0) ? (totalRow / numPerPage) : (totalRow / numPerPage + 1);
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("list", list);
		data.put("totalPageCount", totalPageCount);
		data.put("startPageNum", start);
		return data;
	}
	//helper like select
	public int helperLike(int memberNo, int helperNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("helperNo", helperNo);
		return dao.helperLike(map);
	}
	//helper like total
	public int helperLikeCount(int helperNo) {
		return dao.helperLikeCount(helperNo);
	}
	//helper like insert
	public int insertHelperLike(int memberNo, int helperNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("helperNo", helperNo);
		return dao.insertHelperLike(map);
	}
	//helper like delete
	public int deleteHelperLike(int memberNo, int helperNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("helperNo", helperNo);
		return dao.deleteHelperLike(map);
	}
	//헬퍼 상세보기 - sowon
	public Helper selectHelperView(int helperNo, int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("helperNo", helperNo);
		map.put("memberNo", memberNo);
		Helper h = dao.selectHelperView(map);
		ArrayList<HelpReview> review = dao.selectHelperReview(map);
		h.setReview(review);
		return h;
	}

	public ReqHelpListPageData selectHelpList(int memberNo, int reqPage) {
		//헬퍼번호 헬퍼테이블에서 꺼내기
		int helperNo = dao.selectHelperNo(memberNo);
		//헬퍼리스트관련 주소값 address테이블을 활용하는지...*3번?
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("helperNo", helperNo);
		ArrayList<ReqHelperList> list = dao.selectAllReqHelpList(map);
		int totalCount = dao.selectHelpTotalCount(helperNo);
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination pagination'>";
		if (pageNo != 1) {
			pageNavi += "<li class = 'page-item-mate-mate'>";
			pageNavi += "<a href='/helperReqList.do?reqPage="+ (pageNo - 1) + "'>";
			pageNavi += "&lt;</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'>";
				pageNavi += "<a href='/helperReqList.do?reqPage="+ pageNo+ "'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item-mate-mate'>";
				pageNavi += "<a href='/helperReqList.do?reqPage=" + pageNo+ "'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a href='/helperReqList.do?reqPage=" + pageNo + "'>";
			pageNavi += "&gt;</a></li>";// ">" 표현 &gt
		}
		pageNavi += "</ul>";
		ReqHelpListPageData rhpd= new ReqHelpListPageData();
		rhpd.setList(list);
		rhpd.setPageNavi(pageNavi);
		rhpd.setStart(start);
		rhpd.setTotalCount(totalCount);
		return rhpd;
	}
	//도움 요청 
	public int insertHelprequest(HelpList h, int helperNo, int memberNo, Address addr, Pay p) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("helperNo", helperNo);
		map.put("memberNo", memberNo);
		map.put("h", h);
		int result = dao.insertHelprequest(map);
		if(result > 0) {
			map.put("addr",addr);
			int helpNo = dao.selectHelperNo2();
			map.put("helpNo", helpNo);
			int result2 = dao.insertAddress(map);
			int result3 = dao.updateHelpPay(map);
		}

		return result;
	}
	//헬퍼신고
	public int insertHelperReport(int helperNo, int hmemberNo, int memberNo, String reportContent) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("helperNo", helperNo);
		map.put("hmemberNo", hmemberNo);
		map.put("memberNo", memberNo);
		map.put("reportContent", reportContent);
		int result = dao.insertHelperReport(map);
		return result;
	}
	//리뷰 좋아요 조회
	public int reviewLike(int memberNo, int reviewNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("reviewNo", reviewNo);
		return dao.reviewLike(map);
	}
	//리뷰 토탈 
	public int reviewLikeCount(int reviewNo) {
		return dao.reviewLikeCount(reviewNo);
	}
	//리뷰 insert
	public int insertReviewLike(int memberNo, int reviewNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("reviewNo", reviewNo);
		return dao.insertReviewLike(map);
	}
	//리뷰 delete
	public int deleteReviewLike(int memberNo, int reviewNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("reviewNo", reviewNo);
		return dao.deleteReviewLike(map);
	}

	public int updateHelpStatus(int helpStatus, int helpNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("helpStatus", helpStatus);
		map.put("helpNo", helpNo);
		int result = dao.updateHelperStatus(map);
		return result;
	}
	@Transactional
	public int updateCancelHelpStatus(int helpStatus, int helpNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("helpStatus", helpStatus);
		map.put("helpNo", helpNo);
		int result =dao.updateHelperStatus(map);
		if(result>0) {
			int result2=dao.updatePayCancelDate(helpNo);
			if(result2>0) {
				if(helpStatus==4||helpStatus==5 || helpStatus==6) {
					int result3= dao.cancelPayUpdate(helpNo);
					return result3;
				}else {					
					return result2;
				}
			}else {
				return 0;
			}
		}else {
			return 0;
		}
	}

	public int updateCompilte(int helpNo, String helpComplite) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("helpNo", helpNo);
		map.put("helpComplite", helpComplite);
		int result= dao.updateCompilte(map);
		if(result>0) {
			int result2= dao.updatePayCom(helpNo);
			if(result2>0) {
				return result2;
			}else {
				return 0;
			}
		}else {			
			return 0;
		}
	}

	public int insertPhotoHelpCom(int helpNo, ArrayList<Photo> list) {
		int result = 0;
		for (Photo p : list) {
			p.setPhotoNum(helpNo);
			result += dao.insertPhotoHelpCom(p);
		}
		return result;
	}
	//찜한 헬퍼

	public ArrayList<Helper> selectBookmarkHelperList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectBookmarkHelperList(memberNo);
	}
	@Transactional
	public int ChkHelpComeDelay() {
		int result= dao.chkHelpEndTime();
		System.out.println("스케줄드 헬프만료처리내역"+result+"건");
		if(result>0) {
			int result2=dao.updatePayAutoCancel();
			System.out.println("스케줄드 결제취소변경"+result2+"건");
			if(result2>0) {
				return result2;
			}else {
				return 0;
			}
		}else {
			return 0;
		}
	}
	//결제 - sowon
	public int insertHelpPayment(Pay p, int memberNo, int helpNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("p", p);
		map.put("memberNo", memberNo);
		map.put("helpNo", helpNo);
		return dao.insertHelpPayment(map);
	}

	public ReqHelperAdjustPageData selectAdjustList(int memberNo, int reqPage) {
		int helperNo = dao.selectHelperNo(memberNo);
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("helperNo", helperNo);
		ArrayList<ReqHelperAdjust> list = dao.selectHelperAdjustList(map);
		int totalCount = dao.selectAllhelperCount(helperNo);
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination pagination'>";
		if (pageNo != 1) {
			pageNavi += "<li class = 'page-item-mate-mate'>";
			pageNavi += "<a href='/helperReqListAdjust.do?reqPage="+ (pageNo - 1) + "'>";
			pageNavi += "&lt;</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'>";
				pageNavi += "<a href='/helperReqListAdjust.do?reqPage="+ pageNo+ "'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item-mate-mate'>";
				pageNavi += "<a href='/helperReqListAdjust.do?reqPage=" + pageNo+ "'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a href='/helperReqListAdjust.do?reqPage=" + pageNo + "'>";
			pageNavi += "&gt;</a></li>";// ">" 표현 &gt
		}
		pageNavi += "</ul>";
		ReqHelperAdjustPageData rhapd= new ReqHelperAdjustPageData();
		rhapd.setList(list);
		rhapd.setStart(start);
		rhapd.setTotalCount(totalCount);
		rhapd.setPageNavi(pageNavi);
		return rhapd;
	}
	public HashMap<String, Object> selectHelpRequestList(int memberNo, int reqPage) {
		// TODO Auto-generated method stub
		int numPerPage=5;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo",memberNo);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<HelpList> list = dao.selectHelpRequestList(map);
		int totalCount = dao.helpRequestCount(memberNo);
		int totalPage = 0;
		
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize=5;
		int pageNo=1;
		if(reqPage>4) {
			pageNo=reqPage-2;
			if(totalPage - reqPage < (pageNaviSize-1)) {
				pageNo = totalPage-(pageNaviSize-1);
			}
		}
		
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/helpList.do?reqPage="+(reqPage-1)+"'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item-mate-mate active'><a href='/helpList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item-mate-mate'><a href='/helpList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item-mate-mate'><a href='/helpList.do?reqPage="+(reqPage+1)+"'>&gt;</a><li>";
		}
		pageNavi += "</ul>";
		
		map.put("pageNavi", pageNavi);
		map.put("list",	list);
		
		return map;
	}

}
