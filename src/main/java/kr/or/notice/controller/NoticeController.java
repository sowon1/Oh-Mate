package kr.or.notice.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.or.notice.model.service.NoticeService;
import kr.or.notice.model.vo.FileVO;
import kr.or.notice.model.vo.Notice;


@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping(value = "/noticeList.do")
	public String noticeList(int reqPage, Model model) {
	
		HashMap<String, Object> map = service.selectNotice(reqPage);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("list", map.get("list"));
		model.addAttribute("start", map.get("start"));
		return "notice/noticeList";
	}
	
	@RequestMapping(value = "/noticeWriteFrm.do")
	public String noticeWriteFrm() {
		return "notice/noticeWriteFrm";
	}
	
	@RequestMapping(value = "/insertNotice.do")
	public String noticeWrite(Notice n, MultipartFile[] upfiles, HttpServletRequest request, Model model) {
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		if(upfiles[0].isEmpty()) {
			System.out.println("파일없음");
		}else {
			System.out.println("파일있음1");
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			for(MultipartFile file : upfiles) {
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
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				FileVO fv = new FileVO();
				fv.setFilename(filename);
				fv.setFilepath(filepath);
				list.add(fv);
			}
		}
		int result = service.insertNotice(n,list);
		
		if(result == -1 || result != list.size()) {
			model.addAttribute("msg", "등록실패");
		}else {
			model.addAttribute("msg", "등록성공");
		}
		model.addAttribute("loc", "/noticeList.do?reqPage=1");
		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping(value = "/uploadNoticeImage.do", produces = "application/json;charset=utf-8")
	public String uploadNoticeImage(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/noticeImg/");
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
			jsonObject.addProperty("url", "/resources/upload/noticeImg/"+filepath);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonObject.toString();

	}
	
	@RequestMapping(value = "/noticeView.do")
	public String noticeView(int noticeNo) {
		System.out.println(noticeNo);
		return "notice/noticeList";
	}
}
