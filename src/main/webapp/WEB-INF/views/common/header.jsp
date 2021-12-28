<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<!-- jQuery라이브러리 -->
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<!--  JSTL 확장 c 태그 선언문 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 폰트어썸(아이콘) -->
<link rel="stylesheet" href="/resources/fontawesome/css/all.css">
<script type="text/javascript" src="/resources/fontawesome/js/all.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<!-- 부트스트랩용 jQuery -->
<script type="text/javascript" src="/resources/js/bootstrap.bundle.min.js"></script>
<!-- 기본 CSS -->
<link rel="stylesheet" href="/resources/css/default.css">
<!-- 폰트 CSS -->
<link rel="stylesheet" href="/resources/css/font.css">
<!-- 채팅방 css -->
<link rel="stylesheet" href="/resources/css/main/mate_talk.css">
<!-- 날짜관련 js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
</head>
<div class="back_dark"></div>
<div class="tour_back_dark"></div>
<div class="nav_wrap">
    <nav class="nav">
        <div class="brand_logo">
            <a href="/">Oh-Mate!</a>
        </div>
        <ul class="nav_left">
            <li>
                <a href="/houseList.do">방 찾기</a>
            </li>
            <li>
                <a href="/helperList.do">도와줘요</a>
            </li>
            <li>
                <a href="/communityFrm.do">커뮤니티</a>
            </li>
            <li>
                <a href="/noticeList.do?reqPage=1">공지사항</a>
            </li>
        </ul>
        <ul class="nav_right">
           	<c:choose>
           		<%-- 로그아웃 상태 --%>
           		<c:when test="${empty sessionScope.m}">
           			<li>
           				<a data-toggle="modal" href="#modal1">로그인</a>
           			</li>
           			<li>
           				<a href="/joinFrm.do">회원가입</a>
           			</li>
           		</c:when>
           		<%-- 로그인 시 --%>
           		<c:otherwise>
		           	<c:choose>
           				<%-- 관리자인 경우 대시보드 포인트 메뉴로 표시 --%>
           				<c:when test="${sessionScope.m.memberLevel eq 0 }">
           					<!-- <li>
				                <a href="/dashboard.do" class="nav_point"><span>관리자 대시보드</span></a>
				            </li>   -->        		
           					<li>
				                 <!-- 마이페이지 버튼  -->
				                <a id="nav_mypage_wrapper" class="nav_point">
				                    <span id="nav_mypage">관리 메뉴</span>
				                </a>    
				            </li>          		
           				</c:when>
           				<%-- 관리자 이외 회원은 마이페이지 버튼만 표시 --%>
           				<c:otherwise>
				            <li>
				                 <!-- 마이페이지 버튼  -->
				                <a id="nav_mypage_wrapper" class="nav_point">
				                    <span id="nav_mypage">마이페이지</span>
				                </a>    
				            </li>          		
           				</c:otherwise>
           			</c:choose>
           		</c:otherwise>
           	</c:choose>
        </ul>
    </nav>
</div>
	<!-- 로그인 modal -->
	<div class="modal" id="modal1">
		<div class="modal-dialog" role="document" style="margin-top:100px;">
			<div class="modal-content">
				<div class="modal-header login_header">
					<h5 class="modal-title login_title">Login</h5>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<form action="/login.do" method="post" class="loginForm">
					<div class="modal-body">
						<div class="form-group">
							<label for="memberId">아이디</label>
							<input type="text" name="memberId" class="form-control" placeholder="아이디입력" >
						</div><br>
						<div class="form-group">
							<label for="memberPw">비밀번호</label>
							<input type="password" name="memberPw" class="form-control" placeholder="비밀번호입력" >
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" style="width:100%; line-height: normal;">로그인</button>
							<a href="/searchIdFrm.do" class="searchMember">아이디 찾기</a>|
							<a href="/searchPwFrm.do" class="searchMember">비밀번호 찾기</a>|
							<a href="/joinFrm.do" class="searchJoin">가입하기</a>
					</div>
				</form>		
			</div>
		</div>
	</div>
	
