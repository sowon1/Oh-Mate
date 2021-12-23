package kr.or.admin.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.Search;
import kr.or.admin.model.vo.UpdateMember;
import kr.or.common.Report;
import kr.or.helper.model.vo.Helper;
import kr.or.house.model.vo.House;
import kr.or.member.model.vo.Member;
import kr.or.profile.model.vo.Profile;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/memberMgr.do")
	public String memberMgr(int reqPage, Model model,@SessionAttribute Member m) {
		/*
		if(m == null) {
			return "admin/memberMgr";
		}else if(m.getMemberLevel()!=1) {
			return "admin/memberMgr";
		}
		*/
		HashMap<String, Object> data = service.selectAllMember(reqPage);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		return "admin/memberMgr";
	}
	@RequestMapping(value="/adminMemberSearch.do")
	public String memberSearch(int reqPage, Search s, Model model) {
		HashMap<String, Object> data = service.memberSearch(reqPage, s);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		model.addAttribute("s", s);
		return "admin/memberSearch";
	}
	@RequestMapping(value="/adminMemberView.do")
	public String memberView(int memberNo, Model model) {
		Member m = service.selectMemberInfo(memberNo);
		model.addAttribute("m", m);
		return "admin/memberView";
	}
	@RequestMapping(value="/adminMemberUpdate.do")
	public String memberUpdate(MultipartFile file, HttpServletRequest request, UpdateMember um, Model model) {
		if(file.isEmpty()) {
			//프로필 이미지 미첨부
		}else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member/");
			String filename = file.getOriginalFilename();
			String onlyFilename = filename.substring(0, filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			String filepath = null;
			int count = 0;
			while(true) {
				if(count == 0) {
					filepath = onlyFilename+extention;
				}else {
					filepath = onlyFilename+"_"+count+extention;
				}
				File checkFile = new File(savePath+filepath);
				if(!checkFile.exists()) {
					break;
				}
				count++;
			}
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			um.setFilepath(filepath);
		}
		int result = service.memberUpdate(um);
		if(result>0) {
			model.addAttribute("msg", "정보 수정 완료");
		}else {
			model.addAttribute("msg", "정보 수정 실패");
		}
		model.addAttribute("loc", "/adminMemberView.do?memberNo="+um.getMemberNo());
		return "common/msg";
	}
	@RequestMapping(value="/adminInsertProfile.do")
	public String insertProfile(Profile p, int memberNo, Model model) {
		int result = service.insertProfile(p);
		if(result>0) {
			model.addAttribute("msg", "프로필 등록 완료");
		}else {
			model.addAttribute("msg", "프로필 등록 실패");
		}
		model.addAttribute("loc", "/adminMemberView.do?memberNo="+memberNo);
		return "common/msg";
	}
	@ResponseBody
	@RequestMapping(value="/adminSelectProfile.do", produces = "application/json;charset=utf-8")
	public String selectProfile(String memberId) {
		Profile p = service.selectProfile(memberId);
		return new Gson().toJson(p);
	}
	@RequestMapping(value="/adminUpdateProfile.do")
	public String updateProfile(Profile p, int memberNo, Model model) {
		int result = service.updateProfile(p);
		if(result>0) {
			model.addAttribute("msg", "프로필 수정 완료");
		}else {
			model.addAttribute("msg", "프로필 수정 실패");
		}
		model.addAttribute("loc", "/adminMemberView.do?memberNo="+memberNo);
		return "common/msg";
	}
	@RequestMapping(value="/adminDeleteProfile.do")
	public String deleteProfile(String pWriter, int memberNo, Model model) {
		int result = service.deleteProfile(pWriter);
		if(result>0) {
			model.addAttribute("msg", "프로필 삭제 완료");
		}else {
			model.addAttribute("msg", "프로필 삭제 실패");
		}
		model.addAttribute("loc", "/adminMemberView.do?memberNo="+memberNo);
		return "common/msg";
	}
	@RequestMapping(value="/reportMgr.do")
	public String reportMgr(int reqPage, Model model) {
		HashMap<String, Object> data = service.selectAllReport(reqPage);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		return "admin/reportMgr";
	}
	@RequestMapping(value="/reportSearch.do")
	public String reportSearch(int reqPage, Search s, Model model) {
		HashMap<String, Object> data = service.reportSearch(reqPage, s);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		model.addAttribute("s", s);
		return "admin/reportSearch";
	}
	@ResponseBody
	@RequestMapping(value="/selectOneReport.do", produces = "application/json;charset=utf-8")
	public String selectReport(int reportNo, Model model) {
		Report rp = service.selectOneReport(reportNo);
		return new Gson().toJson(rp);
	}
	@ResponseBody
	@RequestMapping(value="/updateReport.do")
	public String updateReport(Report rp) {
		int result = service.updateReport(rp);
		if(result>0) {
			return "1";
		}else {
			return "0";
		}
	}
	@RequestMapping(value="/houseMgr.do")
	public String houseMgr(int reqPage, Model model) {
		HashMap<String, Object> data = service.selectAllHouse(reqPage);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		return "admin/houseMgr";
	}
	@RequestMapping(value="/adminHouseSearch.do")
	public String houseSearch(int reqPage, Search s, Model model) {
		HashMap<String, Object> data = service.houseSearch(reqPage, s);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		model.addAttribute("s", s);
		return "admin/houseSearch";
	}
	@RequestMapping(value="/adminHouseView.do")
	public String houseView(int houseNo, Model model) {
		House h = service.selectOneHouse(houseNo);
		model.addAttribute("h", h);
		return "admin/adminHouseView";
	}
	@RequestMapping(value="/adminHouseAllow.do")
	public String updateHouse(House h, Model model) {
		int result = service.updateHouse(h);
		if(result>0) {
			model.addAttribute("msg", "처리 완료");
		}else {
			model.addAttribute("msg", "처리 실패");
		}
		model.addAttribute("loc", "/adminHouseView.do?houseNo="+h.getHouseNo());
		return "common/msg";
	}
	@RequestMapping(value="/helperMgr.do")
	public String helpMgr(int reqPage, Model model) {
		HashMap<String, Object> data = service.selectAllHelper(reqPage);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		return "admin/helperMgr";
	}
	@RequestMapping(value="/adminHelperSearch.do")
	public String helperSearch(int reqPage, Search s, Model model) {
		HashMap<String, Object> data = service.helperSearch(reqPage, s);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		model.addAttribute("s", s);
		return "admin/helperSearch";
	}
	@RequestMapping(value="/adminHelperView.do")
	public String helperView(int helperNo, Model model) {
		Helper hp = service.selectOneHelper(helperNo);
		model.addAttribute("hp", hp);
		return "admin/adminHelperView";
	}
	@RequestMapping(value="/adminHelperStatus.do")
	public String updateHelper(Helper hp, Model model) {
		int result = service.updateHelper(hp);
		if(result>0) {
			model.addAttribute("msg", "처리 완료");
		}else {
			model.addAttribute("msg", "처리 실패");
		}
		model.addAttribute("loc", "/adminHelperView.do?helperNo="+hp.getHelperNo());
		return "common/msg";
	}
	@RequestMapping(value="/salesMgr.do")
	public String selectSales(int reqPage, Model model) {
		HashMap<String, Object> data = service.selectAllSales(reqPage);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		return "admin/salesMgr";
	}
	@RequestMapping(value="/salesSearch.do")
	public String salesSearch(int reqPage, Search s, Model model) {
		HashMap<String, Object> data = service.salesSearch(reqPage, s);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		model.addAttribute("s", s);
		return "admin/salesSearch";
	}
	@RequestMapping(value="/dashboard.do")
	public String dashboard(Model model) {
		return "admin/dashboard";
	}
}
