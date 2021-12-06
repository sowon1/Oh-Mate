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
			//test.txt -> test_1.txt, test_2.txt
			//test.txt -> test         .txt -> 파일명을 확장자 기준으로 나눔
			String onlyFilename = filename.substring(0, filename.indexOf("."));//첫번째 문자부터 .문자의 앞까지 자르기 (test)
			String extention = filename.substring(filename.indexOf("."));//매개변수 1개인 경우 해당 순서부터 끝까지 (.txt)
			//실제 업로드할 파일명을 저장할 변수
			String filepath = null;
			//파일명 중복 시 _숫자를 붙이는 코드
			int count = 0;
			while(true) {
				if(count == 0) {
					filepath = onlyFilename+extention;			//test.txt
				}else {
					filepath = onlyFilename+"_"+count+extention;//test_3.txt
				}
				File checkFile = new File(savePath+filepath);//매개변수로 전달하는 경로 및 파일명에 해당하는 파일 정보를 읽어오는 객체
				if(!checkFile.exists()) {
					break;
				}
				count++;
			}
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				//파일 업로드
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
}