<!-- 로그인 하고 마이페이지 누를경우 오른쪽에서 나타나는 슬라이딩 메뉴 -->
<c:choose>
	<%-- 1.회원등급 :  --%>
	<c:when test="${sessionScope.m.memberLevel eq 0}">
		<nav id="sidenav">
		    <span id="close_sidenav">&times;</span>
		    <header>
		    	<c:choose>
		    		<c:when test="${not empty sessionScope.m.filepath}">
		    			<img src="/resources/upload/member/${m.filepath}" class="nav_pro">
		    		</c:when>
		    		<c:otherwise>		    		
				        <img src="/resources/img/icon/profile.png" class="nav_pro">
		    		</c:otherwise>
		    	</c:choose>
		        <p class="name">${sessionScope.m.memberName}</p>
		        <p class="id">${sessionScope.m.memberId}</p>
		    </header>
		    <ul>
		      <li><a href="/memberMgr.do?reqPage=1">회원 관리</a></li>
		      <li><a href="/helperMgr.do?reqPage=1">헬퍼 신청 관리</a></li>
		      <li><a href="/houseMgr.do?reqPage=1">하우스 등록 관리</a></li>
		      <li><a href="/reportMgr.do?reqPage=1">신고 관리</a></li>
		      <li><a href="/salesMgr.do?reqPage=1">매출 정산</a></li>
		      <li><a href="/logout.do">로그아웃</a></li>
		    </ul>
		</nav>
	</c:when>
	<%-- 2.회원등급 : --%>
	<c:when test="${sessionScope.m.memberLevel eq 1 or sessionScope.m.memberLevel eq 4 or sessionScope.m.memberLevel eq 5}">
		<nav id="sidenav">
		    <span id="close_sidenav">&times;</span>
		    <header>
		        <c:choose>
		    		<c:when test="${not empty sessionScope.m.filepath}">
		    			<img src="/resources/upload/member/${m.filepath}" class="nav_pro">
		    		</c:when>
		    		<c:otherwise>		    		
				        <img src="/resources/img/icon/profile.png" class="nav_pro">
		    		</c:otherwise>
		    	</c:choose>
		        <p class="name">${sessionScope.m.memberName}</p>
		        <p class="id">${sessionScope.m.memberId}</p>
		    </header>
		    <input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.m.memberNo }">
		    <ul>
		      <li><a href="/myPage.do?memberId=${sessionScope.m.memberId }">나의 정보</a></li>
		      <li><a href="/bookmarkHouseList.do">하우스 찜목록</a></li>
		      <li><a href="/moveInList.do?reqPage=1">하우스 입주 내역</a></li>
		      <li><a href="/tourRequestList.do?reqPage=1">투어 신청 내역</a></li>
		      <li><a href="/communityList.do?reqPage=1&memberId=${sessionScope.m.memberId }">커뮤니티 게시글/댓글</a></li>
		      <li><a href="/helpList.do?reqPage=1">헬프 내역</a></li>
		      	<c:if test="${sessionScope.m.memberLevel eq 1 || sessionScope.m.memberLevel eq 5}">
		      	<li>
		      	<a href="javascript:void(0);" class="requestChk">헬퍼 신청하기</a></li>
		      	</c:if>
		      <%-- 헬퍼일경우 헬퍼메뉴 --%>
		      <c:if test="${sessionScope.m.memberLevel eq 4 }">
			    <li><a href="javascript:void(0)" class="requestChk">헬퍼 프로필 수정</a></li>
			    <li><a href="/helperReqList.do?reqPage=1">헬퍼요청내역 확인</a></li>
			    <li><a href="/helperReqListAdjust.do?reqPage=1">헬퍼 정산 내역</a></li>
		      </c:if>   	
		      <li><a href="/logout.do">로그아웃</a></li>
		    </ul>
		</nav>
	</c:when>
	<%-- 2.회원등급 :  --%>
	<c:when test="${sessionScope.m.memberLevel eq 2}">
		<nav id="sidenav">
		    <span id="close_sidenav">&times;</span>
		    <header>
		        <c:choose>
		    		<c:when test="${not empty sessionScope.m.filepath}">
		    			<img src="/resources/upload/member/${m.filepath}" class="nav_pro">
		    		</c:when>
		    		<c:otherwise>		    		
				        <img src="/resources/img/icon/profile.png" class="nav_pro">
		    		</c:otherwise>
		    	</c:choose>
		       <p class="name">${sessionScope.m.memberName}</p>
		        <p class="id">${sessionScope.m.memberId}</p>
		    </header>
		    <ul>
		      <li><a href="/houseWriteFrm.do">하우스 등록</a></li>
		      <li><a href="/houseOwnerList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1">내 하우스 리스트</a></li>
		       <li><a href="/houseAdjustPayTS.do?reqPage=1">하우스 입주 정산내역</a></li>
		      <li><a href="/logout.do">로그아웃</a></li>
		    </ul>
		</nav>
	</c:when>
