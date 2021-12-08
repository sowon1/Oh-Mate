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
import org.springframework.web.multipart.MultipartFile;

import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.SearchMember;
import kr.or.admin.model.vo.UpdateMember;
import kr.or.member.model.vo.Member;
import kr.or.profile.model.vo.Profile;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/memberMgr.do")
	public String memberMgr(int reqPage, Model model) {
		HashMap<String, Object> data = service.selectAllMember(reqPage);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		return "admin/memberMgr";
	}
	@RequestMapping(value="/adminMemberSearch.do")
	public String memberSearch(int reqPage, SearchMember sm, Model model) {
		HashMap<String, Object> data = service.memberSearch(reqPage, sm);
		model.addAttribute("pageNavi", data.get("pageNavi"));
		model.addAttribute("list", data.get("list"));
		model.addAttribute("start", data.get("start"));
		model.addAttribute("sm", sm);
		return "admin/memberSearch";
	}
	@RequestMapping(value="adminMemberView.do")
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
}
