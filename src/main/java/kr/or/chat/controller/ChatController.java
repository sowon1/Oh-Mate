package kr.or.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.chat.model.service.ChatService;
import kr.or.chat.model.vo.Chat;
import kr.or.chatmsg.model.vo.ChatMsg;
import kr.or.common.Report;

@Controller
public class ChatController {
	@Autowired
	private ChatService service;
	
	//채팅 리스트 조회
	@ResponseBody
	@RequestMapping(value="/matetalkList.do", produces = "application/json;charset=utf-8")
	public String matetalkList(int receiver) {
		ArrayList<Chat> data = service.selectMateTalkList(receiver);
		return new Gson().toJson(data);
	}

	//헬프 상세보기 채팅 버튼 눌렀을때 채팅 목록 있는지 조회
	@ResponseBody
	@RequestMapping(value="/chatSelect.do", produces = "application/json;charset=utf-8")
	public String chatSelect(int receiver, int helpNo) {
		int chatNo = service.chatSelect(receiver,helpNo);
		ArrayList<ChatMsg> data = service.selectChat(chatNo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("chatNo", chatNo);
		map.put("list", data);
		return new Gson().toJson(map);
	}
	//채팅 신고
	@RequestMapping(value="/chatReport.do")
	public String chatReport(Model model, Report report) {
		int result = service.insertChatReport(report);
		if(result > 0) {
			model.addAttribute("loc","/");
			model.addAttribute("msg","신고가 접수되었습니다.");
		}else {
			model.addAttribute("loc","/");
			model.addAttribute("msg","신고가 실패되었습니다.");
		}
		return "common/msg";
	}
	
}
