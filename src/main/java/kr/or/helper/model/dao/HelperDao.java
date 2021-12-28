package kr.or.helper.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.Address;
import kr.or.common.HelpList;
import kr.or.common.HelpReview;
import kr.or.common.Income;
import kr.or.common.Photo;
import kr.or.common.Report;
import kr.or.helper.model.vo.HelpDetailData;
import kr.or.helper.model.vo.Helper;
import kr.or.helper.model.vo.ReqHelperAdjust;
import kr.or.helper.model.vo.ReqHelperList;


@Repository
public class HelperDao {
	@Autowired
	private SqlSessionTemplate session;

	public int heplerRequestNoImg(Helper h) {
		
		return session.insert("helper.insertHelperReqNoImg",h);
	}

	public int insertAddress(Address addr) {
		// TODO Auto-generated method stub
		return session.insert("helper.insertAddress",addr);
	}

	public int insertHouseAndImg(Helper h) {
		// TODO Auto-generated method stub
		System.out.println(h);
		return session.insert("helper.insertHelperAndImg",h);
	}

	public Helper selectOneHelper(String helperName) {
		return session.selectOne("helper.selectOneHelper",helperName);
	}

	public int insertIncomeHelper(Income i2) {
		// TODO Auto-generated method stub
		return session.insert("helper.insertIncomeHelper",i2);
		
	}

