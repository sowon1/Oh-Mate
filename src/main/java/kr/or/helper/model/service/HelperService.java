package kr.or.helper.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.Address;
import kr.or.common.Income;
import kr.or.helper.model.dao.HelperDao;
import kr.or.helper.model.vo.Helper;
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

}
