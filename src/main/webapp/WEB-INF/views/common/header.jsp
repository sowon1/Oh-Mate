<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 기본 CSS -->
<link rel="stylesheet" href="/resources/css/default.css">
<!-- 폰트 CSS -->
<link rel="stylesheet" href="/resources/css/font.css">
<!-- jQuery라이브러리 -->
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<!--  JSTL 확장 c 태그 선언문 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><head>

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
                <a href="#">커뮤니티</a>
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
           		<c:when test="${empty sessionScope.member}">
           			<li>
           				<a href="/login">로그인</a>
           			</li>
           			<li>
           				<a href="/join">회원가입</a>
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
<!-- 로그인 하고 마이페이지 누를경우 오른쪽에서 나타나는 슬라이딩 메뉴 -->
<c:if test="">
	<c:choose>
		<%-- 1.회원등급 :  --%>
		<c:when test="">
			<nav id="sidenav">
			    <span id="close_sidenav">&times;</span>
			    <header>
			        <img src="/resources/img/icon/profile.png">
			        <p class="name">관리자</p>
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
		<%-- 2.회원등급 :  --%>
		<c:when test="">
			<nav id="sidenav">
			    <span id="close_sidenav">&times;</span>
			    <header>
			        <img src="/resources/img/icon/profile.png">
			        <p class="name">메이트</p>
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
		<%-- 2.회원등급 :  --%>
		<c:when test="">
			<nav id="sidenav">
			    <span id="close_sidenav">&times;</span>
			    <header>
			        <img src="/resources/img/icon/profile.png">
			        <p class="name">헬퍼</p>
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
</c:if>
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