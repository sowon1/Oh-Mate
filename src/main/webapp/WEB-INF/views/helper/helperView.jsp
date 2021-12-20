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
					</div>
				</div>

				선호 시작 시간 ${h.helperStartTime}
				선호 마감 시간 ${h.helperEndTime}
				이동수단 ${h.helperRide}
				프로필 사진 ${h.helperFilepath}
				자기소개 ${h.helperIntro}
				헬퍼 자격증 사진 ${h.helperCredit}
				연령대 ${h.age}
				성별 ${h.gender}
				헬프 신청 완료 카운트 ${h.helpStatus3}
				헬프 신청 취소 카운트 ${h.helpStatus4}
			</div>
			<div class="helper_view_bottom">
			
			</div>
			<div class="helper_view_review">
				리뷰란~~
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<script>
		//활동분야
		$(function(){
			var options = $(".helper_pro_cate").attr("value");
			for(var i=0;i<options.length;i++){
				if(options.charAt(i) == 0){
					$(".helper_pro_cate>div>em").eq(i).hide();
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