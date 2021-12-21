package kr.or.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.admin.model.vo.Sales;
import kr.or.admin.model.vo.UpdateMember;
import kr.or.common.Address;
import kr.or.common.Photo;
import kr.or.common.Report;
import kr.or.helper.model.vo.Helper;
import kr.or.house.model.vo.House;
import kr.or.member.model.vo.Member;
import kr.or.profile.model.vo.Profile;
import kr.or.room.model.vo.Room;

@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Member> selectAllMember(HashMap<String, Object> map) {
		List<Member> list = session.selectList("admin.selectAllMember", map);
		return (ArrayList<Member>)list;
	}

	public int totalCount() {
		return session.selectOne("admin.memberTotal");
	}

	public ArrayList<Member> memberSearch(HashMap<String, Object> map) {
		List<Member> list = session.selectList("admin.searchMember", map);
		return (ArrayList<Member>)list;
	}

	public int totalSearchCnt(HashMap<String, Object> map) {
		return session.selectOne("admin.totalSearch", map);
	}

	public Member selectMemberInfo(int memberNo) {
		return session.selectOne("admin.selectMemberInfo", memberNo);
	}

	public int memberUpdate(UpdateMember um) {
		return session.update("admin.memberUpdate", um);
	}

	public Profile selectProfile(String memberId) {
		return session.selectOne("admin.selectProfile", memberId);
	}

	public int insertProfile(Profile p) {
		return session.insert("admin.insertProfile", p);
	}

	public int updateProfile(Profile p) {
		return session.update("admin.updateProfile", p);
	}

	public int deleteProfile(String pWriter) {
		return session.delete("admin.deleteProfile", pWriter);
	}

	public ArrayList<Report> selectAllReport(HashMap<String, Object> map) {
		List<Report> list = session.selectList("admin.selectAllReport", map);
		return (ArrayList<Report>)list;
	}

	public int totalReportCount() {
		return session.selectOne("admin.reportTotal");
	}

	public ArrayList<Report> reportSearch(HashMap<String, Object> map) {
		List<Report> list = session.selectList("admin.searchReport", map);
		return (ArrayList<Report>)list;
	}

	public int totalSearchReportCnt(HashMap<String, Object> map) {
		return session.selectOne("admin.totalSearchReport", map);
	}

	public Report selectOneReport(int reportNo) {
		return session.selectOne("admin.selectOneReport", reportNo);
	}

	public int updateReport(Report rp) {
		return session.update("admin.updateReport", rp);
	}

	public ArrayList<House> selectAllHouse(HashMap<String, Object> map) {
		List<House> list = session.selectList("admin.selectAllHouse", map);
		return (ArrayList<House>)list;
	}

	public int totalHouseCount() {
		return session.selectOne("admin.houseTotal");
	}

	public ArrayList<House> houseSearch(HashMap<String, Object> map) {
		List<House> list = session.selectList("admin.searchHouse", map);
		return (ArrayList<House>)list;
	}

	public int totalSearchHouseCnt(HashMap<String, Object> map) {
		return session.selectOne("admin.totalSearchHouse", map);
	}

	public House selectOneHouse(int houseNo) {
		return session.selectOne("admin.selectOneHouse", houseNo);
	}

	public ArrayList<Room> selectHouseRoom(int houseNo) {
		List<Room> list = session.selectList("admin.selectHouseRoom", houseNo);
		return (ArrayList<Room>)list;
	}

	public ArrayList<Photo> selectHousePhoto(int houseNo) {
		List<Photo> list = session.selectList("admin.selectHousePhoto", houseNo);
		return (ArrayList<Photo>)list;
	}

	public int updateHouse(House h) {
		return session.update("admin.updateHouse", h);
	}

	public ArrayList<Helper> selectAllHelper(HashMap<String, Object> map) {
		List<Helper> list = session.selectList("admin.selectAllHelper", map);
		return (ArrayList<Helper>)list;
	}

	public int totalHelperCount() {
		return session.selectOne("admin.helperTotal");
	}

	public ArrayList<Helper> helperSearch(HashMap<String, Object> map) {
		List<Helper> list = session.selectList("admin.searchHelper", map);
		return (ArrayList<Helper>)list;
	}

	public int totalSearchHelperCnt(HashMap<String, Object> map) {
		return session.selectOne("admin.totalSearchHelper", map);
	}

	public Helper selectOneHelper(int helperNo) {
		return session.selectOne("admin.selectOneHelper", helperNo);
	}

	public ArrayList<Address> selectHelperAddr(int helperNo) {
		List<Address> list = session.selectList("admin.selectHelperAddr", helperNo);
		return (ArrayList<Address>)list;
	}

	public int updateHelper(Helper hp) {
		return session.update("admin.updateHelper", hp);
	}

	public ArrayList<Sales> selectAllSales(HashMap<String, Object> map) {
		List<Sales> list = session.selectList("admin.selectAllSales", map);
		return (ArrayList<Sales>)list;
	}

	public int totalSalesCount() {
		return session.selectOne("admin.salesTotal");
	}
}
