package kr.or.board.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.or.board.model.service.BoardService;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardMemberData;
import kr.or.board.model.vo.MateComment;
import kr.or.member.model.vo.Member;
import kr.or.profile.model.vo.Profile;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	
	//프로필등록 이동
	@RequestMapping(value="/profile.do")
	public String profile() {
		return "board/profile";
	}
	
	//프로필 미등록 -> 작성
	@RequestMapping(value="/insertProfile.do")
	public String insertProfile(Profile pr, int memberNo, Model model, HttpSession session) {
		int result = service.insertProfile(pr);
		if(result>0) {
			model.addAttribute("msg","프로필 등록 완료~");
			Member m = service.selectOneMember(memberNo);
			session.setAttribute("m", m);
		}else {
			model.addAttribute("msg","프로필 등록 실패");
		}
		model.addAttribute("loc","/communityFrm.do?memberNo"+memberNo);
		return "common/msg";
	}
	
	//프로필 수정,삭제 페이지 이동
	@RequestMapping(value="/profileUpFrm.do")
	public String profileUpdate(String memberId, Model model) {
		Profile p = service.selectProfile(memberId);
		model.addAttribute("local", p.getPLocal());
		model.addAttribute("p", p);
		return "board/profileUpFrm";
	}
	
	//프로필 수정
	@RequestMapping(value="/updateProfile.do")
	public String updateProfile(Profile pr, String memberId, Model model, HttpSession session) {
		int result = service.updateProfile(pr);
		if(result>0) {
			model.addAttribute("msg","프로필 수정 완료~");
			Member m = service.selectMember(memberId);
			session.setAttribute("m", m);
		}else {
			model.addAttribute("msg","프로필 수정 실패");
		}
		model.addAttribute("loc","/communityFrm.do?memberId="+memberId);
		return "common/msg";
	}
	
	//프로필 삭제
	@RequestMapping(value="/deleteProfile.do")
	public String deleteProfile(String memberId, Model model, HttpSession session) {
		int result = service.deleteProfile(memberId);
		if(result>0) {
			model.addAttribute("msg","프로필 삭제 완료");
			Member m = service.selectMember(memberId);
			session.setAttribute("m", m);
		}else{
			model.addAttribute("msg","프로필 삭제 실패");
		}
		model.addAttribute("loc","/communityFrm.do?memberId="+memberId);
		return "common/msg";
	}
	
	//게시판
	@RequestMapping(value="/communityFrm.do")
	public String coummunityFrm(Model model) {
		ArrayList<Board> list = service.selectBoard();
		model.addAttribute("list",list);
		//System.out.println(list.size());
		//System.out.println(list);
		return "board/communityFrm";
	} 
	
	//게시글 작성 이동
	@RequestMapping(value="/mateWriteFrm.do")
	public String mateWriteFrm() {
		return "board/mateWriteFrm";
	}
	
	//게시글 작성
	@RequestMapping(value="/boardWrite.do")
	public String boardWrite(String memberId, Board b, MultipartFile uploadFile, HttpServletRequest request, Model model) {
		if(uploadFile.isEmpty()) {
			
		}else {
			String savePath =  request.getServletContext().getRealPath("/resources/upload/board/");
			
			String filename = uploadFile.getOriginalFilename();
			String onlyFilename = filename.substring(0,filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			
			String filepath = null;
			
			int count = 0;
			while(true) {    
				if(count == 0) {
					filepath = onlyFilename + extention;  
				}else {
					filepath = onlyFilename + "_" + count + extention;  
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
				byte[] bytes = uploadFile.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			b.setFilePath(filepath);
		}
		int result = service.insertBoard(b);
		if(result>0) {
			model.addAttribute("msg","게시글 작성 완료~!");
		}else {
			model.addAttribute("msg","게시글 작성 실패");
		}
		model.addAttribute("loc","/communityFrm.do");
		return "common/msg";
	}
	
	//게시판 상세보기 이동
	@RequestMapping(value="/boardView.do")
	public String boardView(int boardNo, Model model) {
		//System.out.println(boardNo);
		BoardMemberData bmd = service.selectBoardList(boardNo);
		model.addAttribute("b",bmd.getB());
		model.addAttribute("list",bmd.getList());
		//System.out.println(list);
		return "board/boardView";
	}
	
	//게시판 수정 이동
	@RequestMapping(value="/boardUpdateFrm.do")
	public String boardUpdateFrm(int boardNo, Model model) {
		Board b = service.selectBoard(boardNo);
		model.addAttribute("b",b);
		return "board/boardUpdateFrm";
	}
	
	//게시판 수정
	@RequestMapping(value="/boardUpdate.do")
	public String boardUpdate(Board b, MultipartFile uploadFile, HttpServletRequest request, Model model) {
		if(uploadFile.isEmpty()) {
					
		}else {
			String savePath =  request.getServletContext().getRealPath("/resources/upload/board/");
			
			String filename = uploadFile.getOriginalFilename();
			String onlyFilename = filename.substring(0,filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			
			String filepath = null;
			
			int count = 0;
			while(true) {    
				if(count == 0) {
					filepath = onlyFilename + extention;  
				}else {
					filepath = onlyFilename + "_" + count + extention;  
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
				byte[] bytes = uploadFile.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			b.setFilePath(filepath);
		}
		int result = service.boardUpdate(b);
		if(result>0) {
			model.addAttribute("msg","게시글 수정 완료~!");
		}else {
			model.addAttribute("msg","게시글 수정 실패");
		}
		model.addAttribute("loc","/boardView.do?boardNo="+b.getBoardNo());
		return "common/msg";
	}
	
	//게시글 삭제
	@RequestMapping(value="/boardDelete.do")
	public String boardDelete(int boardNo, Model model) {
		int result = service.boardDelete(boardNo);
		if(result>0) {
			model.addAttribute("msg","게시글 삭제 완료");
		}else {
			model.addAttribute("msg","게시글 삭제 실패");
		}
		model.addAttribute("loc","/communityFrm.do?boardNo="+boardNo);
		return "common/msg";
	}
	
	//댓글
	@RequestMapping(value="/insertComment.do", method=RequestMethod.POST)
	public String insertComment(MateComment mc, Model model) {
		int result = service.insertComment(mc);
		System.out.println(result);
		if(result>0) {
			model.addAttribute("msg","댓글성공");
		}else {
			model.addAttribute("msg","댓글실패");
		}
		model.addAttribute("loc","/boardView.do?boardNo="+mc.getBoardNo());
		return "common/msg";
	}
}













