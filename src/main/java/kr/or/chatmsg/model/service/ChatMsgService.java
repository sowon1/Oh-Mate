package kr.or.chatmsg.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.or.chatmsg.model.dao.ChatMsgDao;
import kr.or.chatmsg.model.vo.ChatMsg;


public class ChatMsgService extends TextWebSocketHandler{
		@Autowired
		private ChatMsgDao dao;
		
		//접속한 회원 세션을 저장하는 리스트
		private ArrayList<WebSocketSession> sessionList;
		//접속한 세션의 로그인 아이디를 저장하기 위한 맵
		private HashMap<WebSocketSession, String> memberList;
		
		public ChatMsgService() {
			super();
			sessionList = new ArrayList<WebSocketSession>();
			memberList = new HashMap<WebSocketSession, String>();
		}

		//클라이언트가 최초로 웹소켓 서버에 접속했을 때 수행되는 메소드
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			System.out.println("클라이언트 접속!");
			//클라이언트가 새로 접속하면 웹소켓 세션을 리스트에 추가
			sessionList.add(session);
			System.out.println("접속 회원 수 : "+sessionList.size());
		}
		//클라이언트가 서버에 메세지를 전송했을 때 수행되는 메소드
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			//jsp에서 ws.send()로 보낸 데이터
			System.out.println(message.getPayload());
			//문자열을 Json으로 처리하기 위한 객체생성
			JsonParser parser = new JsonParser();
			//parser를 이용해서 String -> Json으로 변환
			JsonElement element = parser.parse(message.getPayload());
			//키가 type인 값 추출
			String type = element.getAsJsonObject().get("type").getAsString();
			//키가 msg인 값 추출
			String msg = element.getAsJsonObject().get("msg").getAsString();
			if(type.contentEquals("enter")) {
				//채팅방에 처음 들어오면 아이디를 map에 저장
				memberList.put(session, msg);
				String sendMsg = "<p>"+msg+"님이 입장하셨습니다.</p>";
				for(WebSocketSession s : sessionList) {
					if(!s.equals(session)) { //입장메세지 전송 시 본인은 제외
						//클라이언트로 전송할 메세지 객체 생성
						TextMessage tm = new TextMessage(sendMsg);
						//클라이언트에게 전송
						s.sendMessage(tm);
					}
				}
			} else if(type.equals("chat")) {
				String sendMsg = "<div class='chat left'><span class='chatId'>"+memberList.get(session)+" : </span>"+msg+"</div>";
				for(WebSocketSession s : sessionList) {
					if(!s.equals(session)) {
						TextMessage tm = new TextMessage(sendMsg);
						s.sendMessage(tm);
					}
				}
			}
		}
		//클라이언트가 연결을 끊을 때 수행되는 메소드
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
			sessionList.remove(session);
			String sendMsg = "<p>"+memberList.get(session)+"님이 퇴장하셨습니다.</p>";
			TextMessage tm = new TextMessage(sendMsg);
			for(WebSocketSession s : sessionList) {
				s.sendMessage(tm);
			}
			memberList.remove(session);
		}
	
		//채팅 메세지 조회
		public ArrayList<ChatMsg> selectChatOneMsg(int chatNo) {
			ArrayList<ChatMsg> list = dao.selectChatOneMsg(chatNo);
			return list;
		}
	
	
	
}
