package kr.or.house.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.common.Address;
import kr.or.common.Housesearch;
import kr.or.common.Income;
import kr.or.common.Photo;
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
	public String houseList(House h, Model model) {
		ArrayList<House> list = service.selectAllHouse(h);
		model.addAttribute("list",list);
		model.addAttribute("loc","/");
		return "house/houseList";
	}
	//ajax 하우스 리스트 - sowon
	@RequestMapping(value="/ajax_page.do")
	public String ajax_page(int pageNum, Model model) {
		HashMap<String, Object> data = service.selectAjaxHouse(pageNum);
		model.addAttribute("list",data.get("list"));
		model.addAttribute("totalPageCount",data.get("totalPageCount"));
		model.addAttribute("startPageNum",data.get("startPageNum"));
		return "house/ajax_page";
	}
	//하우스 등록
	@RequestMapping(value = "/houseWrite.do")
	public String houseWrite(House h,Address address,Income i,Model model,HttpSession session,MultipartFile[] photoPath,HttpServletRequest request) {
		/*
		 * 
		 * Member m = session.getattribute("m")
		 * m.memberNo
		 * */
		HouseResult house = service.insertHouse(h,address,i); // 하우스 등록
		if(house.getResult()>0) {
			ArrayList<Photo> list = new ArrayList<Photo>();
				if(photoPath[0].isEmpty()) {
				//파일 없는경우 	
					return "redirect:/houseownerList.do";
				}else {
				//파일이 있는경우
					String photoPathfile = request.getSession().getServletContext().getRealPath("/resources/upload/house");
					for(MultipartFile file: photoPath) {
						//사용자가 올린 파일명
						String filename = file.getOriginalFilename();
						String onlyFilename = filename.substring(0,filename.indexOf(".")); //test
						String extention = filename.substring(filename.indexOf("."));//.txt
						String filepath =null;
						int count = 0;
						while(true) {
							if(count == 0) {
								filepath = onlyFilename+extention;//test.txt
							}else {
								filepath = onlyFilename+"_"+count+extention;//test_1.txt
							}
							File checkFile = new File(photoPathfile+filepath);//File>> java.io
							if(!checkFile.exists()) {//똑같은 파일이 없을경우 중지
								break;
							}
							count++;
						}
						//파일명 중복처리가 끝나면 파일업로드
						try {
							//중복처리가 끝난 파일명(filepath)으로 파일을 업로드
							FileOutputStream fos = new FileOutputStream(new File(photoPathfile+filepath));
							//업로드 속도증가를 위한 보조스트림
							BufferedOutputStream bos = new BufferedOutputStream(fos);
							//파일업로드
							byte[] bytes =file.getBytes();
							bos.write(bytes);
							bos.close();
						} catch (FileNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						Photo p = new Photo();
						p.setPhotoPath(photoPathfile);
						list.add(p);
						
					}
					int houseNo= house.getHouseNo();
					int result = service.insertImgfiles(list,houseNo);
					if(result>0) {
						return "redirect:/roomList.do";
						
					}else {
						return "house/houseWriteFrm";
					}
				}
//			return "redirect:/roomList.do?houseNo="+house.getHouseNo()+"&memberNo="+h.getMemberNo();
		}else {
			return "house/houseWriteFrm";
		}
	}
	
	//하우스 이미지 업로드
	@RequestMapping(value = "/houseUploadImage.do",produces = "application/json; charset=utf8")
	@ResponseBody
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
