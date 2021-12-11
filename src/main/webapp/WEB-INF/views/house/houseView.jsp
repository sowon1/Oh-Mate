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
	                     	<c:choose>
	                     		<c:when test="${empty sessionScope.m}">
	                     			<button type="button" id="house_view_login" class="heart">	                        			
	                            <img src="/resources/img/icon/heart_off.png">
	                     			</button>
	                     		</c:when>
	                     		<c:when test="${h.likedCheck == '1'}">
			                		<a idx="${h.houseNo}" class="heart">
			                			<img src="/resources/img/icon/heart_on.png">
			                		</a>
			                	</c:when>
			                	<c:otherwise>                							              
									<a idx="${h.houseNo}" class="heart">
										<img src="/resources/img/icon/heart_off.png">
									</a>
			                	</c:otherwise>
	                     	</c:choose>	                     	
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
	                        	보유 중인 방 개수
	                        </span>
	                        <span class="box_text_house_title_code">
	                        	${h.houseRoom}개
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
       									<fmt:formatNumber value="${r.roomCharge}" pattern="#,###"/>원
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
       								<a href="" class="room_tour_btn">투어 신청</a>
       								<a href="" class="room_move_btn">입주 신청</a>
       							</div>
       						</li>
       					</c:forEach>
       				</ul>
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
			<!-- 5 -->
			<div class="container_mate_house house_view_section05">
				<h1 class="point_title">위치정보</h1>
				<div class="house_view_section05_map">
					<div id="map" style="width:100%;height:100%;"></div>				
				</div>
				<div class="house_view_section05_map_text">
				
				</div>
			</div>
			<!-- 6 -->
			<div class="container_mate_house house_view_section06">
				<h1 class="point_title">이용 규칙</h1>
				<div class="house_view_section06_rule">
	       			${h.houseRule}
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<Script>
		$("#house_view_login").click(function(){
			$(".msg_popup_modal").css("display","flex");
		    $('body').css("overflow", "hidden"); //모달시 스크롤 방지
		    $(".back_dark").show();
		});
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
		//좋아요 부분 
		$(document).on("click",".heart",function(){
			var memberNo = "${sessionScope.m.memberNo}";
			var houseNo = $(this).attr('idx');		
			var heart = $(this);
			$.ajax({
				url : "/houseListLike.do",
				data : {memberNo:memberNo, houseNo:houseNo},
				type: "POST",
				success : function(data){
					if(data.likeCheck == 0){
						heart.children().attr("src","/resources/img/icon/heart_off.png");
						$("#house_view_count").html(data.likeCnt);
						console.log(data.likeCnt);
					}else{
						console.log(data.likeCnt);
						heart.children().attr("src","/resources/img/icon/heart_on.png");
						$("#house_view_count").html(data.likeCnt);
					}
				}
			});
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
	  	//map
		 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
			 	center: new kakao.maps.LatLng(38.00994423, 126.9531742), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		// 버튼 클릭에 따라 지도 이동 기능을 막거나 풀고 싶은 경우에는 map.setDraggable 함수를 사용합니다
		var mapTypeControl = new daum.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();	
		// 주소로 좌표를 검색합니다 
		var addr = '${h.addressRoad}';
		var comname = '${h.houseTitle}';
		geocoder.addressSearch(addr, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {	
		        var coords = new kakao.maps.LatLng(result[0].y,result[0].x);
		        var imageSrc = '/resources/img/icon/marker.png',//마커 이미지 경로
		        imageSize = new kakao.maps.Size(62, 69),
		        imgOptions = {
		        		spriteSize : new kakao.maps.Size(62, 69),
		        		offset : new kakao.maps.Point(25, 50)
		        		//마커 좌표에 일치시킬 이미지 내에서의 좌표 ??
		        }, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		        // 결과값으로 받은 위치를 마커로 표시합니다
		       		marker = new kakao.maps.Marker({
		            map: map,
		            position: coords,
		            image : markerImage
		        });
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div class="map_title">'+comname+'</div>'
		        });
		        infowindow.open(map, marker);
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(new kakao.maps.LatLng(result[0].y,result[0].x));
		    }
		    
		});
	</Script>
</body>
</html>