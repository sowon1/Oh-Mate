<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/house/house.css">
<!-- 범위선택 js -->
<link rel="stylesheet" href="/resources/css/nouislider.css">
<script type="text/javascript" src="/resources/js/nouislider.js"></script>
<!-- 지도 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2fe50c2d1b8d26d2ec5e7053eeb12b16&libraries=services,clusterer"></script>
<!-- 슬라이드 css -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<!-- 달력 -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
	<div class="container_mate">
		<div class="house_view">
			<div class="house_view_section01">
				<div class="section01_left">    
			        <div class="swiper mySwiper" id="house-slide">
			            <div class="swiper-wrapper">
							<c:forEach items="${photo}" var="p">
								<div class="swiper-slide">
									<img src="/resources/upload/house/${p.photoPath}">
								</div>
							</c:forEach>
			        	</div>
				    </div>
				</div>
				<div class="section01_right">
					<div class="section01_right_top">
						<div class="like_house_view">
	                          	
	                     </div>
					</div>
					<div class="section01_right_text">
							<c:choose>
								<c:when test="${h.likeCount == 50}">
									<span class="list_tag_pk">
										Hot Like
									</span>
								</c:when>
							</c:choose>
						<span class="list_tag">
                        	<c:choose>
                        		<c:when test="${h.houseGender == '1'}">
                        			남성전용
                        		</c:when>
                        		<c:when test="${h.houseGender == '2'}">
                        			여성전용
                        		</c:when>
                        		<c:otherwise>
                        			남여공용
                        		</c:otherwise>
                        	</c:choose>
                        </span>
                        <span class="list_tag">${h.houseForm}</span>
                        <span class="house_name">${h.houseTitle}</span>
                        <span class="house_addr">
                        	<img src="/resources/img/icon/maps.png">
                        	${h.addressName} ${h.addressRoad}
                        </span>
                        <div class="box_text_house">                    
	                        <span class="box_text_house_title">
	                        	입주 가능한 방
	                        </span>
	                        <span class="box_text_house_title_code">
	                        	${h.roomCount}개
	                        </span>
	                        <span class="box_text_house_title">
	                        	보증금
	                        </span>
	                        <span class="box_text_house_title_code">
	                        	<fmt:formatNumber value="${h.houseCharge}" pattern="#,###"/>원
	                        </span>
	                        <span class="box_text_house_title2">
	                        	💜 <em id="house_view_count">${h.likeCount}</em>명이 관심
	                        </span>
	                        <span class="box_text_house_title_code2">
	                        	중 인 하우스
	                        </span>
                        </div>
					</div>
				</div>
			</div>
			<!-- 2 -->
			<div class="container_mate_house house_view_section2">
				<h1 class="point_title">기본 정보</h1>
				<div class="house_view_section2_top">
					${h.houseContent}
				</div>
				<div class="house_view_section2_bottom">
					<table>
						<tr>
							<th>보증금</th>
							<td><fmt:formatNumber value="${h.houseCharge}" pattern="#,###"/>원</td>
							<th>성별</th>
							<td>
								<c:choose>
	                        		<c:when test="${h.houseGender == '1'}">
	                        			남성전용
	                        		</c:when>
	                        		<c:when test="${h.houseGender == '2'}">
	                        			여성전용
	                        		</c:when>
	                        		<c:otherwise>
	                        			남여공용
	                        		</c:otherwise>
	                        	</c:choose>
							</td>
							<th>주거형태</th>
							<td>${h.houseForm}</td>
						</tr>
						<tr>
							<th>방 개수</th>
							<td>${h.houseRoom}개</td>
							<th>계약만료일</th>
							<td>${h.houseownerDeadline}</td>
							<th>주소</th>
							<td>${h.addressName} ${h.addressRoad}</td>														
						</tr>
						<tr>
						</tr>
					</table>
				</div>
			</div>
			<!-- 3 -->
			<div class="container_mate_house house_view_section03">
				<h1 class="point_title">방 정보</h1>
       			<h3 class="sub_text">- 투어신청을 하시면 개별로 연락을 드립니다.</h3>
       			<div class="house_view_room_info">
       				<ul>
       					<c:forEach items="${room}" var="r">
       						<li>
       							<span class="house_view_room_title">
       								${r.roomTitle}
       							</span>
       							<div class="house_view_room_text">
       								<span class="house_view_room_text_title">
       									평수
       								</span>
       								<span class="house_view_room_text_code">
       									${r.roomSize}
       								</span>
       								<span class="house_view_room_text_title">
       									보증금
       								</span>
       								<span class="house_view_room_text_code">
       									<fmt:formatNumber value="${h.houseCharge}" pattern="#,###"/>원
       								</span>
       								<span class="house_view_room_text_title">
       									월세
       								</span>
       								<span class="house_view_room_text_code">
       									<fmt:formatNumber value="${r.roomMonth}" pattern="#,###"/>원
       								</span>
       								<span class="house_view_room_text_title">
       									타입
       								</span>
       								<span class="house_view_room_text_code">
       									${r.roomPersonnel}
       								</span>
       								<span class="house_view_room_text_title">
       									입주가능일
       								</span>
       								<span class="house_view_room_text_code">
       									<c:choose>
       										<c:when test="${r.roomStatus == 1}">
       											즉시입주가능
       										</c:when>
       										<c:otherwise>
       											입주 불가능
       										</c:otherwise>
       									</c:choose>       									
       								</span>
       							</div>
       							<div class="house_view_room_btn">
       									<a class="room_move_btn house_move_login" href="/roomTourMoveChk.do?roomNo=${r.roomNo }&houseNo=${h.houseNo}" style="width: 100%;">방 상세 내역확인하기</a>	
       							</div>		
       						</li>
       					</c:forEach>
       				</ul>
       			</div>
			</div>
			<div class="form_popup_modal">		       			
	             <div class="popup_modal">
	                <div class="msg_modal_top">
	                		<span class="msg_modal_text"><em class="logo_point">Oh-Mate</em></span>
	                 </div>
	                 <div class="msg_modal_content">
	                 	<h3 class="modal_msg_timetitle"><em id="title_name" class="title_name"></em> 입력해주세요.</h3>
	                 	<h2 class="modal_msg_timetext">해당 창은 <em id="countdown">3</em>초 후 자동으로 닫힙니다.</h2>
	                 </div>
	         	</div> 
	         </div>
			<!-- 4 -->
			<div class="container_mate_house house_view_section04">
				<h1 class="point_title">제공 옵션</h1>
       			<ul class="option_view" value="${h.houseConvenience}">
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/1.png">
	       				</span>
						<span class="house_option_title">텔레비전</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/2.png">
	       				</span>
						<span class="house_option_title">냉장고</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/3.png">
	       				</span>
						<span class="house_option_title">밥솥</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/4.png">
	       				</span>
						<span class="house_option_title">책상</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/5.png">
	       				</span>
						<span class="house_option_title">토스트기</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/6.png">
	       				</span>
						<span class="house_option_title">쇼파</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/7.png">
	       				</span>
						<span class="house_option_title">가스렌지</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/8.png">
	       				</span>
						<span class="house_option_title">전자렌지</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/9.png">
	       				</span>
						<span class="house_option_title">세탁기</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/10.png">
	       				</span>
						<span class="house_option_title">정수기</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/11.png">
	       				</span>
						<span class="house_option_title">청소기</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/12.png">
	       				</span>
						<span class="house_option_title">커피포트</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/13.png">
	       				</span>
						<span class="house_option_title">에어컨</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/14.png">
	       				</span>
						<span class="house_option_title">건조시설</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/15.png">
	       				</span>
						<span class="house_option_title">침대</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/16.png">
	       				</span>
						<span class="house_option_title">서랍</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/17.png">
	       				</span>
						<span class="house_option_title">옷장</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/18.png">
	       				</span>
						<span class="house_option_title">의자</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/19.png">
	       				</span>
						<span class="house_option_title">WIFI</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/20.png">
	       				</span>
						<span class="house_option_title">엘레베이터</span>
					</li>
	       			<li>
	       				<span class="house_option_img">
							<img src="/resources/img/icon/house/21.png">
	       				</span>
						<span class="house_option_title">보안</span>
					</li>
       			</ul>       			      			
			</div>
			<!-- 6 -->
			<div class="container_mate_house house_view_section06">
				<h1 class="point_title">이용 규칙</h1>
				<div class="house_view_section06_rule">
	       			${h.houseRule}
				</div>
			</div>
			<!-- 6 -->
			<div class="container_mate_house house_view_section06">
				<a href="/houseOwnerList.do?memberNo=${sessionScope.m.memberNo }&reqPage=1" class="btn btn_b_line btn_rx" style="width: 800px; height: 50px; line-height: 40px; margin-left: 200px;">하우스리스트로 돌아가기</a>	
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<Script>
		// login
		$("#house_view_login").click(function(){
			msgpopupopen();
		});
		$(".house_tour_login").click(function(){
			msgpopupopen();
		});
		$(".house_move_login").click(function(){
			msgpopupopen();
		});
       //자동닫기
       function autoClose(){
    	   setTimeout('closed()',3000);
       }
       function closed(){
    	   countmsgclose();
       }
		//편의시설
		$(function(){
			var options = $(".option_view").attr("value");
			for(var i=0;i<options.length;i++){
				//console.log(options.charAt(i));
				if(options.charAt(i) == 0){
					$(".option_view>li").eq(i).hide();
				}
			}
		});		
		var swiper = new Swiper(".mySwiper", {});
	    const slide = new Swiper('#house-slide', {
	        //   한 슬라이드에 보여줄 갯수
	        slidesPerView : 'auto',
	        // 슬라이드 반복여부
	        loop : true,
	        loopAdditionalSlides : 1,
	        slidesPerView : 1,
	        autoplay : {  // 자동 슬라이드 설정 , 비 활성화 시 false
	            delay : 3000,   // 시간 설정
	            disableOnInteraction : false,  // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음
	    },
	    }); 
	</Script>
</body>
</html>