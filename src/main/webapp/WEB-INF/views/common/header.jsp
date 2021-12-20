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
           					<li>
				                <a href="/dashboard.do" class="nav_point"><span>관리자 대시보드</span></a>
				            </li>          		
           					<li>
				                 <!-- 마이페이지 버튼  -->
				                <a id="nav_mypage_wrapper">
				                    <span id="nav_mypage">관리 메뉴</span>
				                </a>    
				            </li>          		
           				</c:when>
           				<%-- 관리자 이외 회원은 마이페이지 버튼만 표시 --%>
           				<c:otherwise>
				            <li>
				                 <!-- 마이페이지 버튼  -->
				                <a id="nav_mypage_wrapper">
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
				<div class="modal-header">
			        <div class="brand_logo">
			            <a href="/">Oh-Mate!</a>
			        </div>
					<h5 class="modal-title" style="padding-right:160px;">로그인</h5>
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
		    			<img src="/resources/upload/member/${m.filepath}">
		    		</c:when>
		    		<c:otherwise>		    		
				        <img src="/resources/img/icon/profile.png">
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
		      <li><a href="#">매출 정산</a></li>
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
		    			<img src="/resources/upload/member/${m.filepath}">
		    		</c:when>
		    		<c:otherwise>		    		
				        <img src="/resources/img/icon/profile.png">
		    		</c:otherwise>
		    	</c:choose>
		        <p class="name">${sessionScope.m.memberName}</p>
		        <p class="id">${sessionScope.m.memberId}</p>
		    </header>
		    <ul>
		      <li><a href="/myPage.do?memberId=${sessionScope.m.memberId }">나의 정보</a></li>
		      <li><a href="/bookmarkHouseList.do">하우스 찜목록</a></li>
		      <li><a href="#">하우스 입주 내역</a></li>
		      <li><a href="/tourRequestList.do?reqPage=1">투어 신청 내역</a></li>
		      <li><a href="/communityConfirm.do">커뮤니티 게시글/댓글</a></li>
		      	<c:if test="${sessionScope.m.memberLevel eq 1 || sessionScope.m.memberLevel eq 5}">
		      	<li>
		      	<input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.m.memberNo }">
		      	<a href="javascript:void(0);" class="requestChk">헬퍼 신청하기</a></li>
		      	</c:if>
		      <%-- 헬퍼일경우 헬퍼메뉴 --%>
		      <c:if test="${sessionScope.m.memberLevel eq 4 }">
			      <li><a href="javascript:void(0)" class="requestChk">헬퍼 프로필 수정</a></li>
			      <li><a href="/helperReqList.do?reqPage=1">헬퍼요청내역 확인</a></li>
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
		    			<img src="/resources/upload/member/${m.filepath}">
		    		</c:when>
		    		<c:otherwise>		    		
				        <img src="/resources/img/icon/profile.png">
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
			<a href="" class="msg_edit">
				<img src="/resources/img/icon/edit.png">
			</a>
			<span class="mate_talk_name">박꼬맹님 메세지</span>
			<span class="msg_close_btn">
				<img src="/resources/img/icon/close_wh.png">
			</span>
		</div>
		<ul class="mate_talk_list">
			<a href="/">
				<li>
					<div class="talk_profile">
						<c:choose>
				    		<c:when test="${not empty m.filepath}">
				    			<img src="/resources/upload/member/${m.filepath}">
				    		</c:when>
				    		<c:otherwise>		    		
						        <img src="/resources/img/icon/profile.png">
				    		</c:otherwise>
				    	</c:choose>
					</div>
					<div class="talk_list_text">
						<div class="talk_list_02">
							<span class="mate_talk_msg_name">박꼬맹</span>
							<span class="mate_talk_list_view">
								미리보기 메세지이이이ㅣㅣㅣㅣㅣㅣㅣaaaaaaaaaaaaaaaa
							</span>
						</div>
						<div class="talk_list_time">
							<span class="mate_talk_time">14:59</span>
							<span class="mate_talk_read_count">99</span>
						</div>
					</div>
				</li>
			</a>
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
			<a href="javascript:history.back();">
				<img src="/resources/img/icon/back.png">
			</a>
			<span class="mate_talk_name">박꼬맹</span>
			<a href="" class="report_icon">
				<img src="/resources/img/icon/report.png">
			</a>
		</div>
		<div class="mate_talk_messageArea" id="messages">
			<p class="mate_talk_notice">박꼬맹님이 채팅방에 입장했습니다.</p>
			<div class="mate_talk_left">
				<img src="/resources/img/icon/profile.png">
				<div class="mate_talk_left_line">
					<span class="mate_talk_msg_name">박꼬맹</span>
					<div class="mate_talk_view_left_one">
						<span class="mate_talk_left_msg">
							안녕? 이건 메세지란다 잘 보이니? 여러줄을 써볼게 잘 가나 보자꾸낭
						</span>
						<div class="mate_talk_msg_side">
							<span class="mate_talk_left_date">
								안읽음<br>
								오전 8:59
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="mate_talk_right">
				<span class="mate_talk_right_date">
					안읽음<br>
					오전 9:00
				</span>
				<span class="mate_talk_right_msg">
					이건 나의 답장이란다 보이니?? 내 마음이 보이니~~~~~~~~~~~~~~~~~~~~~~~~~
				</span>
			</div>
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
		$(".mate_talk_open").slideToggle('slow');
		var img = $(".main_btn a").first().children("img");
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
		$.ajax({
			url : "/listCheck.do",
			data: {memberNo:memberNo},
			success:function(data){
				console.log(data);
				if(data ==0){
					location.href = "/helperRequestFrm.do";	
				}else if(data == 1){
					if(confirm("헬퍼 등록을 이미 하셨거나 요청중입니다. 수정하시겠습니까?" )){
					location.href ="/helperRequestUpdateFrm.do?memberNo=${sessionScope.m.memberNo}&helperStatus=1";
					}
				}else if(data ==3){
					if(confirm("헬퍼등록이 거절되셨거나 재요청중입니다. 다시 수정하시겠습니까? ")){
					location.href ="/helperRequestUpdateFrm.do?memberNo=${sessionScope.m.memberNo}&helperStatus=4";
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