<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!-- 지도 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2fe50c2d1b8d26d2ec5e7053eeb12b16&libraries=services,clusterer"></script>
<link rel="stylesheet" href="/resources/css/helper/helper.css">
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
	<div class="helper_view_back">
		<div class="container_mate">
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
						<div class="like_helper">
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
                        	<img src="/resources/img/icon/report.png">
                        </div>
                        <div class="chat_helper">
                        	<img src="/resources/img/icon/chat_icon.png">
                        </div>
					</div>
				</div>
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
							<c:otherwise>							
								<a class="btn btn_100 help_request" no="${h.helperNo}">도움 요청하기</a>
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
										<span class="help_helper_star">☆☆☆☆☆</span>
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
				                        		<input type="radio" id="help_cate_01" name="helpCategory" value="0">
												<label for="help_cate_01"><span class="select_icon02"></span>배달·장보기</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_02" name="helpCategory" value="0">
												<label for="help_cate_02"><span class="select_icon02"></span>청소·집안일</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_03" name="helpCategory" value="0">
												<label for="help_cate_03"><span class="select_icon02"></span>설치·조립·운반</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_04" name="helpCategory" value="0">
												<label for="help_cate_04"><span class="select_icon02"></span>동행·돌봄</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_05" name="helpCategory" value="0">
												<label for="help_cate_05"><span class="select_icon02"></span>벌레·쥐</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_06" name="helpCategory" value="0">
												<label for="help_cate_06"><span class="select_icon02"></span>역할대행</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_07" name="helpCategory" value="0">
												<label for="help_cate_07"><span class="select_icon02"></span>과외·알바</label>
                        					</div>
                        					<div>                       					
				                        		<input type="radio" id="help_cate_08" name="helpCategory" value="0">
												<label for="help_cate_08"><span class="select_icon02"></span>기타·원격</label>
                        					</div>
                        				</td>
                        			</tr>
                        			<tr class="table-active_mate_help">
                        				<th>장소 선택</th>
                        				<td>
                        					<input type="text" id="postCode" name="addressCode" class="input_help" readonly="readonly" placeholder="우편번호">
                        					<button type="button" onclick="" class="btn btn_sm">주소검색</button>
                        					<input type="text" id="roadAddr" class="input_03" placeholder="도로명 주소" name="companyAddr" readonly="readonly">
											<input type="hidden" id="addressName" name="addressName">
											<input type="hidden" id="addressRoad" name="addressRoad">
											<input type="hidden" id="addressLegal" name="addressLegal">
                        				</td>
                        			</tr>
                        			<tr class="table-active_mate_help">
                        				<th>시간 선택</th>
                        				<td>
                        					<input type="text" name="helpStartTime" class="input_help">
                        					<input type="text" name="helpEndTime" class="input_help">
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
                        					<textarea name="helpContent"></textarea>
                        				</td>
                        			</tr>
                        			<tr class="table-active_mate_help">
                        				<th>심부름비</th>
                        				<td>
                        					<input type="text" name="helpCharge" class="input_03">
                        					<span class="">*헬퍼에게 지급될 심부름비는 고객님께서 정해주세요.</span>
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
			<div class="helper_view_bottom">
			
				헬프 신청 완료 카운트 ${h.helpStatus3}
				헬프 신청 취소 카운트 ${h.helpStatus4}
			</div>
			<div class="helper_view_review">
				리뷰란~~
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<script>
		//카카오 주소
		function addrSearch() {
			new daum.Postcode({
				oncomplete : function(data) {
					document.querySelector("#postCode").value = data.zonecode;
					document.querySelector("#roadAddr").value = data.address;
					document.querySelector("#addressName").value = data.sigungu;
					document.querySelector("#addressRoad").value = data.roadname;
					document.querySelector("#addressLegal").value = data.bname2;
				}
			}).open();
		}
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
	</script>
</body>
</html>