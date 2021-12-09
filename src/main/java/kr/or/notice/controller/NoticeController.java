package kr.or.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
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
	
		HashMap<String, Object> map = service.selectNoticeList(reqPage);
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
			
		}else {
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
	public String noticeView(int noticeNo, Model model) {
		Notice n = service.selectNotice(noticeNo);
		model.addAttribute("n", n);
		return "notice/noticeView";
	}
	
	@RequestMapping(value = "/noticeDelete.do")
	public String deleteNotice(int noticeNo, Model model) {
		int result = service.deleteNotice(noticeNo);
		if(result>0) {
			model.addAttribute("msg", "삭제완료");
		}else {
			model.addAttribute("msg", "삭제실패");
		}
		model.addAttribute("loc", "/noticeList.do?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping(value = "/noticeUpdateFrm.do")
	public String updateNotice(int noticeNo, Model model) {
		Notice n = service.selectOneNotice(noticeNo);
		model.addAttribute("n", n);
		return "notice/noticeUpdateFrm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/delFile.do",produces = "application/json;charset=utf-8")
	public String deleteFile(int fileNo, String filepath, HttpServletRequest request) {
		int result = service.deleteFile(fileNo);
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
		if(result>0) {
			File delFile = new File(savePath+filepath);
			delFile.delete();
		}
		return new Gson().toJson(result);
	}
	
	@RequestMapping(value = "/updateNotice.do")
	public String updateNotice(Notice n, MultipartFile[] upfiles, HttpServletRequest request, Model model) {
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		if(upfiles[0].isEmpty()) {
			
		}else {
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
		int result = service.updateNotice(n,list);
		
		
		if(result == -1 || result != list.size()) {
			model.addAttribute("msg", "수정실패");
		}else {
			model.addAttribute("msg", "수정성공");
		}
		model.addAttribute("loc", "/noticeView.do?noticeNo="+n.getNoticeNo());
		return "common/msg";
	}
	
	@RequestMapping(value = "/downFile.do")
	public void downloadFile(String filepath, String filename, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
		System.out.println(filepath);
		System.out.println(filename);
		String file = savePath+filepath;
		
		
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		
		String resFilename = "";
		
		boolean bool = request.getHeader("user-agent").indexOf("MSIE") != -1 || request.getHeader("user-agent").indexOf("Trident") != -1;
		if(bool) {
			resFilename = URLEncoder.encode(filename,"UTF-8");
			resFilename = resFilename.replaceAll("\\\\", "%20");
		}else {
			resFilename = new String(filename.getBytes("UTF-8"),"ISO-8859-1");
		}
		response.setContentType("application/octet-stream;charset=utf-8");
		response.setHeader("Content-Disposition", "attachment;filename="+resFilename);
		
		while(true) {
			int read = bis.read();
			if(read != -1) {
				bos.write(read);
			}else {
				break;
			}
		}
		
		bis.close();
		bos.close();
		
	}
}
