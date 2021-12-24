<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/house/house.css">
<!-- 아임포트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<!-- 달력 -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
	
	<div class="container_mate">
		<h1 class="point_title">계약 및 결제정보</h1>
		<div class="room_move_left">
			<div class="room_move_left_top">
				<div class="room_move_left_top_left">
					<img src="/resources/upload/house/${photo[0].photoPath}">
				</div>
				<div class="room_move_left_top_right">
					<ul>
						<li>
							<span class="room_move_top_title">
								${house[0].houseTitle}
							</span>
						</li>
						<li>
							<span class="room_move_top_text">
								<img src="/resources/img/icon/maps.png">
                        		${house[0].addressName} ${house[0].addressRoad}
							</span>
						</li>
						<li>
							<span class="room_move_top_text">
							<img src="/resources/img/icon/check_bk.png">
								<c:choose>
                        		<c:when test="${house[0].houseGender == '1'}">
                        			#남성전용
                        		</c:when>
                        		<c:when test="${house[0].houseGender == '2'}">
                        			#여성전용
                        		</c:when>
                        		<c:otherwise>
                        			#남여공용
                        		</c:otherwise>
                        	</c:choose>
                        	#${house[0].houseForm} #보유중인방${house[0].houseRoom}개
							</span>
						</li>
						<li>
							<span class="room_move_top_text">
								<img src="/resources/img/icon/calendar.png">
								<span class="move_date_text">
									계약 시작일 ~ 계약 종료일
								</span>
								<input type="hidden" name="moveStart">
								<input type="hidden" name="moveEnd">
								<a class="move_date_btn">변경</a>
							</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="room_move_left_bottom">
				<div class="container_mate_house house_view_section04">
					<h1 class="point_title">제공 옵션</h1>
	       			<ul class="room_move_option_view" value="${house[0].houseConvenience}">
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/1.png">
		       				</span>
							<span class="room_move_option_title">텔레비전</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/2.png">
		       				</span>
							<span class="room_move_option_title">냉장고</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/3.png">
		       				</span>
							<span class="room_move_option_title">밥솥</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/4.png">
		       				</span>
							<span class="room_move_option_title">책상</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/5.png">
		       				</span>
							<span class="room_move_option_title">토스트기</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/6.png">
		       				</span>
							<span class="room_move_option_title">쇼파</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/7.png">
		       				</span>
							<span class="room_move_option_title">가스렌지</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/8.png">
		       				</span>
							<span class="room_move_option_title">전자렌지</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/9.png">
		       				</span>
							<span class="room_move_option_title">세탁기</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/10.png">
		       				</span>
							<span class="room_move_option_title">정수기</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/11.png">
		       				</span>
							<span class="room_move_option_title">청소기</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/12.png">
		       				</span>
							<span class="room_move_option_title">커피포트</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/13.png">
		       				</span>
							<span class="room_move_option_title">에어컨</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/14.png">
		       				</span>
							<span class="room_move_option_title">건조시설</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/15.png">
		       				</span>
							<span class="room_move_option_title">침대</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/16.png">
		       				</span>
							<span class="room_move_option_title">서랍</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/17.png">
		       				</span>
							<span class="room_move_option_title">옷장</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/18.png">
		       				</span>
							<span class="room_move_option_title">의자</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/19.png">
		       				</span>
							<span class="room_move_option_title">WIFI</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/20.png">
		       				</span>
							<span class="room_move_option_title">엘레베이터</span>
						</li>
		       			<li>
		       				<span class="room_move_option_img">
								<img src="/resources/img/icon/house/21.png">
		       				</span>
							<span class="room_move_option_title">보안</span>
						</li>
	       			</ul>       			      			
				</div>
				<!-- 6 -->
				<div class="container_mate_house house_view_section06">
					<h1 class="point_title">이용 규칙</h1>
					<div class="house_view_section06_rule">
		       			${house[0].houseRule}
					</div>
				</div>
			</div>
		</div>
		<div class="room_move_right">
			<h1>결제정보</h1>
			<ul>
				<li>
					<span class="room_move_pay_title">
						방 이름
					</span>
					<span class="room_move_pay_code">
						${r.roomTitle}
					</span>
				</li>
				<li>
					<span class="room_move_pay_title">
						평수
					</span>
					<span class="room_move_pay_code">
						${r.roomSize}
					</span>
				</li>
				<li>
					<span class="room_move_pay_title">
						구분
					</span>
					<span class="room_move_pay_code">
						${r.roomPersonnel}
					</span>
				</li>
				<li>
					<span class="room_move_pay_title">
						보증금
					</span>
					<span class="room_move_pay_code">
						<fmt:formatNumber value="${house[0].houseCharge}" pattern="#,###"/>원
					</span>
				</li>
				<li>
					<span class="room_move_pay_title">
						첫 달 월세
					</span>
					<span class="room_move_pay_code">
						<fmt:formatNumber value="${r.roomMonth}" pattern="#,###"/>원
					</span>
				</li>
			</ul>
			<div class="room_move_pay_total">
				<span class="room_move_pay_total_title">
					총 결제금액
				</span>
				<span class="room_move_pay_total_code">
					<fmt:formatNumber value="${house[0].houseCharge + r.roomMonth}" pattern="#,###"/>원
				</span>
			</div>
			<div class="room_move_pay_btn">
				<a class="btn btn_100 btn_rx" id="payment">결제하기</a>
			</div>
		</div>
		<div class="form_popup_modal">		       			
            <div class="popup_modal">
               <div class="msg_modal_top">
               		<span class="msg_modal_text"><em class="logo_point">Oh-Mate</em></span>
                </div>
                <div class="msg_modal_content">
                	<h3 class="modal_msg_timetitle"><em id="title_name" class="title_name"></em><em class="title_and_text"></em></h3>
                	<h2 class="modal_msg_timetext">해당 창은 <em id="countdown">3</em>초 후 자동으로 닫힙니다.</h2>                
                </div>
        	</div> 
        </div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<script>
		// 결제하기
		$("#payment").click(function(){
			var price = 100;
			var totalprice = '${house[0].houseCharge + r.roomMonth}';
			var memberName = '${sessionScope.m.memberName}';
			var email = '${sessionScope.m.email}';
			var phone = '${sessionScope.m.phone}';
			var roomNo = '${r.roomNo}';
			var memberNo = '${sessionScope.m.memberNo}';
			var moveStart = $("input[name='moveStart']").val();
			var moveEnd = $("input[name='moveEnd']").val();
			var payId = '${sessionScope.m.memberId}';
			var houseNo = '${house[0].houseNo}';
			if(moveStart == ""){
				$(".title_name").text("계약일을");
				$(".title_and_text").text("입력해주세요.");
				countmsgopen(autoClose());	
			}else{								
				var d = new Date();
				//고유식별번호 문자열로 쓰려고 +""+ 붙여줌 - 월은 0~11이라 +1해줌
				var date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
				//결제 API 사용을 위해 아임포트 가맹점 식별코드 입력
				IMP.init("imp41554995");
				IMP.request_pay({ //결제할때 필요한 정보(가격 등)를 객체형태로 넣어줌
					pay_method: 'card',
					merchant_uid : date, //거래 아이디
					name : "㈜오늘부터메이트",		// 결제 이름 설정
					amount : price,				// 결제 금액
					buyer_email : email, 		//구매자 이메일
					buyer_name : memberName,	//구매자 이름
					buyer_phone : phone			//구매자 전하번호		
				},function(rsp){ //결제를 하고나면 결제 이후의 작업을 처리할 함수
					if(rsp.success){
						$.ajax({
							url : "/movePayment.do",
							method : "POST",
							data : {
								roomNo : roomNo,
								memberNo : memberNo,
								houseNo : houseNo,
								moveStart : moveStart,
								moveEnd : moveEnd,
								movePhone : phone,
								payId : payId,
								payName : memberName,
								payNum : rsp.merchant_uid,
								payPrice : totalprice,
								payWay : rsp.pay_method
							},
							success : function(data){
	
							}
						});
						$(".title_name").text("계약이 ");
						$(".title_and_text").text("성사되었습니다.");
						$(".modal_msg_timetext").html("<em id='countdown'>3</em>초 후 자동으로 마이페이지로 이동됩니다.");
						countmsgopen(autoClose());
						location.href="/moveInList.do?reqPage=1";
					}else{
						$(".title_name").text("결제가 ");
						$(".title_and_text").text("취소되었습니다.");
						countmsgopen(autoClose());
					}
				});
			}
		});	
		// msg
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
		//자동닫기
       function autoClose(){
    	   setTimeout('closed()',3000);
       }
       function closed(){
    	   countmsgclose();
       }    
		//편의시설
		$(function(){
			var options = $(".room_move_option_view").attr("value");
			for(var i=0;i<options.length;i++){
				if(options.charAt(i) == 0){
					$(".room_move_option_view>li").eq(i).hide();
				}
			}
		});		
		//달력부분
		var nowDate = new Date();
		var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate()+1);
		// 달력 한글화 
	    $(".move_date_btn").daterangepicker({
	    	minDate : today,
	    	endDate: moment().startOf('hour').add(32, 'hour'),
	       autoUpdateInput: false,
	       locale: {
	           cancelLabel: 'Clear',
	           "format": "YYYY-MM-DD", 
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
	       }
	   });
	   $(".move_date_btn").on('apply.daterangepicker', function(ev, picker) {
		   $(".move_date_text").text(picker.startDate.format('YYYY-MM-DD') + ' ~ ' + picker.endDate.format('YYYY-MM-DD'));
		   $("input[name='moveStart']").val(picker.startDate.format('YYYY-MM-DD'));
		   $("input[name='moveEnd']").val(picker.endDate.format('YYYY-MM-DD'));
	   });
	   $(".move_date_btn").on('cancel.daterangepicker', function(ev, picker) {
	       $(".move_date_text").text('계약 시작일 ~ 계약 종료일');
		   $("input[name='moveStart']").val('');
		   $("input[name='moveEnd']").val('');
	   });
	</script>
</body>
</html>