</c:choose>
 <!-- --------------------------------------신고 팝업------------------------------------------------------ -->
<div class="chatre_popup_modal">
   	<div class="chre_pop_modal">
    		<div class="chre_modal_top">
      		<span class="chre_modal_text">신고</span>
          	<span class="chre_modal_close" style="cursor: pointer;"><img src="/resources/img/icon/close_wh.png"></span>
       </div>
       <div class="re_modal_content">
       		<form action="/chatReport.do" method="post" class="reform">
       			<table class="help_table">
           			<tr class="table-active_mate_help">
           				<th>신고 대상</th>
           				<td>
           					<input type="text" class="input_03 chat_report" name="atackerName" readonly="readonly">
           					<input type="hidden" class="input_03" name="atacker" readonly="readonly">
           					<input type="hidden" class="input_03" name="reportNum" readonly="readonly">
           				</td>
           			</tr>
           			<tr class="table-active_mate_help">
           				<th>신고자</th>
           				<td>
           					<input type="text" class="input_03" value="${sessionScope.m.memberName}" readonly="readonly">
           					<input type="hidden" class="input_03" value="${sessionScope.m.memberNo}" name="reporter" readonly="readonly">
           				</td>
           			</tr>
           			<tr class="table-active_mate_help">
           				<th>신고분류</th>
           				<td>
           					<input type="text" class="input_03" value="채팅" readonly="readonly">
           				</td>
           			</tr>
           			<tr class="table-active_mate_help">
           				<th>신고사유</th>
           				<td>
           					<textarea name="reportContent" class="textarea_pro"></textarea>
           				</td>
           			</tr>
          			</table>
          			<div class="form_btn">
           			<a class="btn_100" type="submit" onclick="return checkCReVal();">신고하기</a>
           		</div>
       		</form>
       </div>
   	</div>
   </div>
   <div class="form_popup_modal">		       			
       <div class="popup_modal">
          <div class="msg_modal_top">
          		<span class="msg_modal_text"><em class="logo_point">Oh-Mate</em></span>
           </div>
           <div class="msg_modal_content">
           	<h3 class="modal_msg_timetitle"><em id="title_name" class="title_name"></em></h3>
           	<h2 class="modal_msg_timetext">해당 창은 <em id="countdown">3</em>초 후 자동으로 닫힙니다.</h2>
           </div>
   	</div> 
   </div>
<!-- --------------------------------------신고 팝업끝------------------------------------------------------ -->
 
<!-- 메이트톡 리스트 -->
<div class="mate_talk_open">
	<!-- 리스트일때는 채팅방 숨겨놨다가, 클릭했을때 폼 띄워주고 아작스로 조회해서 소켓으로 연결해주던디..
	그리고 리스트는 숨기고..
	채팅목록중에 채팅방하나 선택했을때 해당 채팅방의 대화 기록을 모두 조회(ajax로)
	->ajax success:function(data){
		대화목록 -> 채팅방 화면 전환효과
		채팅방에  대화기록 출력
		채팅 소켓연결	
	}
	목록갈땐 반대로 (소켓은 두개로 따로 돌아가니까)
	 -->
	<div class="mate_talk">
		<div class="mate_talk_list_top">
			<!-- 
			<a href="" class="msg_edit">
				<img src="/resources/img/icon/edit.png">
			</a>
			 -->
			<span style="width:30px;"></span>
			<span class="mate_talk_name">${sessionScope.m.memberName}님 메세지</span>
			<span class="msg_close_btn">
				<img src="/resources/img/icon/close_wh.png">
			</span>
		</div>
		<ul class="mate_talk_list">
			
		</ul>
		<div class="mate_talk_list_bottom">
			<span>오늘부터 메이트, Oh-Mate!</span>
		</div>
	</div>
