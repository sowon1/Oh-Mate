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
       								<c:choose>
       									<c:when test="${r.roomStatus == 1}">      									
		       								<c:choose>
					                     		<c:when test="${empty sessionScope.m}">
					                     			<a class="room_tour_btn house_tour_login">투어 신청</a>
					                     			<a class="room_move_btn house_move_login">입주 신청</a>			                     			
					                     		</c:when>
							                	<c:otherwise>                							              
													<a class="room_tour_btn tour_request" no="${r.roomNo }" title="${r.roomTitle }">투어 신청</a>
				       								<a href="/roomMoveFrm.do?roomNo=${r.roomNo}&houseNo=${h.houseNo}" class="room_move_btn">입주 신청</a>
							                	</c:otherwise>
					                     	</c:choose>	        
       									</c:when>
       									<c:otherwise>
       										<a class="house_move_btn2">입주 불가능</a>
       									</c:otherwise>
       								</c:choose>
       							</div>		
       						</li>
       					</c:forEach>
			       			<div class="room_popup_modal">		       			
			                    <div class="room_tour_popup_modal">
			                       <div class="room_modal_top">
			                       		<span class="room_modal_text">투어신청</span>
			                            <span class="room_modal_close" style="cursor: pointer;"><img src="/resources/img/icon/close_wh.png"></span>
			                        </div>
			                        <div class="room_modal_content">
			                        	<form action="/tourrequest.do" method="post">
			                        		<table class="tour_table">
			                        			<tr class="table-active_mate">
			                        				<th>이름</th>
			                        				<td>
						                        		<input type="text" class="input_03" value="${sessionScope.m.memberName}" readonly="readonly">
			                        				</td>
			                        			</tr>
			                        			<tr class="table-active_mate">
			                        				<th>연락처 <em class="point">*</em></th>
			                        				<td>
						                        		<input type="text" name="tourPhone" class="input_03" placeholder="하이픈(-)을 포함하여 입력해주세요.">
			                        				</td>
			                        			</tr>
			                        			<tr class="table-active_mate">
			                        				<th>이메일 <em class="point">*</em></th>
			                        				<td>
						                        		<input type="text" name="tourEmail" class="input_03" placeholder="이메일">
			                        				</td>
			                        			</tr>
			                        			<tr class="table-active_mate">
			                        				<th>하우스 구분</th>
			                        				<td>
						                        		<input type="text" name="houseName" class="input_tour" value="${h.houseTitle}" readonly="readonly">
						                        		<input type="text" class="input_tour" name="roomTitle" readonly="readonly">
			                        				</td>
			                        			</tr>
			                        			<tr class="table-active_mate">
			                        				<th>투어 희망일 <em class="point">*</em></th>
			                        				<td>
						                        		<input type="text" name="tourVisit" class="input_date input_03" readonly="readonly">
			                        				</td>
			                        			</tr>
			                        			<tr class="table-active_mate">
			                        				<th>문의사항</th>
			                        				<td>
						                        		<textarea name="tourQna" class="textarea_pro" placeholder="문의사항"></textarea>
			                        				</td>
			                        			</tr>
			                        			<input type="hidden" name="roomNo">
			                        			<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
			                        		</table>
			                        		<div class="form_btn">
			                        			<a class="btn_100" type="submit" onclick="return checkVal();">신청하기</a>
			                        		</div>
			                        	</form>
			                        </div>
			                	</div> 
			                </div>
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
		//투어 신청
		function touropen(){
   			$(".room_popup_modal").css("display","flex");
   		    $("body").css("overflow", "hidden");
   		    $(".tour_back_dark").show();
   		}
		function tourclose(){
			$(".room_popup_modal").css("display","none");
			$("body").css("overflow", "auto");
			$(".tour_back_dark").hide();
		}
		$(".tour_request").click(function(){
			var roomNo = $(this).attr("no");
		    var roomTitle = $(this).attr("title");
		    $("input[name='roomNo']").val(roomNo);
		    $("input[name='roomTitle']").val(roomTitle);
			touropen();
		});
		$(".room_modal_close").click(function(){
			tourclose();
		});
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
		//달력부분
		var today = new Date();
		var now = today.getFullYear()+""+(today.getMonth()+1)+""+(today.getDate()+1)+" 09:00";
		// 달력 한글화 
        $("input[name='tourVisit']").daterangepicker({
        	minDate : now,
        	timePicker: true,
        	timePicker24Hour: true,
        	singleDatePicker: true,
           autoUpdateInput: false,
           locale: {
               cancelLabel: 'Clear',
               "format": "YYYY-MM-DD HH:mm", 
               "separator": " ~ ", 
               "applyLabel": "확인", 
               "cancelLabel": "취소", 
               "fromLabel": "From", 
               "toLabel": "To", 
               "customRangeLabel": "Custom", 
               "weekLabel": "W", 
               "daysOfWeek": [ "일", "월", "화", "수", "목", "금", "토" ],
               "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
               "firstDay": 0
           },
           startDate : now,
       });
       $("input[name='tourVisit']").on('apply.daterangepicker', function(ev, picker) {
           //클릭 시 인풋에 날짜표시 바꾸려면 해당부분 변경하면됨!
           $(this).val(picker.endDate.format('YYYY-MM-DD HH:mm'));
       });
       $("input[name='tourVisit']").on('cancel.daterangepicker', function(ev, picker) {
           $(this).val('');
       });
       //자동닫기
       function autoClose(){
    	   setTimeout('closed()',3000);
       }
       function closed(){
    	   countmsgclose();
       }
       //form 입력값 검사
       var resultArr = [false,false];
       $(function(){
    	   $("input[name='tourPhone']").change(function(){
               var phoneReg = /^\d{2,3}-\d{3,4}-\d{4}$/;
               var phoneValue = $(this).val();
               if(!(phoneReg.test(phoneValue))){
                  $(this).focus();
                  $(".title_name").text("000-0000-0000 형식으로");
                  countmsgopen(autoClose());
                   resultArr[0] = false;
               }else{
                   resultArr[0] = true;
               } 
           });
    	   $("input[name='tourEmail']").change(function(){
               var emailReg =  /^[a-z][a-z0-9_-]{3,11}@[a-z\d\.-]+\.[a-z]{2,6}$/;
               var emailValue = $(this).val();
               if(!(emailReg.test(emailValue))){
            	   $(this).focus();
                   $(".title_name").text("email 형식에 맞춰");
                   countmsgopen(autoClose());
                    resultArr[1] = false;
               }else{
                   resultArr[1] = true;
               } 
           });
       });
       function checkVal(){
			if(!(resultArr[0] && resultArr[1])){
				if($("input[name='tourPhone']").val() == ""){					
					 $(".title_name").text("연락처를");
					 $("input[name='tourPhone']").focus();
					countmsgopen(autoClose());
				}else if($("input[name='tourEmail']").val() == ""){
					 $(".title_name").text("이메일을");					
					 $("input[name='tourEmail']").focus();
					countmsgopen(autoClose());
				}
			}else{
				if($("input[name='tourVisit']").val() == ""){
					 $(".title_name").text("방문 희망일을");
					countmsgopen(autoClose());					
				}else{					
	    		   $("form").submit();
				}
			}
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