package kr.or.helper.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.or.common.Address;
import kr.or.helper.model.service.HelperService;
import kr.or.helper.model.vo.Helper;
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
	public String helperList() {
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
		public String helpRequest(Helper h, String[] addressCode,String[] addressName,String[] addressRoad,String addressLegal,MultipartFile helperFilepath,HttpServletRequest request) {
			if(helperFilepath.isEmpty()) {
				int result = service.helperRequestNoImg(h,addressCode,addressName,addressRoad,addressLegal);
				return"";
			}else {
				String helperfile = request.getSession().getServletContext().getRealPath("/resources/upload/helper/");
				String filename= helperFilepath.getOriginalFilename();
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
					byte[] bytes=helperFilepath.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return "";
			}
		}
		
}
