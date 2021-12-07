package kr.or.house.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.or.common.Address;
import kr.or.common.Income;
import kr.or.house.model.service.HouseService;
import kr.or.house.model.vo.House;
import kr.or.house.model.vo.HouseResult;
import kr.or.room.model.vo.Room;

@Controller
public class HouseController {
	@Autowired
	private HouseService service;
	//하우스 등록
	@RequestMapping(value = "/houseWriteFrm.do")
	public String houseWriteFrm() {
		return "house/houseWriteFrm";
	}
	//하우스 리스트 출력
	@RequestMapping(value="/houseList.do")
	public String houseList() {
		return "house/houseList";
	}
	//하우스 등록
	@RequestMapping(value = "/houseWrite.do")
	public String houseWrite(House h,Address address,Income i,Model model,HttpSession session) {
		/*
		 * 
		 * Member m = session.getattribute("m")
		 * m.memberNo
		 * */
		HouseResult house = service.insertHouse(h,address,i); // 하우스 등록
		if(house.getResult()>0) {
			return "redirect:/main.do";
//			return "redirect:/roomList.do?houseNo="+house.getHouseNo()+"&memberNo="+h.getMemberNo();
		}else {
			return "house/houseWriteFrm";
		}
	}
	//하우스 이미지 업로드
	@RequestMapping(value = "/houseUploadImage.do",produces = "application/json; charset=utf8")
	public String houseUploadImage(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		JsonObject jsonObject=new JsonObject();
		
		//내부경로저장
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/houseImg/");
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
	
}
