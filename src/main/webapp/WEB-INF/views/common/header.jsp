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
</head>
<div class="back_dark"></div>
<div class="nav_wrap">
    <nav class="nav">
        <div class="brand_logo">
            <a href="/">Oh-Mate!</a>
        </div>
        <ul class="nav_left">
            <li>
                <a href="#">방 찾기</a>
            </li>
            <li>
                <a href="#">도와줘요</a>
            </li>
            <li>
                <a href="/communityFrm.do">커뮤니티</a>
            </li>
            <li>
                <a href="#">공지사항</a>
            </li>
            <li>
                <a href="#" class="nav_point"><span>포인트메뉴</span></a>
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
		            <li>
		                <a href="#"><img src="/resources/img/icon/message.png" class="message_icon"></a>
		            </li>
		            <li>
		                <a href="#"><img src="/resources/img/icon/message.png" class="message_icon"><spsn class="msg_on">3</spsn></a>
		                <ul class="submenu">
		                    <h1>읽지않은 쪽지 <em class="point_pk">3</em><em class="msg_count">개</em></h1>
		                    <li class="msg_li">
		                        <a href="">
		                            <span class="msg_from">관리자</span>
		                            <span class="msg_title">여기는 쪽지 타이틀입니다 1줄만 나오게할거에요</span>
		                            <span class="msg_date">2021.11.25</span>
		                            <span class="msg_read">읽음</span>
		                        </a>
		                    </li>
		                    <li class="msg_li">
		                        <a href="">
		                            <span class="msg_from">보낸이</span>
		                            <span class="msg_title">쪽지타이틀</span>
		                            <span class="msg_date">2021.11.25</span>
		                            <span class="msg_read">읽지않음</span>
		                        </a>
		                    </li>
		                    <li class="msg_li">
		                        <a href="">
		                            <span class="msg_from">보낸이</span>
		                            <span class="msg_title">쪽지타이틀</span>
		                            <span class="msg_date">2021.11.25</span>
		                            <span class="msg_read">읽지않음</span>
		                        </a>
		                    </li>
		                </ul>
		            </li>
		            <li>
		                <a href="#"><img src="/resources/img/icon/message.png" class="message_icon"><spsn class="msg_on">100</spsn></a>
		            </li>
		            <li>
		                 <!-- 마이페이지 버튼  -->
		                <a id="nav_mypage_wrapper">
		                    <span id="nav_mypage">마이페이지</span>
		                </a>    
		            </li>          		
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
							<input type="text" id="memberId" class="form-control" placeholder="아이디입력">
						</div><br>
						<div class="form-group">
							<label for="memberPw">비밀번호</label>
							<input type="password" id="memberPw" class="form-control" placeholder="비밀번호입력">
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
		        <img src="/resources/img/icon/profile.png">
		        <p class="name">관리자</p>
		        <p class="id">oh-mate</p>
		    </header>
		    <ul>
		      <li><a href="/memberMgr.do?reqPage=1">회원관리</a></li>
		      <li><a href="#">메뉴2</a></li>
		      <li><a href="#">메뉴3</a></li>
		      <li><a href="#">메뉴4</a></li>
		      <li><a href="#">메뉴5</a></li>
		      <li><a href="/logout.do">로그아웃</a></li>
		    </ul>
		</nav>
	</c:when>
	<%-- 2.회원등급 : --%>
	<c:when test="${sessionScope.m.memberLevel eq 1 or sessionScope.m.memberLevel eq 4 or sessionScope.m.memberLevel eq 5}">
		<nav id="sidenav">
		    <span id="close_sidenav">&times;</span>
		    <header>
		        <img src="/resources/img/icon/profile.png">
		        <p class="name">메이트</p>
		        <p class="id">oh-mate</p>
		    </header>
		    <ul>
		      <li><a href="#">나의 정보</a></li>
		      <li><a href="#">쪽지함</a></li>
		      <li><a href="#">하우스 찜목록 확인</a></li>
		      <li><a href="#">하우스 입주 내역 확인</a></li>
		      <li><a href="#">투어 신청 내역 확인</a></li>
		      <li><a href="#">커뮤니티 게시글 확인/댓글 확인</a></li>
		      <%-- 헬퍼일경우 헬퍼메뉴 --%>
		      <c:if test="${sessionScope.m.memberLevel eq 4 }">
			      <li><a href="#">메뉴4</a></li>
			      <li><a href="#">메뉴5</a></li>
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
		        <img src="/resources/img/icon/profile.png">
		        <p class="name">하우스오너</p>
		        <p class="id">oh-mate</p>
		    </header>
		    <ul>
		      <li><a href="#">메뉴1</a></li>
		      <li><a href="#">메뉴2</a></li>
		      <li><a href="#">메뉴3</a></li>
		      <li><a href="#">메뉴4</a></li>
		      <li><a href="#">메뉴5</a></li>
		      <li><a href="#">로그아웃</a></li>
		    </ul>
		</nav>
	</c:when>
</c:choose>
<div class="main_btn">
    <a href="#" class="chat_icon2"><img src="/resources/img/icon/chat_close.png"></a>
    <a href="#" class="chat_icon"><img src="/resources/img/icon/chat_on.png"></a>
    <a href="#" class="top"><img src="/resources/img/icon/top.png"></a>
</div>
	
<script>
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
  // 일정 스크롤 내릴 경우 나타나는 top 버튼 , 채팅버튼
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
   });
 </script>