	public Helper selectOneHelperMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("helper.selectOneHelperMemberNo",memberNo);
	}

	public Income selectOneIncome(int helperNo) {
		
		return session.selectOne("helper.selectOneIncome", helperNo);
	}

	public int updateHelperReqNoImg(Helper h) {
		
		return session.update("helper.updateHelperReqNoImg",h);
	}

	public int deleteAddresss(int addressNumber) {
		
		return session.delete("helper.deleteAddressUpdate", addressNumber);
	}

	public int insertIncomeHelperUpdate(Income i2) {
		// TODO Auto-generated method stub
		return session.update("helper.insertIncomeHelperUpdate", i2);
	}

	public int insertHouseAndImgUpdate(Helper h) {
		// TODO Auto-generated method stub
		return session.update("helper.updateHelperReqImg", h);
	}
	//헬퍼 리스트 출력 부분 - sowon
	public ArrayList<Helper> selectAjaxHelper(HashMap<String, Object> map) {
		List<Helper> list = session.selectList("helper.selectAjaxHelper",map);
		return (ArrayList<Helper>)list;
	}
	//helper like select
	public int helperLike(HashMap<String, Object> map) {
		return session.selectOne("helper.helperLike",map);
	}
	//helper like total
	public int helperLikeCount(int helperNo) {
		return session.selectOne("helper.helperLikeCount",helperNo);
	}
	//helper like insert
	public int insertHelperLike(HashMap<String, Object> map) {
		return session.update("helper.insertHelperLike",map);
	}
	//helper like delete
	public int deleteHelperLike(HashMap<String, Object> map) {
		return session.delete("helper.deleteHelperLike",map);
	}
	//헬퍼 상세보기 - sowon
	public Helper selectHelperView(HashMap<String, Object> map) {
		return session.selectOne("helper.selectHelperView",map);
	}
	//헬퍼 후기 조회
	public ArrayList<HelpReview> selectHelperReview(HashMap<String, Object> map) {
		List<HelpReview> review = session.selectList("helper.selectHelperReview",map);
		return (ArrayList<HelpReview>) review;
	}

	public int selectHelperNo(int memberNo) {
		
		return session.selectOne("helper.selectHelperNo", memberNo);
	}
	//도움 요청
	public int insertHelprequest(HashMap<String, Object> map) {
		return session.insert("helper.insertHelprequest",map);
	}
	//헬프 주소 등록
	public int insertAddress(HashMap<String, Object> map) {
		return session.insert("helper.insertAddressHelp",map);
	}
	//방금 등록한 헬프 번호 가져오기
	public int selectHelperNo2() {
		int helpNo = session.selectOne("helper.selectHelperNo2");
		return helpNo;
	}
	//헬퍼신고
	public int insertHelperReport(HashMap<String, Object> map) {
		return session.insert("helper.insertHelperReport",map);
	}

	public ArrayList<ReqHelperList> selectAllReqHelpList(HashMap<String, Object> map) {
		List<ReqHelperList> list = session.selectList("helper.selectAllReqHelpList",map);
		return (ArrayList<ReqHelperList>)list;
	}

	public int selectHelpTotalCount(int helperNo) {
		// TODO Auto-generated method stub
		return session.selectOne("helper.helpTotalCount", helperNo);
	}
	//리뷰 좋아요 조회
	public int reviewLike(HashMap<String, Object> map) {
		return session.selectOne("helper.reviewLike",map);
	}
	//리뷰 토탈
	public int reviewLikeCount(int reviewNo) {
		return session.selectOne("helper.reviewLikeCount",reviewNo);
	}
	//리뷰 insert
	public int insertReviewLike(HashMap<String, Object> map) {
		return session.update("helper.insertReviewLike",map);
	}
	//리뷰 delete
	public int deleteReviewLike(HashMap<String, Object> map) {
		return session.delete("helper.deleteReviewLike",map);
	}

	public int updateHelperStatus(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return session.update("helper.updateHelpStatus", map);
	}
	

	public int updatePayCancelDate(int helpNo) {
		// TODO Auto-generated method stub
		return session.update("helper.updatePayCancelDate", helpNo);
	}

	public int updateCompilte(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return session.update("helper.updateCompilte", map);
	}

	public int updatePayCom(int helpNo) {
		// TODO Auto-generated method stub
		return session.update("helper.updatePayCom",helpNo);
	}

	public int insertPhotoHelpCom(Photo p) {
		
		return session.insert("helper.insertPhotoHelpCom", p);
	}
	//찜한 헬퍼
	public ArrayList<Helper> selectBookmarkHelperList(int memberNo) {
		// TODO Auto-generated method stub
		List<Helper> list = session.selectList("helper.selectBookmarkHelperList", memberNo);
		return (ArrayList<Helper>)list;

	}
	//결제
	public int insertHelpPayment(HashMap<String, Object> map) {
		return session.insert("helper.insertHelpPayment",map);
	}
	//결제 업데이트
	public int updateHelpPay(HashMap<String, Object> map) {
		return session.update("helper.updateHelpPay",map);
	}

	public int chkHelpEndTime() {
		// TODO Auto-generated method stub
		return session.update("helper.chkHelpEndTime");
	}


	public int updatePayAutoCancel() {
		// TODO Auto-generated method stub
		return session.update("helper.updatePayAutoCancel");
	}


	public int cancelPayUpdate(int helpNo) {
		// TODO Auto-generated method stub
		return session.update("helper.cancelPayUpdate",helpNo);
	}

	public ArrayList<ReqHelperAdjust> selectHelperAdjustList(HashMap<String, Object> map) {
		List<ReqHelperAdjust> list = session.selectList("helper.selectHelperAdjustList", map);
		return (ArrayList<ReqHelperAdjust>)list;
	}

	public int selectAllhelperCount(int helperNo) {
		// TODO Auto-generated method stub
		return session.selectOne("helper.selectAllhelperCount", helperNo);
	}
	//헬프요청 리스트
	public ArrayList<HelpList> selectHelpRequestList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<HelpList> list = session.selectList("helper.selectHelpRequestList", map);
		return (ArrayList<HelpList>)list;
	}

	public int helpRequestCount(int memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("helper.helpRequestCount", memberNo);
	}

	public int insertHelpReview(HelpReview re) {
		// TODO Auto-generated method stub
		return session.insert("helper.insertHelpReview", re);
	}

	public int insertHelpPhoto(HelpReview re) {
		// TODO Auto-generated method stub
		return session.insert("helper.insertHelpPhoto", re);
	}

	public ArrayList<HelpReview> selectHelpReviewList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<HelpReview> list = session.selectList("helper.selectHelpReviewList", map);
		return (ArrayList<HelpReview>)list;
	}

	public int helpReviewListCount(int memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("helper.helpReviewListCount", memberNo);
	}

	public int deleteReview(int reviewNo) {
		// TODO Auto-generated method stub
		return session.delete("helper.deleteReview", reviewNo);
	}

	public HelpDetailData selectHelpDetail(HelpList hl) {
		// TODO Auto-generated method stub
		return session.selectOne("helper.selectHelpDetail", hl);
	}
	
}
