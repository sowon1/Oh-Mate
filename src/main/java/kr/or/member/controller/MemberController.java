package kr.or.member.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.common.Tour;
import kr.or.board.model.service.BoardService;
import kr.or.helper.model.service.HelperService;
import kr.or.helper.model.vo.Helper;
import kr.or.house.model.service.HouseService;
import kr.or.house.model.vo.House;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;
import kr.or.profile.model.vo.Profile;
import kr.or.room.model.service.RoomService;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private HouseService houseService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private HelperService helperService;
	
	//로그인1 hdy
	@RequestMapping(value="/login.do")
	public String login(Member member, HttpSession session, Model model) {
		Member m = service.selectOneMember(member);
		if(m != null) {  // 로그인  성공
			if(m.getMemberLevel() == 3 || m.getMemberLevel() == 6 || m.getMemberLevel() == 7) {  // 정지회원
				if(session!=null) {
					session.invalidate();
					model.addAttribute("msg","계정 정지 회원입니다. 관리자에게 문의하세요.");
					model.addAttribute("loc","/");
				}
				
			}else {  // 그 외
				session.setAttribute("m", m);
				model.addAttribute("msg","로그인 성공~");
			}
		}else {  // 로그인 실패
			model.addAttribute("msg","아이디 또는 비밀번호를 다시 확인해주세요.");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	/* 로그인2 
	@RequestMapping(value="/login.do")
	public String login1(Member member, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", member.getMemberId());
		map.put("memberPw", member.getMemberPw());
		int m = service.selectOneMember1(map);
		if(m == 1) {
			model.addAttribute("msg","로그인 성공");
		}else {
			model.addAttribute("msg","아이디 또는 비밀번호를 확인해주세요");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	 */

	//로그아웃 hdy
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//회원가입 이동 (일반회원or기업) hdy
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
	
	//메이트 회원가입 이동 hdy
	@RequestMapping(value="/joinMate")
	public String joinMate() {
		return "member/joinMate";
	}
	
	//하우스오더 회원가입 이동 hdy
	@RequestMapping(value="/joinOwner")
	public String joinOwner() {
		return "member/joinOwner";
	}

	//메이트 회원가입 hdy
	@RequestMapping(value="/join1.do")
	public String join1(Member member, MultipartFile uploadFile, HttpServletRequest request, Model model){

		if(uploadFile.isEmpty()) { //첨부파일이 없는경우
			
		}else { //첨부파일이 있는경우
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member/");
			
				//파일처리(파일업로드)
				String filename = uploadFile.getOriginalFilename();   
				String onlyFilename = filename.substring(0,filename.indexOf("."));  
				String extention = filename.substring(filename.indexOf("."));  
				
				//실제 업로드 할 파일명을 저장할 변수
				String filepath = null;   
				
				//파일명 중복 시 숫자를 붙이는 코드
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
				//System.out.println(savePath+filepath);
				FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
				//업로드 속도증가를 위한 보조스트림
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				//파일업로드
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
			member.setFilepath(filepath);
	}// else	
		
		//System.out.println("join1 " +member.toString());
		int result = service.join(member);  
		
		if(result > 0) {   // 성공 
			model.addAttribute("msg","회원가입 성공하였습니다~!");
			model.addAttribute("loc","/");
		}else {
			model.addAttribute("msg","회원가입 실패하였습니다.");
			model.addAttribute("loc","/joinMate");
		}
		return "common/msg";
	}
	
	//하우스오너 회원가입  hdy
		@RequestMapping(value="/join2.do")
		public String join2(Member member, MultipartFile uploadFile, HttpServletRequest request, Model model){

			if(uploadFile.isEmpty()) { //첨부파일이 없는경우
				
			}else { //첨부파일이 있는경우
				String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member/");
				
					//파일처리(파일업로드)
					String filename = uploadFile.getOriginalFilename();   
					String onlyFilename = filename.substring(0,filename.indexOf("."));  
					String extention = filename.substring(filename.indexOf("."));  
					
					//실제 업로드 할 파일명을 저장할 변수
					String filepath = null;   
					
					//파일명 중복 시 숫자를 붙이는 코드
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
					//System.out.println(savePath+filepath);
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					//업로드 속도증가를 위한 보조스트림
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					//파일업로드
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
				member.setFilepath(filepath);
		}// else	
			//파일 저장할 경로 
			
			System.out.println("join2 " + member.toString());
			int result = service.join(member);  
			
			if(result > 0) {   // 성공 
				model.addAttribute("msg","회원가입 성공하였습니다~!");
				model.addAttribute("loc","/");
			}else {
				model.addAttribute("msg","회원가입 실패하였습니다.");
				model.addAttribute("loc","/joinOwner");
			}
			return "common/msg";
		}
		
	//회원가입_아이디 중복체크 hdy
	@ResponseBody
	@RequestMapping(value="/IdCheck.do")
    public String idCheck(String memberId){
        Member m = service.idCheck(memberId);
        if(m == null) {
        	return "1";  //사용가능 아이디
        }else {
        	return "2";  //사용불가 아이디
        }
    }

	//회원가입_이메일 중복체크 hdy
	@ResponseBody
	@RequestMapping(value="/emailCheck.do")
	public String emailCheck(String email) {
		Member m = service.emailCheck(email);
		if(m == null) {
			return "2";  //사용가능 이메일
		}else {
			return "3";  //사용불가 이메일
		}
	}
	
	//이메일 인증  hdy
    @ResponseBody
    @RequestMapping(value="/mailCheck")
    public String mailCheck(String email){
        
        //뷰(View)로부터 넘어온 데이터 확인 
    	System.out.println("이메일 데이터 전송 확인");
    	System.out.println("인증번호 : " + email);
    	
    	//인증번호(난수) 생성
    	Random random = new Random();
    	int checkNum = random.nextInt(888888) + 111111;
    	System.out.println("인증번호 : " + checkNum);
    	
        // 이메일 보내기 
        String setFrom = "ohmate123@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "(주)오나의메이트를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        try {        
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);    
        }catch(Exception e) {
            e.printStackTrace();
        }
	        String num = Integer.toString(checkNum);
			return num;
    	}
	
	//아이디찾기 이동 hdy
	@RequestMapping(value="/searchIdFrm.do")
	public String searchIdFrm() {
		return "member/searchId";
	}
 	
	//아이디찾기 hdy
	@RequestMapping(value="/searchId.do")
	public String searchId(Member member, Model model) {
		Member m = service.searchId(member);
		if(m != null) {
			model.addAttribute("msg","아이디는 ["+m.getMemberId()+"] 입니다.");	
		}else {
			model.addAttribute("msg","회원정보가 없습니다.");
		}
		model.addAttribute("loc","/");
		return "common/msg";	
	}
	
	//비밀번호찾기 이동 hdy
	@RequestMapping(value="/searchPwFrm.do")
	public String searchPwFrm() {
		return "member/searchPw";
	}
	
	//비밀번호 찾기 hdy
	@RequestMapping(value="/searchPw.do")
	public String searchPw(Member member, Model model) {
		Member m = service.searchPw(member);
		if(m != null) {
			model.addAttribute("msg","비밀번호는 ["+m.getMemberPw()+"] 입니다.");
		}else {
			model.addAttribute("msg","회원정보가 없습니다.");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	//마이페이지 이동 hdy
	@RequestMapping(value="/myPage.do")
	public String myPageFrm() {
		return "member/myPage";
	}
	
	//마이페이지_수정 hdy
	@RequestMapping(value="/myPageUpdate.do")
	public String myPageUpdate(Member member, String memberId, Profile p, MultipartFile uploadFile, HttpServletRequest request, Model model, HttpSession session) {
		if(uploadFile.isEmpty()) { //첨부파일이 없는경우
			
		}else { //첨부파일이 있는경우
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member/");
			
			//파일처리(파일업로드)
			String filename = uploadFile.getOriginalFilename();   
			String onlyFilename = filename.substring(0,filename.indexOf("."));  
			String extention = filename.substring(filename.indexOf("."));  
			
			//실제 업로드 할 파일명을 저장할 변수
			String filepath = null;   
			
			//파일명 중복 시 숫자를 붙이는 코드
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
				//System.out.println(savePath+filepath);
				FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
				//업로드 속도증가를 위한 보조스트림
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				//파일업로드
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
			member.setFilepath(filepath);
		}// else	
		int result = service.myPageUpdate(member);
		if(result>0) {   // 성공 (정보변경했을 때 변경된게 반영안됨, 회원정보 다시 조회해서 세션에 다시 넣어줌)
			model.addAttribute("msg","회원정보 수정 완료~");
			Member m = service.selectOneMember(member);
			Profile pr = service.selectProfile(memberId);
			session.setAttribute("m", m);
			model.addAttribute("pr",pr);
		}else {    
			model.addAttribute("msg","회원정보 수정 실패");
		}
		model.addAttribute("loc","/myPage.do?memberId="+member.getMemberId());
		return "common/msg";
	}
	
	//회원탈퇴 hdy
	@RequestMapping(value="/deleteMember.do")
	public String deleteMember(int memberNo, HttpSession session, Model model) {
		int result = service.deleteMember(memberNo);
		if(result>0) {
			model.addAttribute("msg","정상적으로 탈퇴 되었습니다.");
			session.invalidate();
		}else {
			model.addAttribute("msg","탈퇴 실패");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}	
	
	//찜목록 불러오기-jjh
	@RequestMapping(value = "/bookmarkHouseList.do")
	public String bookmarkHouseList(Model model, HttpSession session) {
		if(session != null) {
			Member m = (Member)session.getAttribute("m");
			int memberNo = 0;
			if(m != null)
			{
				memberNo = m.getMemberNo();
			}	
			ArrayList<House> list = houseService.selectBookmarkHouse(memberNo);
			model.addAttribute("list", list);
		}
		return "member/bookmarkHouseList";
	}
	
	//투어신청 리스트 jjh
	@RequestMapping(value = "/tourRequestList.do")
	public String tourRequestList(Model model, HttpSession session, int reqPage) {
		if(session != null) {
			Member m = (Member)session.getAttribute("m");
			int memberNo = 0;
			if(m != null)
			{
				memberNo = m.getMemberNo();
			}	
			HashMap<String, Object> data = roomService.tourRequestList(memberNo, reqPage);
			model.addAttribute("list", data.get("list"));
			model.addAttribute("pageNavi", data.get("pageNavi"));
		}
		return "member/tourRequestList";
	}

	
	//헬프 요청내역
	@RequestMapping(value = "/helpList.do")
	public String helpList() {
		//작성중
		return "member/helpList";
	}

	//마이페이지_커뮤니티 게시글 보기hdy
	@RequestMapping(value="/communityList.do")
	public String communityConfirm(int reqPage, String memberId, Model model) {
		HashMap<String, Object> map = boardService.communityConfirm(reqPage, memberId);
		model.addAttribute("pageNavi",map.get("pageNavi"));
		model.addAttribute("list",map.get("list"));
		model.addAttribute("start",map.get("start")); 
		return "member/communityList";
	}
	
	//마이페이지_커뮤니티 댓글 보기 hdy 
	@ResponseBody
	@RequestMapping(value="/myCommunity.do", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String commentConfirm(int reqPage, String memberId, Model model) {
		HashMap<String, Object> map = boardService.commentConfirm(reqPage, memberId);
		//System.out.println("map : "+ map);
		return new Gson().toJson(map);
	}
	
	//찜한 헬퍼 
	@RequestMapping(value = "/bookmarkHelper.do")
	public String bookmarkHeler(Model model, HttpSession session) {
		if(session != null) {
			Member m = (Member)session.getAttribute("m");
			int memberNo = 0;
			if(m != null)
			{
				memberNo = m.getMemberNo();
			}	
			ArrayList<Helper> list = helperService.selectBookmarkHelperList(memberNo);
			model.addAttribute("list",list);
		}
		return "/member/bookmarkHelper";
	}
	
	//입주 내역
	@RequestMapping(value = "/moveInList.do")
	public String moveInList() {
		return "/member/moveInList";
	}
}