</div>
<!-- 메이트톡 상세보기 -->
<div class="mate_talk_view_open">
	<div class="mate_talk_view">
		<div class="mate_talk_view_top">
			
		</div>
		<div class="mate_talk_messageArea" id="messages">
			
		</div>
		<div class="mate_talk_sendBox">
			<input type="text" id="sendMsg" class="mate_talk_sendMsg">
			<button id="sendBtn" onclick="sendMsg();" class="mate_talk_btn">전송</button>
		</div>
	</div>
</div>   
<!-- 메이트톡 닫기 -->
<div class="main_btn">
	<c:choose>
       <c:when test="${not empty sessionScope.m}">
	    <a class="chat_icon2" id="mate_talk">
	    	<img src="/resources/img/icon/chat_on.png">
	    </a>
       </c:when>
       <c:otherwise>
	        <a class="chat_icon2" id="mate_talk_login">
		    	<img src="/resources/img/icon/chat_on.png">
		    </a>
	       	<div class="msg_popup_modal">		       			
	             <div class="popup_modal">
	                <div class="msg_modal_top">
	                		<span class="msg_modal_text"><em class="logo_point">Oh-Mate</em></span>
	                     <span class="main_btn_close" style="cursor: pointer;"><img src="/resources/img/icon/close_wh.png"></span>
	                 </div>
	                 <div class="msg_modal_content">
	                 	<h1>로그인이 필요한 기능입니다.</h1>
	                 	<div class="main_modal_btn">
	                  	<a data-toggle="modal" href="#modal1" class="main_btn btn_out main_modal_login">로그인</a>
	                  	<a class="main_btn btn_out main_btn_close">닫기</a>
	                 	</div>
	                 </div>
	         	</div> 
	         </div>
       </c:otherwise>
    </c:choose>
   
    <!-- <a href="#" class="chat_icon"><img src="/resources/img/icon/chatbot_on.png"></a> -->
    <a href="#" class="top"><img src="/resources/img/icon/top.png"></a>
</div>

