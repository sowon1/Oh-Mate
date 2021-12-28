<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<!-- 지도 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2fe50c2d1b8d26d2ec5e7053eeb12b16&libraries=services,clusterer"></script>
<link rel="stylesheet" href="/resources/css/helper/helper.css">
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<div class="helper_view_back">
		<div class="container_mate" style="overflow: hidden;">
			<div class="helper_view_top">
				<div class="helper_view_top_pro">
					<img src="/resources/upload/helper/${h.helperFilepath}" class="helper_view_top_proimg">
					<div class="helper_pro">					
						<span class="helper_pro_name">
							${h.helperName}						
						</span>
						<span class="helper_pro_agender">
							<c:choose>
			        			<c:when test="${h.age == 1}">			        				
					        		20대 · 
			        			</c:when>
			        			<c:when test="${h.age == 2}">			        				
					        		30대 · 
			        			</c:when>
			        			<c:otherwise>
					        		40대 · 
			        			</c:otherwise>
			        		</c:choose>
			        		<c:choose>
			        			<c:when test="${h.gender == 1}">
					        		남
			        			</c:when>
			        			<c:otherwise>
					        		여
			        			</c:otherwise>
			        		</c:choose>
						</span>
						<span class="like_count">[💜 <em class="point like_count_point">${h.likeCount}명</em>이 관심 중인 헬퍼]</span>
						<div class="helper_pro_cate" value="${h.helperCategory}">
							<span class="heler_pro_cate_title">활동분야</span>
							<div class="clear">							
								<em class="helper_pro_cate_code">배달·장보기</em>
								<em class="helper_pro_cate_code">청소·집안일</em>
								<em class="helper_pro_cate_code">설치·조립·운반</em>
								<em class="helper_pro_cate_code">동행·돌봄</em>
								<em class="helper_pro_cate_code">벌레·쥐</em>
								<em class="helper_pro_cate_code">역할대행</em>
								<em class="helper_pro_cate_code">과외·알바</em>
								<em class="helper_pro_cate_code">기타·원격</em>
							</div>
						</div>
						<div class="helper_pro_timeride clear">
							<span class="heler_pro_title">활동시간</span>
							<span class="heler_pro_code">${h.helperStartTime}</span>
						</div>
						<div class="helper_pro_timeride">
							<span class="heler_pro_title">마감시간</span>
							<span class="heler_pro_code">${h.helperEndTime}</span>
						</div>
						<div class="helper_pro_timeride">
							<span class="heler_pro_title">이동수단</span>
							<span class="heler_pro_code">
								<c:choose>
			        				<c:when test="${h.helperRide == 1}">
			        					자동차
			        				</c:when>
			        				<c:when test="${h.helperRide == 2}">
			        					오토바이
			        				</c:when>
			        				<c:when test="${h.helperRide == 3}">
			        					전동퀵보드
			        				</c:when>
			        				<c:when test="${h.helperRide == 4}">
			        					자전거
			        				</c:when>
			        				<c:otherwise>
			        					걸어서
			        				</c:otherwise>
			        			</c:choose>			
							</span>
						</div>
						<div class="helper_pro_timeride helper_addr_view">
							<span class="heler_pro_title">활동지역</span>
							<c:forTokens items="${h.addressName}" delims="," var="name">
								<span class="heler_pro_code2">
									${name}
								</span>
							</c:forTokens>
						</div>
					</div>
					<div class="helper_pro_btn">
						<div class="like_helper_view">
                        	<c:choose>
                        		<c:when test="${empty sessionScope.m}">
                        			<button onclick="msgpopupopen();" class="heart"><img src="/resources/img/icon/heart_off.png"></button>
                        		</c:when>
                        		<c:when test="${h.likedCheck == '좋아요'}">
			                		<a idx="${h.helperNo}" class="heart">
			                			<img src="/resources/img/icon/heart_on.png">
			                		</a>
			                	</c:when>
			                	<c:otherwise>                							              
									<a idx="${h.helperNo}" class="heart">
										<img src="/resources/img/icon/heart_off.png">
									</a>
			                	</c:otherwise>
                        	</c:choose>
                        </div>
                        <div class="report_helper">
                        	<c:choose>
                        		<c:when test="${empty sessionScope.m}">
                        			<a onclick="msgpopupopen();"><img src="/resources/img/icon/report.png"></a>
                        		</c:when>
                        		<c:otherwise>
                        			<a id="helperReport"><img src="/resources/img/icon/report.png"></a>
                        		</c:otherwise>
                        	</c:choose>
                        </div>           
                        <div class="chat_helper" idx="${h.memberName}">
                        	<c:choose>
                        		<c:when test="${empty sessionScope.m}">
                        			<a onclick="msgpopupopen();"><img src="/resources/img/icon/chat_icon.png"></a>
                        		</c:when>
                        		<c:otherwise>
                        			<a onclick="helperchat();" idx="${h.memberNo}" id="helperChat"><img src="/resources/img/icon/chat_icon.png"></a>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
					</div>
				</div>
				<!-- --------------------------------------신고 팝업------------------------------------------------------ -->
				<div class="report_popup_modal">
                 	<div class="re_pop_modal">
	                 		<div class="re_modal_top">
		                  		<span class="re_modal_text">신고</span>
		                      	<span class="re_modal_close" style="cursor: pointer;"><img src="/resources/img/icon/close_wh.png"></span>
		                   </div>
		                   <div class="re_modal_content">
		                   		<form action="/helperReport.do" method="post" class="reform">
		                   			<table class="help_table">
	                        			<tr class="table-active_mate_help">
	                        				<th>신고 대상</th>
	                        				<td> 
	                        					<input type="text" class="input_03" value="${fn:substring(h.helperName,0,fn:length(h.helperName)-3)}**"readonly="readonly">
	                        					<input type="hidden" class="input_03" value="${h.memberNo}" name="hmemberNo" readonly="readonly">
	                        					<input type="hidden" class="input_03" value="${h.helperNo}" name="helperNo" readonly="readonly">
	                        				</td>
	                        			</tr>
	                        			<tr class="table-active_mate_help">
	                        				<th>신고자</th>
	                        				<td>
	                        					<input type="text" class="input_03" value="${sessionScope.m.memberName}" readonly="readonly">
	                        					<input type="hidden" class="input_03" value="${sessionScope.m.memberNo}" name="memberNo" readonly="readonly">
	                        				</td>
	                        			</tr>
	                        			<tr class="table-active_mate_help">
	                        				<th>신고분류</th>
	                        				<td>
	                        					<input type="text" class="input_03" value="헬퍼" readonly="readonly">
	                        				</td>
	                        			</tr>
	                        			<tr class="table-active_mate_help">
	                        				<th>신고사유</th>
	                        				<td>
	                        					<textarea name="reportContent" class="textarea_pro report_textarea"></textarea>
	                        				</td>
	                        			</tr>
                        			</table>
                        			<div class="form_btn">
	                        			<a class="btn_100" type="submit" onclick="return checkReVal();">신고하기</a>
	                        		</div>
		                   		</form>
		                   </div>
                 	</div>
                 </div>
				<!-- --------------------------------------신고 팝업끝------------------------------------------------------ -->
				<div class="helper_view_top_bottom">				
					<div class="helper_pro_helperInfo">
						<span class="helper_pro_helperInfo_title">${h.helperName} 헬퍼 자기소개</span>
						<span class="helper_pro_helperInfo_text">${h.helperIntro}</span>
					</div>
					<div class="help_btn">
						<c:choose>
							<c:when test="${empty sessionScope.m}">
								<a class="btn btn_100 help_login">도움 요청하기</a>
							</c:when>
							<c:when test="${sessionScope.m.memberLevel eq 1 or sessionScope.m.memberLevel eq 4 or sessionScope.m.memberLevel eq 5}">
								<a class="btn btn_100 help_request" no="${h.helperNo}">도움 요청하기</a>
							</c:when>
							<c:otherwise>							
								<a class="btn btn_100 no_help">도움 요청하기</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="room_popup_modal">		       			
                    <div class="room_tour_popup_modal">
                       <div class="room_modal_top">
                       		<span class="room_modal_text">도움 요청서</span>
                            <span class="room_modal_close" style="cursor: pointer;"><img src="/resources/img/icon/close_wh.png"></span>
                        </div>
                        <div class="room_modal_content">
                        	<div class="help_helper_info">
                        		<img src="/resources/upload/helper/${h.helperFilepath}" class="help_helper_proimg">
                        		<div class="help_helper_info_top">
	                        		<span class="helper_pro_name2">
										${h.helperName}						
									</span>
									<span class="helper_pro_agender2">
										<c:choose>
						        			<c:when test="${h.age == 1}">			        				
								        		20대 · 
						        			</c:when>
						        			<c:when test="${h.age == 2}">			        				
								        		30대 · 
						        			</c:when>
						        			<c:otherwise>
								        		40대 · 
						        			</c:otherwise>
						        		</c:choose>
						        		<c:choose>
						        			<c:when test="${h.gender == 1}">
								        		남
						        			</c:when>
						        			<c:otherwise>
								        		여
						        			</c:otherwise>
						        		</c:choose>
									</span>
									<div class="help_helper_grade">
										<!--  
										<span class="help_helper_star">
											<div class="star-ratings review_star">
												<div class="star-ratings-fill space-x-2 text-lg" style="{ width: ratingToPercent + '%' }">
													<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>													
												</div>
												<div class="star-ratings-base space-x-2 text-lg">
													<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>	
												</div>
											</div>
										</span>
										-->
										<span class="help_helper_like">💜 ${h.likeCount} </span>
									</div>
									<div class="help_helper_pro_cate" value="${h.helperCategory}">					
										<em class="help_helper_pro_cate">배달·장보기</em>
										<em class="help_helper_pro_cate">청소·집안일</em>
										<em class="help_helper_pro_cate">설치·조립·운반</em>
										<em class="help_helper_pro_cate">동행·돌봄</em>
										<em class="help_helper_pro_cate">벌레·쥐</em>
										<em class="help_helper_pro_cate">역할대행</em>
										<em class="help_helper_pro_cate">과외·알바</em>
										<em class="help_helper_pro_cate">기타·원격</em>
									</div>
                        		</div>
                        	</div>
                        	<form action="/helprequest.do" method="post">
                        		<table class="help_table">
                        			<tr class="table-active_mate_help">
                        				<th>도움 유형</th>
                        				<td class="help_cate" value="${h.helperCategory}">
                        					<div>                       					
				                        		<input type="radio" id="help_cate_01" name="helpCategory" value="1">
												<label for="help_cate_01"><span class="select_icon02"></span>배달·장보기</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_02" name="helpCategory" value="2">
												<label for="help_cate_02"><span class="select_icon02"></span>청소·집안일</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_03" name="helpCategory" value="3">
												<label for="help_cate_03"><span class="select_icon02"></span>설치·조립·운반</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_04" name="helpCategory" value="4">
												<label for="help_cate_04"><span class="select_icon02"></span>동행·돌봄</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_05" name="helpCategory" value="5">
												<label for="help_cate_05"><span class="select_icon02"></span>벌레·쥐</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_06" name="helpCategory" value="6">
												<label for="help_cate_06"><span class="select_icon02"></span>역할대행</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_07" name="helpCategory" value="7">
												<label for="help_cate_07"><span class="select_icon02"></span>과외·알바</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_08" name="helpCategory" value="8">
												<label for="help_cate_08"><span class="select_icon02"></span>기타·원격</label>
                        					</div>
                        				</td>
                        			</tr>
                        			<tr class="table-active_mate_help">
                        				<th>장소 선택</th>
                        				<td>
                        					<input type="text" id="postCode" name="addressCode" class="input_help" readonly="readonly" placeholder="우편번호">
                        					<button type="button" onclick="addrSearch();" class="postcodebtn">주소검색</button>
                        					<input type="text" id="addressRoad" class="input_help" placeholder="도로명 주소" name="addressRoad" readonly="readonly">
                        					<input type="text" id="detailAddr" class="input_help" placeholder="상세 주소" name="addressDetail">
											<input type="hidden" id="addressName" name="addressName">
											<input type="hidden" id="addressLegal" name="addressLegal">
                        				</td>
                        			</tr>
                        			<tr class="table-active_mate_help">
                        				<th>시간 선택</th>
                        				<td>
                        					<input type="text" class="helptime input_help" name="helpStartTime">
                        					<input type="text" class="helptime input_help" name="helpEndTime">
                        				</td>
                        			</tr>
                        			<tr class="table-active_mate_help">
                        				<th>도움 제목</th>
                        				<td>
                        					<input type="text" name="helpTitle" class="input_03" placeholder="도움 요청의 제목을 입력해주세요.">
                        				</td>
                        			</tr>
                        			<tr class="table-active_mate_help">
                        				<th>도움 내용</th>
                        				<td>
                        					<textarea name="helpContent" class="textarea_pro"></textarea>
                        				</td>
                        			</tr>
                        			<tr class="table-active_mate_help">
                        				<th>심부름비</th>
                        				<td>
                        					<input type="text" name="helpCharge" class="input_03">
                        					<span class="help_text_notice">*헬퍼에게 지급될 심부름비는 고객님께서 정해주세요.<br>*일정 시간 동안 헬퍼가 요청을 받지 않으면 자동으로 결제가 취소됩니다.</span>
                        				</td>
                        			</tr>
                        			<input type="hidden" name="helperNo">
                        			<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
                        		</table>
                        		<div class="form_btn">
                        			<a class="btn_100" type="submit" onclick="return checkVal();">신청하기</a>
                        		</div>
                        	</form>
                        </div>
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
			<div class="helper_view_bottom">
				<div class="helper_count_left">
					<h1 class="helper_count_title">${h.helperName}님 도와줘요 지원 내역</h1>
					<ul>
						<li>
							<span class="helper_count_box_title">도와줘요 완료</span>
							<span class="helper_count_box_code">${h.helpStatus3}</span>
						</li>
						<li>
							<span class="helper_count_box_title">도와줘요 취소</span>
							<span class="helper_count_box_code">${h.helpStatus4}</span>
						</li>
						<li>
							<h3 class="helper_count_box_total">총 도와줘요 <em class="point">${h.helpStatus3 + helpStatus4}</em> 건</h3>
						</li>
					</ul>
				</div>
				<div class="helper_count_right">
					<h1 class="helper_count_title">${h.helperName}님 도와줘요 만족도</h1>
					<ul>
						<li>
							<span class="helper_count_box_title">만족해요</span>
							<span class="helper_count_box_code">${review[0].star5}</span>
						</li>
						<li>
							<span class="helper_count_box_title">그냥 그래요</span>
							<span class="helper_count_box_code">${review[0].star4}</span>
						</li>
						<li>
							<h3 class="helper_count_box_total">총 만족 고객 <em class="point">${review[0].star5 + review[0].star4}</em> 명</h3>
						</li>
					</ul>
				</div>
			</div>
			<div class="helper_view_review">
				<h3 class="helper_review_title">리뷰 <em class="point">${h.reviewCount}</em>건</h3>
				<div class="helper_review_photo">
					
				</div>
				<div class="helper_review_list">
					<c:if test="${empty review}">
						<div class="none_review">
							<img src="/resources/img/icon/search_img.png">
							<h3>${h.helperName}님에 대한 등록된 리뷰가 없습니다.</h3>
						</div>
					</c:if>
					<ul>
						<c:forEach items="${review}" var="r">			
							<li>
								<div class="review_text">
									<c:choose>
										<c:when test="${r.memfilepath == null}">
											<img src="/resources/img/icon/profile.png" class="review_pro_img">
										</c:when>
										<c:otherwise>
											<img src="/resources/upload/member/${r.memfilepath}" class="review_pro_img">
										</c:otherwise>
									</c:choose>								
									<div class="review_text_box">
										<div class="star-ratings review_star">
											<div class="star-ratings-fill space-x-2 text-lg" style="{ width: ratingToPercent + '%' }">
												<c:choose>
													<c:when test="${r.asterion == 5}">
														<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>													
													</c:when>
													<c:when test="${r.asterion == 4}">
														<span>★</span><span>★</span><span>★</span><span>★</span>												
													</c:when>
													<c:when test="${r.asterion == 3}">
														<span>★</span><span>★</span><span>★</span>											
													</c:when>
													<c:when test="${r.asterion == 2}">
														<span>★</span><span>★</span>							
													</c:when>
													<c:otherwise>
														<span>★</span>																						
													</c:otherwise>
												</c:choose>
											</div>
											<div class="star-ratings-base space-x-2 text-lg">
												<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>	
											</div>
										</div>
										<span class="review_star_text">${r.asterion}</span>
										<div class="review_writer">
											<span class="review_id">
												<c:if test="${r.memberId ne null && r.memberId!=''}">${fn:substring(r.memberId,0,fn:length(r.memberId)-1)}****</c:if>											
											</span>
											<span class="review_date">${r.reviewDate}</span>
										</div>
										<div class="review_title">
											도움 : ${r.reviewTitle}
										</div>
										<div class="review_content">
											${r.reviewContent}
										</div>
									</div>
									<img src="/resources/upload/helpReview/${r.photoPath}" class="review_img">
									<div class="review_like">
										<c:choose>
			                        		<c:when test="${empty sessionScope.m}">
			                        			<button onclick="msgpopupopen();" class="review_likebtn">
			                        				<img src="/resources/img/icon/review_icon_off.png">		                        			
			                        				<span class="review_count">${r.likeCount}</span>
			                        			</button>
			                        		</c:when>
			                        		<c:when test="${r.likedCheck == '좋아요'}">
						                		<a idx2="${r.reviewNo}" class="review_likebtn review_on">
						                			<img src="/resources/img/icon/review_icon_on.png">
						                			<span class="review_count">${r.likeCount}</span>
						                		</a>
						                	</c:when>
						                	<c:otherwise>
												<a idx2="${r.reviewNo}" class="review_likebtn">
													<img src="/resources/img/icon/review_icon_off.png">
													<span class="review_count">${r.likeCount}</span>
												</a>
						                	</c:otherwise>
			                        	</c:choose>
			                        	<div class="review_btn_hover">리뷰가 도움이 되었나요?</div>
									</div>
								</div>
							</li>
						</c:forEach>						
					</ul>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<script>
		function reportopen(){
			$(".report_popup_modal").css("display","flex");
		    $("body").css("overflow", "hidden");
		    $(".tour_back_dark").show();			
		}
		function reportclose(){
			$(".report_popup_modal").css("display","none");
		    $("body").css("overflow", "auto");
		    $(".tour_back_dark").hide();			
		}
		//채팅
		function helperchat(){
			var helpNo = $("#helperChat").attr('idx');
			var name = $(".chat_helper").attr('idx');
			no = $("#helperChat").attr('idx');
			$(".mate_talk_messageArea").empty();
			$(".mate_talk_view_top").empty();
			var chatNo;
			if(helpNo == receiver){
				$(".modal_msg_timetitle").empty();
				$(".modal_msg_timetitle").html("<em id='title_name' class='title_name'>자신에게 대화를 신청할 수 없습니다.</em>");
				countmsgopen(autoClose());
			}else{				
				//채팅 목록 있는지 부터 조회
				$.ajax({
					url : "/chatSelect.do",
					data : {helpNo:helpNo, receiver : receiver},
					type : "POST",
					success : function(data){
						var list = data.list;
						chatNo = data.chatNo;
						var html = "";
						var top = "";
						helptalk();
						top += '<a onclick="chatBack();">';
						top += '<img src="/resources/img/icon/back.png"></a>';							
						top += '<span class="mate_talk_name">'+name+'</span>';				
						top += '<a id="chatReport" value="'+chatNo+'" class="report_icon" onclick="chatreportfrm(name);">';
						top += '<img src="/resources/img/icon/report.png">';
						top += '</a>';
						$(".mate_talk_view_top").append(top);
						if(list == null || list == "undefined" || list == ""){
							
						}else{
							for(var i = 0; i < list.length; i++){
								if(list[i].sender != receiver){
									html += '<div class="mate_talk_left">';
									html += '<img src="/resources/upload/member/'+list[i].filepath+'">';
									html += '<div class="mate_talk_left_line">';
									html += '<span class="mate_talk_msg_name">'+list[i].senderName+'</span>';
									html += '<div class="mate_talk_view_left_one">';
									html += '<span class="mate_talk_left_msg">'+list[i].messageContent+'</span>';
									html += '<div class="mate_talk_msg_side">';
									html += '<span class="mate_talk_left_date">'						
									html += moment(list[i].messageDate).format('LT')+'</span></div></div></div></div>';
								}else{
									if(list[i].sender == receiver){							
										html += '<div class="mate_talk_right">';
										html += '<span class="mate_talk_right_date">';
										if(list[i].messageStatus == "n"){
											html += '<span>안읽음</span><br>';
										}
										html += moment(list[i].messageDate).format('LT');
										html += '</span>';
										html += '<span class="mate_talk_right_msg">'+list[i].messageContent+'</span>';
										html += '</div></div>';
									}else{
										
									}
								}
							} //for문 종료
						}	//else종료
						$(".mate_talk_messageArea").append(html);
						initChat(receiver, no, chatNo);
					} //success종료
				})//ajax 종료	
			}
		}
		//login
		$(".help_login").click(function(){
			msgpopupopen();
		})
		//헬프 요청 권한
		$(".no_help").click(function(){
			 $(".title_name").text("도움요청은 헬퍼, 메이트만 가능합니다.");
			countmsgopen(autoClose());
		})
		//우편번호
		function addrSearch(){
	    	var width = 500; 
	    	var height = 600; 
			 new daum.Postcode({
				width: width, 
				height: height,
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
		            $("#postCode").val(data.zonecode); //우편
		            $("#roadAddr").val(data.roadAddress); //도로
		            $("#addressName").val(data.sigungu); //도로
		            $("#addressRoad").val(data.roadname); //도로
		            $("#addressLegal").val(data.bname2); //도로2
		            $("#detailAddr").focus(); // 선택후 상세주소 포커스
		        },
			 theme:{
		  			searchBgColor: "#956bfc", //검색창 배경색,
		  			queryTextColor: "#FFFFFF" //검색창 글자색
		  			}
			 }).open({ //팝업 위치 가운데로
				 popupTitle: 'Oh-Mate 우편번호 검색',
				 popupKey: 'popup1',
				 left: (window.screen.width / 2) - (width / 2),
				 top: (window.screen.height / 2) - (height / 2)
			 });
			};
		//도움요청
		function helpopen(){
			$(".room_popup_modal").css("display","flex");
		    $("body").css("overflow", "hidden");
		    $(".tour_back_dark").show();
		}
		function helpclose(){
			$(".room_popup_modal").css("display","none");
			$("body").css("overflow", "auto");
			$(".tour_back_dark").hide();
		}
		$(".help_request").click(function(){
			var helperNo = $(this).attr("no");
		    $("input[name='helperNo']").val(helperNo);
		    helpopen();
		});
		$(".room_modal_close").click(function(){
			helpclose();
		});
		//활동분야
		$(function(){
			var options = $(".helper_pro_cate").attr("value");
			for(var i=0;i<options.length;i++){
				if(options.charAt(i) == 0){
					$(".helper_pro_cate>div>em").eq(i).hide();
				}
			}
		});
		//도움 요청 - 상단 프로필
		$(function(){
			var options = $(".help_helper_pro_cate").attr("value");
			for(var i=0;i<options.length;i++){
				if(options.charAt(i) == 0){
					$(".help_helper_pro_cate>em").eq(i).hide();
				}
			}
		});
		//도움 요청 - 도움 유형
		$(function(){
			var options = $(".help_cate").attr("value");
			for(var i=0;i<options.length;i++){
				if(options.charAt(i) == 0){
					$(".help_cate>div").eq(i).hide();
				}
			}
		});
		//좋아용
		$(document).on("click",".heart",function(){
			var memberNo = "${sessionScope.m.memberNo}";
			var helperNo = $(this).attr('idx');		
			var heart = $(this);
			$.ajax({
				url : "/HelperListLike.do",
				data : {memberNo:memberNo, helperNo:helperNo},
				type: "POST",
				success : function(data){
					if(data.likeCheck == 0){
						heart.children().attr("src","/resources/img/icon/heart_off.png");
						$(".like_count_point").html(data.likeCnt+"명");
					}else{
						heart.children().attr("src","/resources/img/icon/heart_on.png");
						$(".like_count_point").html(data.likeCnt+"명");
					}
				}
			});
		});
		//리뷰 좋아유
		$(document).on("click",".review_likebtn",function(){
			var memberNo = "${sessionScope.m.memberNo}";
			var reviewNo = $(this).attr('idx2');
			var like = $(this);
			$.ajax({
				url : "/ReviewListLike.do",
				data : {memberNo:memberNo, reviewNo:reviewNo},
				type : "POST",
				success : function(data){
					if(data.likeCheck == 0){
						like.children("img").attr("src","/resources/img/icon/review_icon_off.png");
						like.toggleClass("review_on");
						like.children("span").html(data.likeCnt);
					}else{
						like.children("img").attr("src","/resources/img/icon/review_icon_on.png");
						like.toggleClass("review_on");
						like.children("span").html(data.likeCnt);
					}
				}
			})
		});
		$(function() {
			// 시간
			$(".helptime").daterangepicker({
				timePicker : true,
				singleDatePicker : true,
				timePicker24Hour : true,
				timePickerIncrement : 15,
				minDate : new Date(),
				locale : {
					"format" : 'HH:mm',
					"applyLabel" : "확인",
					"cancelLabel" : "취소"
				}
			}).on('show.daterangepicker', function(ev, picker) {
				picker.container.find(".calendar-table").hide();
			});
			$("input[name='helpStartTime']").on('apply.daterangepicker', function(ev, picker) {
				$("input[name='helpStartTime']").css("color","#956bfc");       
		   });
			$("input[name='helpEndTime']").on('apply.daterangepicker', function(ev, picker) {
				$("input[name='helpEndTime']").css("color","#956bfc");	       
		   });
		});
		//유효성검사
		var resultArr = [false,false,false,false];
       $(function(){
    	   $("input[name='addressDetail']").change(function(){
				var addr = $(this).val();
               if(!addr){
                   resultArr[0] = false;
               }else{
                   resultArr[0] = true;
               } 
           });
    	   $("input[name='helpTitle']").change(function(){
               var titleValue = $(this).val();
               if(!titleValue){
                    resultArr[1] = false;
               }else{
                   resultArr[1] = true;
               } 
           });
    	   $("textarea[name='helpContent']").change(function(){
               var contentValue = $(this).val();
               if(!contentValue){
                    resultArr[2] = false;
               }else{
                   resultArr[2] = true;
               } 
           });
    	   $("input[name='helpCharge']").change(function(){
    		   var chargeReg = /^[0-9]*$/;
               var chargeValue = $(this).val();
               if(!(chargeReg.test(chargeValue))){
            	   $(this).focus();
                   $(".title_name").text("숫자만 입력해주세요.");
                   countmsgopen(autoClose());
                    resultArr[3] = false;
               }else{
                   resultArr[3] = true;
               } 
           });
       });
		//유효성
		function checkVal(){
			if(!(resultArr[0] && resultArr[1] && resultArr[2] && resultArr[3])){
				if($("input[name='addressCode']").val() == ""){					
					 $(".title_name").text("주소를 입력해주세요.");
					 $("input[name='addressDetail']").focus();
					countmsgopen(autoClose());
				}else if($("input[name='helpTitle']").val() == ""){
					 $(".title_name").text("제목을 입력해주세요.");					
					 $("input[name='helpTitle']").focus();
					countmsgopen(autoClose());
				}else if($("textarea[name='helpContent']").val() == ""){
					 $(".title_name").text("도움내용을 입력해주세요.");					
					 $("textarea[name='helpContent']").focus();
					countmsgopen(autoClose());				
				}else if($("input[name='helpCharge']").val() == ""){
					 $(".title_name").text("심부름비를 입력해주세요.");					
					 $("input[name='helpCharge']").focus();
					countmsgopen(autoClose());									
				}
			}else{
				if($("input[name='helpStartTime']").val() == ""){
					 $(".title_name").text("도움받을 시간을 입력해주세요.");
					countmsgopen(autoClose());					
				}else if($("input:radio[name='helpCategory']:checked").val() == null){
					 $(".title_name").text("도움 유형을 입력해주세요.");
						countmsgopen(autoClose());
						
				}else{
					var helpCategory = $("input:radio[name='helpCategory']:checked").val();
					var price = 100;
					var totalprice = $("input[name='helpCharge']").val();
					var memberName = '${sessionScope.m.memberName}';
					var email = '${sessionScope.m.email}';
					var phone = '${sessionScope.m.phone}';
					var memberNo = '${sessionScope.m.memberNo}';
					var payId = '${sessionScope.m.memberId}';
					var helpNo = 9999;
								
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
								url : "/helpPayment.do",
								method : "POST",
								data : {
									memberNo : memberNo,
									helpNo : helpNo,
									payId : payId,
									payName : memberName,
									payNum : rsp.merchant_uid,
									payPrice : totalprice,
									payWay : rsp.pay_method
								},
								success : function(data){
		
					    		   $("form").submit();
								}
							});
							
						}else{
							$(".title_name").text("결제가 ");
							$(".title_and_text").text("취소되었습니다.");
							countmsgopen(autoClose());
						}
					});

				}
			}
       }
		
		//신고 팝업
		$("#helperReport").click(function(){
			reportopen();
		});
		$(".re_modal_close").click(function(){
			reportclose();
		});
		
		//신고 유효성 
		function checkReVal(){
			if($(".report_textarea").val() == ""){					
				 $(".title_name").text("사유를 입력해주세요.");
				 $("textarea[name='reportContent']").focus();
				countmsgopen(autoClose());
			}else{
				 $(".reform").submit();
			}
		}
		
	</script>
</body>
</html>