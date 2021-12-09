<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<span class="like_tag">
			                	Like ${h.likeCount}
			                </span>
	                     	<c:choose>
	                     		<c:when test="${empty sessionScope.m}">
	                     			<button onclick="msgpopupopen();" class="heart">	                        			
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
                        <span class="house_addr">${h.addressName} ${h.addressRoad}</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<Script>
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