<script>
	//자동닫기
	function autoClose(){
		   setTimeout('closed()',3000);
	}
	function closed(){
		   countmsgclose();
	}
	//팝업
	function countmsgopen(){
		$(".form_popup_modal").css("display","flex");
	    $("body").css("overflow", "hidden");
	    $(".back_dark").show();
	    
	}
	function countmsgclose(){
		$(".form_popup_modal").css("display","none");
		$("body").css("overflow", "auto");
		$(".back_dark").hide();
	}
	//채팅 신고하기
	function chatreportfrm(){
		var name = $(".mate_talk_view_top").find(".mate_talk_name").html();
		$(".chat_report").val(name);
		chatreportopen();
	}
	$(".chre_modal_close").click(function(){
		chatreportclose();
	});
	function chatreportopen(){
		$(".chatre_popup_modal").css("display","flex");
	    $("body").css("overflow", "hidden");
	    $(".tour_back_dark").show();			
	}
	function chatreportclose(){
		$(".chatre_popup_modal").css("display","none");
	    $("body").css("overflow", "auto");
	    $(".tour_back_dark").hide();			
	}
	//신고 유효성 
	function checkCReVal(){
		if($("textarea[name='reportContent']").val() == ""){					
			 $(".title_name").text("사유를 입력해주세요.");
			 $($("textarea[name='reportContent']")).focus();
			countmsgopen(autoClose());
		}else{
			var reportContent = $("textarea[name='reportContent']").val();
			var no = $(".mate_talk_msg_name").next().next().val();
			$("input[name='atacker']").val(no);
			var chatNo = $(".chat_msg_open").attr('idx');
			$("input[name='reportNum']").val(chatNo);
			$(".reform").submit();
		}
	}

	//matetalk - list
	var receiver = "${sessionScope.m.memberNo}"; 
	var receiverName = "${sessionScope.m.memberName}"; 
	$(function(){
		$("#mate_talk").click(function(){
			$(".mate_talk_list").empty();
			close_chat_helper();
		});
	})
	var receiver = '${sessionScope.m.memberNo}';
	var no;
	//matetalk - talk start
	var ws;
	var messageStatus = "안읽음";
	var messageDate = moment().format('LT');
	var chatNo;
	//ajax먼저 하고 성공시 아래꺼 넣기
	$(document).on("click",".chat_msg_open",function(){
		var chatNo = $(this).attr('idx');		
		var name = $(this).find(".mate_talk_msg_name").html();
		var no = $(this).find(".mate_talk_msg_name").next().next().val();		
		$(".mate_talk_messageArea").empty();
		$(".mate_talk_view_top").empty();
		$.ajax({
			url : "/chatOpenMsg.do",
			data : {chatNo:chatNo},
			type : "POST",
			success : function(data){
				var html = "";
				var top = "";
				top += '<a onclick="chatBack();">';
				top += '<img src="/resources/img/icon/back.png"></a>';							
				top += '<span class="mate_talk_name">'+name+'</span>';				
				top += '<a id="chatReport" value="'+chatNo+'" class="report_icon" onclick="chatreportfrm(name);">';
				top += '<img src="/resources/img/icon/report.png">';
				top += '</a>';
				$(".mate_talk_view_top").append(top);
				for(var i = 0; i < data.length; i++){
					if(data[i].sender != receiver){
						html += '<div class="mate_talk_left">';
						html += '<img src="/resources/upload/member/'+data[i].filepath+'">';
						html += '<div class="mate_talk_left_line">';
						html += '<span class="mate_talk_msg_name">'+data[i].senderName+'</span>';
						html += '<div class="mate_talk_view_left_one">';
						html += '<span class="mate_talk_left_msg">'+data[i].messageContent+'</span>';
						html += '<div class="mate_talk_msg_side">';
						html += '<span class="mate_talk_left_date">'						
						html += moment(data[i].messageDate).format('LT')+'</span></div></div></div></div>';
					}else{
						if(data[i].sender == receiver){							
							html += '<div class="mate_talk_right">';
							html += '<span class="mate_talk_right_date">';
							if(data[i].messageStatus == "n"){
								html += '<span>안읽음</span><br>';
							}
							html += moment(data[i].messageDate).format('LT');
							html += '</span>';
							html += '<span class="mate_talk_right_msg">'+data[i].messageContent+'</span>';
							html += '</div></div>';
						}else{
							
						}
					}
				} //for문 종료
				$(".mate_talk_messageArea").append(html);
				$(".mate_talk_messageArea").scrollTop($(".mate_talk_messageArea")[0].scrollHeight);
				initChat(receiver, no, chatNo);
			}
		})
		
	});
	function chatBack(){
		ws.close();
		close_chat_helper();
	}

	//채팅방 뒤로가기
	function close_chat_helper(){
		$(".mate_talk_view_open").css("right","-500px");
		$(".mate_talk_list").empty();
		$(".mate_talk_open").show();		
		$.ajax({
			type : "post",
			url : "/matetalkList.do",
			data : {receiver:receiver},
			success : function(data){
				var html = "";
				if(data == 0){
					html += '<div class="none_chat">';
					html += '<img src="/resources/img/icon/none_chat_icon.png">';
					html += '<span class="none_chat_text">';
					html += '개설된 채팅방이 없습니다.<br>Oh-Mate 회원들과 함께 채팅을 즐겨보세요.<span>';
					html += '</div>';
				}
				for(var i = 0; i < data.length; i++){
					if(data[i].chatContent == "undefined" || data[i].chatContent == null){
						
					}else{						
						html += '<a  idx="'+data[i].chatNo+'"class="chat_msg_open">';
						html += '<li><div class="talk_profile">';
						if(data[i].filepath == null){
							html += '<img src="/resources/img/icon/profile.png">';
						}else{
							html += '<img src="/resources/upload/member/'+data[i].filepath+'" class="chat_list_pro">';
						}
						html += '</div>';
						html += '<div class="talk_list_text">';
						html += '<div class="talk_list_02">';
						if(data[i].senderName == receiverName){
							html += '<span class="mate_talk_msg_name">'+data[i].receiverName+'</span>';
						}else{						
							html += '<span class="mate_talk_msg_name">'+data[i].senderName+'</span>';
						}
						html += '<span class="mate_talk_list_view">'+data[i].chatContent+'</span>';
						if(receiver == data[i].sender){
							html += '<input type="hidden" value="'+data[i].receiver+'">';							
						}else{
							
							html += '<input type="hidden" value="'+data[i].sender+'">';
						}
						html += '</div>';
						html += '<div class="talk_list_time">';
						html += '<span class="mate_talk_time">'+moment(data[i].chatDate).startOf('MMMM Do, h:mm').fromNow()+'</span>';
						if(data[i].readCount == 0 || data[i].messageDirection == "보낸메세지"){
							
						}else{							
							html += '<span class="mate_talk_read_count">'+data[i].readCount+'</span>';
						}
						html += '</div></div></li></a>';					
					}
				}//for문 종료
				$(".mate_talk_list").append(html);
			}
		}) //ajax 닫기
	}
	function helptalk(){
		$(".mate_talk_view_open").css("right","40px");
		$(".chat_icon2").find("img").attr("src","/resources/img/icon/chat_close.png");
	}
	function initChat(param1,param2,param3){
		receiver = param1;
		no = param2;
		chatNo = param3;
		//웹소켓 연걸 시도
		ws = new WebSocket("ws://192.168.10.21/chat.do");
		//웹소켓 연결이 성공하면 실행할 함수
		ws.onopen = startChat;
		//서버에서 화면으로 데이터를 전송하면 처리할 함수
		ws.onmessage = receiveMsg;
		//웹소켓 연결이 종료되면 실핼할 함수 지정
		ws.onclose = endChat;
		//ws.close(); 소켓 종료
		$(".mate_talk_open").hide();
		$(".mate_talk_view_open").css("right","40px");
	}
	function startChat() {
		var data = {type:"enter", msg:receiver, no : no};
		ws.send(JSON.stringify(data));
	}
	function receiveMsg(param) {	
		var obj = JSON.parse(param.data);
		if(obj.type == "1"){
			if(obj.chatNo == $("#chatReport").attr("value")){
				var arr = $(".mate_talk_right_date");
				for(var i=0;i<arr.length;i++){
					arr.eq(i).children().first().empty();
				}
			}
		}else if(obj.type == "2"){
			appendChat(obj.msg);
		}else if(obj.type == "3"){
			if(obj.flag == "1"){
				$(".mate_talk_right_date").find("span").html("");
			}else{
				$(".mate_talk_right_date").find("span").html("안읽음");			
			}
		}
		
	}
	function endChat() {
	}
	function appendChat(msg) {
		$(".mate_talk_messageArea").append(msg);
		$(".mate_talk_messageArea").scrollTop($(".mate_talk_messageArea")[0].scrollHeight);
	}
	function sendMsg() {
		var msg = $("#sendMsg").val();
		if(msg != '') {
			//msg 메세지 , receiver 접속해서 보낸사람, no 받는사람
			var data = {type:"chat", msg:msg, sender:receiver, receiver : no, chatNo : chatNo};
			ws.send(JSON.stringify(data));
			appendChat("<div class='mate_talk_right'><span class='mate_talk_right_date'>"+"<span>"+messageStatus+"</span>"+"<br>"+messageDate+"</span><span class='mate_talk_right_msg'>"+msg+"</div>");
			$("#sendMsg").val("");
		}
	}
	$(function(){
		$("#sendMsg").keyup(function(key){
			if(key.keyCode == 13) {		//키보드 13번 -> enter
				sendMsg();
			}
		});
	});
	
	
	//비 로그인 시 메신저 버튼누를경우 
	$("#mate_talk_login").click(function(){
		msgpopupopen();
	});
	//팝업 열때의 함수
	function msgpopupopen(){
		$(".msg_popup_modal").css("display","flex");
	    $('body').css("overflow", "hidden"); //모달시 스크롤 방지
	    $(".back_dark").show();
	}
	//닫을때의 함수
	function msgpopupclose(){
		$(".msg_popup_modal").css("display","none");
	    $('body').css("overflow", "auto");
	    $(".back_dark").hide();
	}
	//닫기 버튼 
	$(".main_btn_close").click(function(){
		msgpopupclose();
	});
	//로그인 누를경우 닫기버튼
	$(".main_modal_login").click(function(){
    	msgpopupclose();
    });
	$(document).mouseup(function (e){
	//마우스 영역 밖 클릭 시 모달 닫기
	var container = $('.msg_popup_modal');
	    if( container.has(e.target).length === 0){
	    container.css('display','none');
	    $('body').css("overflow", "auto"); //본문 스크롤 살리기
	    }
	});
	//채팅 아이콘 이미지변경, 나타나는 함수
	function matetalkbtn(obj){
		var img = $(".main_btn a").first().children("img");
		if($(".mate_talk_view_open").css("right") == "40px"){
			$(".mate_talk_view_open").css("right","-500px");
		}else if($(".mate_talk_view_open").css("right") == "-500px"){			
			$(".mate_talk_open").slideToggle('slow');
		}
		img.attr("src",function(index,attr){
			if(attr.match('chat_on')){
				return attr.replace("chat_on","chat_close");
			}else{
				return attr.replace("chat_close","chat_on");
			}
		})
	}
	//채팅방 아이콘 클릭
	$("#mate_talk").click(function(){
		matetalkbtn();
	});
	//채팅방 닫기 클릭
	$(".msg_close_btn").click(function(){
		matetalkbtn();
	});
	//쪽지아이콘 클릭 시 toggle
	$(function(){
	    $(".submenu").prev().click(function(){
	        $(this).next().slideToggle();
	        $(this).children(".more").toggleClass("more_active");
	    });
	});
  $("#nav_mypage").click(function() {
      $("#sidenav").css("right", "0");
    $(".back_dark").show();
  });
  $("#close_sidenav").click(function() {
      $("#sidenav").css("right", "-350px");
    $(".back_dark").hide();
  });
  // 백그라운드 클릭 시 메뉴 닫기 
  $(".back_dark").click(function(){
      $('#sidenav').css("right", "-350px");
      $(".back_dark").hide();
  }); 
  /* // 일정 스크롤 내릴 경우 나타나는 top 버튼 , 채팅버튼
  $( document ).ready( function() {
       // 처음에는 안보이게 숨기기
       $(".main_btn").hide();
       //  스크롤 탑 + fadein 효과 
       $(window).scroll(function(){
       if(	$(this).scrollTop() > 200){	
           $(".main_btn").fadeIn();	
       }
       else{	
           $(".main_btn").fadeOut();	
       }			
       });
       //클릭했을 때 스르륵 올라가도록 애니메이션 효과
       $(".top").click(function(){
       $('body,html').animate({
           scrollTop:0 
       },400 );
       return false;
       });
   }); */
   
	$(".requestChk").click(function() {
		var memberNo = $("#memberNo").val();
		console.log(memberNo);
		$.ajax({
			url : "/listCheck.do",
			data: {memberNo:memberNo},
			success:function(data){		
				if(data ==0){
					location.href = "/helperRequestFrm.do";	
				}else if(data == 1){
					if(confirm("헬퍼 등록을 이미 하셨거나 요청중입니다. 수정하시겠습니까?" )){
					location.href ="/helperRequestUpdateFrm.do?memberNo="+memberNo+"&helperStatus=1";
					}
				}else if(data ==3){
					if(confirm("헬퍼등록이 거절되셨거나 재요청중입니다. 다시 수정하시겠습니까? ")){
					location.href ="/helperRequestUpdateFrm.do?memberNo="+memberNo+"&helperStatus=4";
					}
				}
			}
		});
	});
	
	
   <!-- 챗봇 -->
     (function() {
       var w = window;
       if (w.ChannelIO) {
         return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
       }
       var ch = function() {
         ch.c(arguments);
       };
       ch.q = [];
       ch.c = function(args) {
         ch.q.push(args);
       };
       w.ChannelIO = ch;
       function l() {
         if (w.ChannelIOInitialized) {
           return;
         }
         w.ChannelIOInitialized = true;
         var s = document.createElement('script');
         s.type = 'text/javascript';
         s.async = true;
         s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
         s.charset = 'UTF-8';
         var x = document.getElementsByTagName('script')[0];
         x.parentNode.insertBefore(s, x);
       }
       if (document.readyState === 'complete') {
         l();
       } else if (window.attachEvent) {
         window.attachEvent('onload', l);
       } else {
         window.addEventListener('DOMContentLoaded', l, false);
         window.addEventListener('load', l, false);
       }
     })();
     ChannelIO('boot', {
       "pluginKey": "f469f15c-2ce8-4955-93b3-62a6beb7ee5f"
     });
 </script>