package kr.or.chatmsg.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.or.chat.model.vo.Chat;
import kr.or.chatmsg.model.dao.ChatMsgDao;
import kr.or.chatmsg.model.vo.ChatMsg;


public class ChatMsgService extends TextWebSocketHandler{
		@Autowired
		private ChatMsgDao dao;
		
		//접속한 회원 세션을 저장하는 리스트
		private ArrayList<WebSocketSession> sessionList;
		//접속한 세션의 로그인 아이디를 저장하기 위한 맵
		private HashMap<String, WebSocketSession> memberList;
		
		public ChatMsgService() {
			super();
			sessionList = new ArrayList<WebSocketSession>();
			memberList = new HashMap<String, WebSocketSession>();
		}

		//클라이언트가 최초로 웹소켓 서버에 접속했을 때 수행되는 메소드
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			//System.out.println("Oh-Mate 채팅 접속!");
			//클라이언트가 새로 접속하면 웹소켓 세션을 리스트에 추가
			sessionList.add(session);
			//System.out.println("접속 회원 수 : "+sessionList.size());
		}
		//클라이언트가 서버에 메세지를 전송했을 때 수행되는 메소드
		@Override
		@Transactional
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			//jsp에서 ws.send()로 보낸 데이터
			//System.out.println(message.getPayload());
			//문자열을 Json으로 처리하기 위한 객체생성
			JsonParser parser = new JsonParser();
			//parser를 이용해서 String -> Json으로 변환
			JsonElement element = parser.parse(message.getPayload());
			//키가 type인 값 추출
			String type = element.getAsJsonObject().get("type").getAsString();
			//키가 msg인 값 추출 - 세션 no
			String msg = element.getAsJsonObject().get("msg").getAsString();
			
			if(type.equals("enter")) {
				//채팅방에 처음 들어오면 아이디를 map에 저장
				memberList.put(msg, session);
				// no 추출 - 상대방 no
				String no = element.getAsJsonObject().get("no").getAsString();
				//chat_no 구하고
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("msg", msg);
				map.put("no", no);
				//채팅방 조회
				int chatNo = dao.selectChatNo(map);
				map.put("chatNo", chatNo);
				//읽음 구분 업데이트 
				int statusUp = dao.updateChatStatus(map);
				
				WebSocketSession s = memberList.get(no);
				if(s != null) {				
					HashMap<String, String> resultMap = new HashMap<String, String>();
					resultMap.put("type", "1");
					resultMap.put("chatNo", String.valueOf(chatNo));
					TextMessage tm = new TextMessage(new Gson().toJson(resultMap));
					//클라이언트에게 전송
					s.sendMessage(tm);
				}
			} else if(type.equals("chat")) {
				//insert에 필요한 값 추출
				//키가 receiver인 값 추출 - 메세지
				String receiver = element.getAsJsonObject().get("receiver").getAsString();
				//키가 sender인 값 추출 - 메세지
				String sender = element.getAsJsonObject().get("sender").getAsString();
				//키가 chatNo인 값 추출 - 메세지
				String chatNo = element.getAsJsonObject().get("chatNo").getAsString();
				//chat_message 테이블에 insert
				//상대방화면에 보여줄 메세지(접속한 경우에만)
				//화면으로 채팅전송(접속한경우)
				HashMap<String, Object> sendMap = new HashMap<String, Object>();
				sendMap.put("sender", sender);
				sendMap.put("receiver", receiver);
				sendMap.put("chatNo", chatNo);
				sendMap.put("msg", msg);
				//되돌려줄때 
				// no 추출 - 상대방 no
				WebSocketSession s = memberList.get(receiver);
				if(s != null) {
					sendMap.put("readCount", "y");
				}else {
					sendMap.put("readCount", "n");
				}
				int c = dao.insertChatMsg(sendMap);
				//msg 메세지 , receiver 접속해서 보낸사람, no 받는사람 - header에서 보낸거는
				//서비스에선 - 
				//되돌려줄때 프로필 정보 조회
				if(c > 0) {
					int chatmsgNo = dao.selectChatOneMsgNo(sendMap);
					sendMap.put("messageNo", chatmsgNo);
				}
				ChatMsg cm = dao.selectChatOneMsgReturn(sendMap);
				HashMap<String, String> resultMap = new HashMap<String, String>();
				HashMap<String, String> resultMap1 = new HashMap<String, String>();
				resultMap.put("type","2");
				String sendMsg = "<div class='mate_talk_left'><img src='/resources/upload/member/"+cm.getFilepath()+".png'><div class='mate_talk_left_line'><span class='mate_talk_msg_name'>"+cm.getSenderName()+"</span><div class='mate_talk_view_left_one'><span class='mate_talk_left_msg'>"+cm.getMessageContent()+"</span><div class='mate_talk_msg_side'><span class='mate_talk_left_date'>"+cm.getMessageDate()+"</span></div></div></div></div>";
				resultMap.put("msg", sendMsg);
				if(s != null) {
					TextMessage tm = new TextMessage(new Gson().toJson(resultMap));
					//System.out.println(tm);
					s.sendMessage(tm);
					resultMap1.put("type", "3");
					resultMap1.put("flag", "1");
				}else {
					resultMap1.put("type", "3");
					resultMap1.put("flag", "2");
				}
				TextMessage tm = new TextMessage(new Gson().toJson(resultMap1));
				session.sendMessage(tm);
				
			}
		}
		//클라이언트가 연결을 끊을 때 수행되는 메소드
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
			//System.out.println("gggg");
			sessionList.remove(session);
			memberList.remove(session);
		}
	
		//채팅 메세지 조회
		public ArrayList<ChatMsg> selectChatOneMsg(int chatNo) {
			ArrayList<ChatMsg> list = dao.selectChatOneMsg(chatNo);
			return list;
		}
	
	
	
}
