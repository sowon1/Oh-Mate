package kr.or.helper.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.common.Address;
import kr.or.common.HelpList;
import kr.or.common.Income;
import kr.or.helper.model.service.HelperService;
import kr.or.helper.model.vo.Helper;
import kr.or.helper.model.vo.ReqHelpListPageData;
import kr.or.member.model.vo.Member;

@Controller
public class HelperController {
	@Autowired
	private HelperService service;
	
	//헬퍼 요청양식 이동
	@RequestMapping(value = "/helperRequestFrm.do")
	public String helperRequestFrm(Model model) {
		return "helper/helperRequestFrm";
	}
	//헬퍼 리스트 출력
	@RequestMapping(value="/helperList.do")
	public String helperList(String keyword, String gender, String helperStartTime, String helperEndTime, Model model,String helperCategory, String age) {
		model.addAttribute("keyword", keyword);
		model.addAttribute("gender", gender);
		model.addAttribute("helperStartTime", helperStartTime);
		model.addAttribute("helperEndTime", helperEndTime);
		model.addAttribute("helperCategory",helperCategory);
		model.addAttribute("age",age);
	
		return "helper/helperList";
	}
	//헬퍼 썸머노트 이미지 업로드-jisung
		@RequestMapping(value = "/helperUploadImage.do",produces = "application/json; charset=utf8")
		@ResponseBody
		public String houseUploadImage(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
			JsonObject jsonObject=new JsonObject();
			
			//내부경로저장
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/helperImg/");
			String filename = file.getOriginalFilename();
			String onlyFilename = filename.substring(0,filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			String filepath = null;
			int count=0;
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
				jsonObject.addProperty("url", "/resources/upload/houseImg/"+filepath);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return jsonObject.toString();
		}
		//헬퍼 요청 등록
		@RequestMapping(value = "/helpRequest.do")
		public String helpRequest(Helper h, Income i,String[] addressCode,String[] addressName,String[] addressRoad,String[] addressLegal,MultipartFile upfile,HttpServletRequest request,Model model) {
			
			if(upfile.isEmpty()) {
				int result = service.helperRequestNoImg(h,i,addressCode,addressName,addressRoad,addressLegal);
				if(result>0) {
					model.addAttribute("msg", "헬퍼요청등록성공!");
					return"redirect:/main.do";
					
				}else {
					model.addAttribute("msg", "헬퍼요청 등록 실패!");
					return"redirect:/main.do";
				}
			}else {
				String helperfile = request.getSession().getServletContext().getRealPath("/resources/upload/helper/");
				String filename= upfile.getOriginalFilename();
				String onlyFilename = filename.substring(0,filename.indexOf("."));//test
				String extention = filename.substring(filename.indexOf("."));
				String filepath=null;
				int count=0;
				while(true) {
					if(count==0) {
						filepath =onlyFilename+extention;
					}else {
						filepath = onlyFilename+"_"+count+extention;
					}
					File checkFile = new File(helperfile+filepath);
					if(!checkFile.exists()) {
						break;
					}
					count++;
				}
				try {
					FileOutputStream fos = new FileOutputStream(new File(helperfile+filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes=upfile.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				h.setHelperFilepath(filepath);
				
				int result = service.insertHouseAndImg(h,i,addressCode,addressName,addressRoad,addressLegal);
				if(result>0) {
					model.addAttribute("msg", "헬퍼요청등록성공!");
					return"redirect:/main.do";
				}else {
					model.addAttribute("msg", "헬퍼요청 등록 실패!");
					return"redirect:/main.do";
				}
			}
		}
		//중복닉네임 체크
		@ResponseBody // 리턴값을 데이터 자체로 리턴
		@RequestMapping(value = "/idCheck.do")
		public String idCheck(String helperName, Model model) {
			Helper h = service.selectOneHelper(helperName);
			if (h == null) {
				return "1"; /// WEB-INF/views/1.jsp;
			} else {
				
				return "0"; /// WEB-INF/views/0.jsp;
			}
		}
		@ResponseBody // 리턴값을 데이터 자체로 리턴
		@RequestMapping(value = "/listCheck.do")
		public String listCheck(int memberNo, Model model) {
			Helper h = service.selectOneHelperMemberNo(memberNo);
			
			if(h==null) {
				return "0";
			}else {
				int hs=h.getHelperStatus();
				if(hs==1 || hs==2) {
					return"1";
				}else if(hs==3 || hs==4){
					return "3";
				}else {
					return "0";
				}
			}
		}
		//헬퍼 요청등록 수정폼 이동
		@RequestMapping(value = "/helperRequestUpdateFrm.do")
		public String helperRequestUpdateFrm(int memberNo,int helperStatus,Model model) {
			Helper h = service.selectOneHelperMemberNoUpdate(memberNo);
			model.addAttribute("h", h);
			model.addAttribute("helperStatus", helperStatus);
			return"helper/helperRequestUpdateFrm";
		}
		//헬퍼 요청 수정 및 재등록
		@RequestMapping(value = "/helpRequestUpdate.do")
		public String helpRequestUpdat(Helper h, Income i,String[] addressCode,String[] addressName,String[] addressRoad,String[] addressLegal,MultipartFile upfile,HttpServletRequest request,Model model) {
			System.out.println(h.getHelperStatus());
			if(upfile.isEmpty()) {
				int result = service.helperRequestNoImgUpdate(h,i,addressCode,addressName,addressRoad,addressLegal);
				if(result>0) {
					model.addAttribute("msg", "헬퍼요청등록성공!");
					return"redirect:/main.do";
					
				}else {
					model.addAttribute("msg", "헬퍼요청 등록 실패!");
					return"redirect:/main.do";
				}
			}else {
				String helperfile = request.getSession().getServletContext().getRealPath("/resources/upload/helper/");
				String filename= upfile.getOriginalFilename();
				String onlyFilename = filename.substring(0,filename.indexOf("."));//test
				String extention = filename.substring(filename.indexOf("."));
				String filepath=null;
				int count=0;
				while(true) {
					if(count==0) {
						filepath =onlyFilename+extention;
					}else {
						filepath = onlyFilename+"_"+count+extention;
					}
					File checkFile = new File(helperfile+filepath);
					if(!checkFile.exists()) {
						break;
					}
					count++;
				}
				try {
					FileOutputStream fos = new FileOutputStream(new File(helperfile+filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes=upfile.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				h.setHelperFilepath(filepath);
				
				int result = service.insertHouseAndImgUpdate(h,i,addressCode,addressName,addressRoad,addressLegal);
				if(result>0) {
					model.addAttribute("msg", "헬퍼요청등록성공!");
					return"redirect:/main.do";
				}else {
					model.addAttribute("msg", "헬퍼요청 등록 실패!");
					return"redirect:/main.do";
				}
			}
		}
		
		// 헬퍼 리스트 출력 부분 - sowon
		@ResponseBody
		@RequestMapping(value="/ajax_helper_page.do", produces = "application/json;charset=utf-8")
		public String ajax_helper_page(int pageNum, Model model, HttpSession session, String keyword, Helper h, Member mem) {
			int memberNo = 0;
			if (session != null) {
				Member m = (Member) session.getAttribute("m");

				if (m != null) {
					memberNo = m.getMemberNo();
				}
			}
			HashMap<String, Object> data = service.selectAjaxHelper(pageNum, memberNo, keyword, h, mem);
			System.out.println("아작스"+keyword);
			System.out.println("아작스"+data.get("list"));
			model.addAttribute("totalPageCount", data.get("totalPageCount"));
			model.addAttribute("startPageNum", data.get("startPageNum"));

			return new Gson().toJson(data);
		}
		
		//헬퍼 좋아요 부분 - sowon
		@ResponseBody
		@RequestMapping(value="/HelperListLike.do", method = {RequestMethod.POST }, produces = "application/json;charset=UTF-8")
		public String HelperListLike(int memberNo, int helperNo) {
			int like_check = 0;
			like_check = service.helperLike(memberNo, helperNo);
			int like_cnt = service.helperLikeCount(helperNo);
			if(like_check == 0) {
				int like_up = service.insertHelperLike(memberNo, helperNo);
				like_check++;
				like_cnt++;
			}else {
				int like_down = service.deleteHelperLike(memberNo, helperNo);
				like_check --;
				like_cnt --;
			}
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("likeCheck", like_check);
			map.put("likeCnt", like_cnt);
			return new Gson().toJson(map);
		}
		
		//헬퍼 상세보기 - sowon
		@RequestMapping(value="/helperView.do")
		public String helperView(int helperNo, Model model, HttpSession session) {
			if (session != null) {
				Member m = (Member) session.getAttribute("m");
				int memberNo = 0;
				if (m != null) {
					memberNo = m.getMemberNo();
				}
				Helper h = service.selectHelperView(helperNo, memberNo);
				model.addAttribute("h",h);
				model.addAttribute("review",h.getReview());
			}
			return "helper/helperView";
		}
		//헬퍼 요청 내역 리스트
		@RequestMapping(value = "/helperReqList.do")
		public String helperReqList(int reqPage,HttpSession session,Model model) {
			if(session != null) {
				Member m = (Member)session.getAttribute("m");
				int memberNo=0;
				if(m !=null) {
					memberNo=m.getMemberNo();
					ReqHelpListPageData h= service.selectHelpList(memberNo,reqPage);
					model.addAttribute("list", h.getList());
					model.addAttribute("start", h.getStart());
					model.addAttribute("totalCount", h.getTotalCount());
					model.addAttribute("pageNavi", h.getPageNavi());
					return"helper/reqHelpList";
				}else {
					model.addAttribute("msg", "접근하는 사용자 정보가 없습니다.");
					return  "redirect:/main.do";
				}
			}else {
				model.addAttribute("msg", "로그인을 해주세요!.");
				return  "redirect:/main.do";
			}
		}
		//도움 요청 
		@RequestMapping(value="/helprequest.do")
		public String helprequest(HelpList h, Model model, int helperNo, int memberNo, Address addr) {
			int result = service.insertHelprequest(h,helperNo,memberNo,addr);
			if(result>0) {
				model.addAttribute("msg", "헬퍼 요청 성공!");
				return"helper/helperView";
			}else {
				model.addAttribute("msg", "헬프요청실패");
				return"helper/helperView";
			}
		}
}
