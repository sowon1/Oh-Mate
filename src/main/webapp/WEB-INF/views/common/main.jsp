<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/main/main.css">
<meta charset="UTF-8">
<title>Oh-Mate!</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<div class="main_section01">
        <div class="container_mate">
            <h1 class="main_section01_h1">
            	<c:choose>
            		<c:when test="${not empty sessionScope.m}">
            			<em class="point" style="font-family: 'ns_700'">${sessionScope.m.memberName}</em>님 <br>
            		</c:when>
            		<c:otherwise>
            			지금,<br>
            		</c:otherwise>
            	</c:choose>
          		  어느 지역에<br>살고싶으신가요?
            </h1>
            <div class="main_selectbox">
                <input type="text" name="keyword" placeholder="지역, 지하철역, 대학 주변 검색">
                <div class="custom-select-wrapper">
                    <div class="custom-select">
                        <div class="custom-select__trigger"><span>성별타입</span>
                            <div class="arrow"></div>
                        </div>
                        <div class="custom-options" data-type="gender" data-name="성별타입">
                            <span class="custom-option selected" data-value="">선택안함</span>
                            <span class="custom-option" data-value="1">여성전용</span>
                            <span class="custom-option" data-value="2">남성전용</span>
                            <span class="custom-option" data-value="3">남녀공용</span>
                        </div>
                    </div>
                </div>
                <div class="custom-select-wrapper">
                    <div class="custom-select">
                        <div class="custom-select__trigger"><span>룸 형태</span>
                            <div class="arrow"></div>
                        </div>
                        <div class="custom-options" data-type="room" data-name="룸 형태">
                            <span class="custom-option selected" data-value="">선택안함</span>
                            <span class="custom-option" data-value="1">1인실</span>
                            <span class="custom-option" data-value="2">2인실</span>
                            <span class="custom-option" data-value="3">다인실</span>
                        </div>
                    </div>
                </div>
                <div class="custom-select-wrapper">
                    <div class="custom-select">
                        <div class="custom-select__trigger"><span>주거유형</span>
                            <div class="arrow"></div>
                        </div>
                        <div class="custom-options" data-type="house_type" data-name="주거유형">
                            <span class="custom-option selected" data-value="">선택안함</span>
                            <span class="custom-option" data-value="0">아파트</span>
                            <span class="custom-option" data-value="1">단독주택</span>
                            <span class="custom-option" data-value="2">빌라</span>
                            <span class="custom-option" data-value="3">기타</span>
                        </div>
                    </div>
                </div>             
                <a id="search_data" class="search_main_btn">적용하기 <img src="/resources/img/icon/search_wh.png"></a>
            </div>
        </div>
    </div>
    <div class="container_mate main_section02">
        <h1 class="point_title">Oh-My, HOUSE!</h1>
        <h3 class="sub_text">혼자 시작하는 첫 걸음, 나를 위한 집!</h3>
        <ul class="main_house_list">
	        <c:forEach items="${hlist}" var="h">
		            <li>
	                    <div class="house_list_photo">
	                        <div class="like_house">
	                        	<c:choose>
	                        		<c:when test="${empty sessionScope.m}">
	                        			<button onclick="msgpopupopen();" class="heart"><img src="/resources/img/icon/heart_off.png"></button>
	                        		</c:when>
	                        		<c:when test="${h.likedCheck == '좋아요'}">
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
	                        <img src="/resources/upload/house/${h.photoList[0].photoPath}">
	                    </div>
	        	<a href="<c:url value='houseView.do?houseNo=${h.houseNo}'/>">
	                    <div class="house_list_text">
	                        <div class="list_line_01">
	                            <span class="list_house_title">${h.houseTitle}</span>
	                        </div>
	                        <div class="list_line_02">
	                            <span class="house_content">${h.houseContent}</span>
	                        </div>
	                        <div class="list_line_03">
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
	                            <span class="house_form">${h.houseForm}</span>
	                            <span class="house_sum">보증금 <fmt:formatNumber value="${h.houseCharge}" pattern="#,###"/>원 ~</span>   
	                        </div>
	                    </div>
	                    <a href="<c:url value='houseView.do?houseNo=${h.houseNo}'/>" class="house_more_btn">입주 가능한 방 ${h.roomCount}개</a>
		            </li>           
	        	</a>
	        </c:forEach>            
        </ul>
    </div>
    <div class="main_section03">
        <div class="container_mate">
            <div class="sect03_left">
                <h3>오늘부터 우리 1일, Oh-Mate&#128150;</h3>
                <h2><em class="section03_point">오늘부터 메이트</em>에서는 <em class="section03_point" id="allmembercount"></em>명이 살고 있습니다.</h2>
            </div>
            <div class="sect03_right">
                <a href="/communityFrm.do" class="search_main_btn2">내 메이트 찾기 <img src="/resources/img/icon/search_wh.png"></a>
            </div>
        </div>
    </div>
    <div class="container_mate main_section04">
        <h1 class="point_title">Oh, Help me!</h1>
        <h3 class="sub_text">살다가 혼자서 처리하지 못하는 일이 생긴다면!? 오메, 도와줘요!</h3>
        <ul class="main_helper_list">
           <c:forEach items="${hplist}" var="hp">
		            <li>
	                    <div class="helper_list_photo">
	                        <div class="like_helper">
	                        	<c:choose>
	                        		<c:when test="${empty sessionScope.m}">
	                        			<button onclick="msgpopupopen();" class="heart2"><img src="/resources/img/icon/heart_off.png"></button>
	                        		</c:when>
	                        		<c:when test="${hp.likedCheck == '좋아요'}">
				                		<a idx2="${hp.helperNo}" class="heart2">
				                			<img src="/resources/img/icon/heart_on.png">
				                		</a>
				                	</c:when>
				                	<c:otherwise>                							              
										<a idx2="${hp.helperNo}" class="heart2">
											<img src="/resources/img/icon/heart_off.png">
										</a>
				                	</c:otherwise>
	                        	</c:choose>                         
	                        </div>
							<div class="helper_list_profile">
			                    <img src="/resources/upload/helper/${hp.helperFilepath}" class="profile_view">
			        		</div>
	                    </div>
		        	<a href="<c:url value='/helperView.do?helperNo=${hp.helperNo}'/>">
	                    <div class="helper_list_text_name">
			        		<span class="helper_list_nickname">${hp.helperName}</span>
			        		<c:choose>
			        			<c:when test="${hp.age == 1}">			        				
					        		<span class="helper_list_age">20대 · </span>
			        			</c:when>
			        			<c:when test="${hp.age == 2}">			        				
					        		<span class="helper_list_age">30대 · </span>
			        			</c:when>
			        			<c:otherwise>
					        		<span class="helper_list_age">40대 · </span>			        			
			        			</c:otherwise>
			        		</c:choose>
			        		<c:choose>
			        			<c:when test="${hp.gender == 1}">
					        		<span class="helper_list_gender">남</span>
			        			</c:when>
			        			<c:otherwise>
					        		<span class="helper_list_gender">여</span>			        			
			        			</c:otherwise>
			        		</c:choose>
			        	</div>
			        	<div class="helper_list_text_info">
			        		<span class="helper_list_text_code">활동시간 ${hp.helperStartTime}</span>
			        		<span class="helper_list_text_code">
			        			<c:choose>
			        				<c:when test="${hp.helperRide == 1}">
			        					자동차
			        				</c:when>
			        				<c:when test="${hp.helperRide == 2}">
			        					오토바이
			        				</c:when>
			        				<c:when test="${hp.helperRide == 3}">
			        					전동퀵보드
			        				</c:when>
			        				<c:when test="${hp.helperRide == 4}">
			        					자전거
			        				</c:when>
			        				<c:otherwise>
			        					걸어서
			        				</c:otherwise>
			        			</c:choose>			        		
			        		</span>
			        	</div>
			        	<div class="helper_list_intro">
			        		${hp.helperIntro}
			        	</div>
			        	<div class="helper_Category" value="${hp.helperCategory}">
			        		<span class="helper_Category_title">#배달·장보기</span>
			        		<span class="helper_Category_title">#청소·집안일</span>
			        		<span class="helper_Category_title">#설치·조립·운반</span>
			        		<span class="helper_Category_title">#동행·돌봄</span>
			        		<span class="helper_Category_title">#벌레·쥐</span>
			        		<span class="helper_Category_title">#역할대행</span>
			        		<span class="helper_Category_title">#과외·알바</span>
			        		<span class="helper_Category_title">#기타·원격</span>
			        	</div>
		        	</a>
		         </li>           
	        </c:forEach>	        
        </ul>
    </div>
    <div class="main_section05">
        <h3>당신의 집 가치는 얼마입니까?</h3>
        <h1>내 집도 이제 오늘부터 메이트!</h1>
        <c:choose>
       		<c:when test="${not empty sessionScope.m}">
       			<c:choose>
       				<c:when test="${sessionScope.m.memberLevel eq 2}">
		       			<a href="/houseWriteFrm.do" class="sect05_btn">하우스 등록하기</a>      				
       				</c:when>
       				<c:otherwise>
		       			<a id="house_modal" class="sect05_btn">하우스 등록하기</a>
		       			<div class="msg_popup_modal">		       			
		                    <div class="popup_modal">
		                       <div class="msg_modal_top">
		                       		<span class="msg_modal_text"><em class="logo_point">Oh-Mate</em></span>
		                            <span class="main_btn_close" style="cursor: pointer;"><img src="/resources/img/icon/close_wh.png"></span>
		                        </div>
		                        <div class="msg_modal_content">
		                        	<h1>하우스 등록은 하우스 오너만 등록할 수 있습니다.</h1>
		                        <!-- 	<div class="main_modal_btn">
			                        	<a href="/" class="main_btn btn_out">오너 전환</a>
			                        	<a id="main_close" class="main_btn btn_out">닫기</a>
		                        	</div> -->
		                        </div>
		                	</div> 
		                </div>
       				</c:otherwise>
       			</c:choose>
       		</c:when>      	
       		<c:otherwise>
       			<a id="main_house_login" class="sect05_btn">하우스 등록하기</a>
       			<div class="msg_popup_modal">		       			
		                    <div class="popup_modal">
		                       <div class="msg_modal_top">
		                       		<span class="msg_modal_text"><em class="logo_point">Oh-Mate</em></span>
		                            <span class="main_btn_close" style="cursor: pointer;"><img src="/resources/img/icon/close_wh.png"></span>
		                        </div>
		                        <div class="msg_modal_content">
		                        	<h1>로그인이 필요한 기능입니다.</h1>
		                        	<div class="main_modal_btn">
			                        	<a data-toggle="modal" href="#modal1" class="main_btn btn_out main_modal_login">로그인</a>
			                        	<a class="main_btn btn_out main_btn_close">닫기</a>
		                        	</div>
		                        </div>
		                	</div> 
		                </div>
       		</c:otherwise>
       	</c:choose>
    </div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<script>
		//닫기 버튼 
		$(".main_btn_close").click(function(){
			msgpopupclose();
		});
		//로그인 누를경우 닫기버튼
		$(".main_modal_login").click(function(){
	    	msgpopupclose();
	    });
		//House - 좋아요
		$(document).on("click",".heart",function(){
			var memberNo = "${sessionScope.m.memberNo}";
			var houseNo = $(this).attr('idx');		
			var heart = $(this);
			$.ajax({
				url : "/houseLike.do",
				data : {memberNo:memberNo, houseNo:houseNo},
				type: "POST",
				success : function(data){
					if(data.likeCheck == 0){
						heart.children().attr("src","/resources/img/icon/heart_off.png");
					}else{
						heart.children().attr("src","/resources/img/icon/heart_on.png");
					}
				}
			});
		});
		
		//Helper - 좋아요
		$(document).on("click",".heart2",function(){
			var memberNo = "${sessionScope.m.memberNo}";
			var helperNo = $(this).attr('idx2');		
			var heart2 = $(this);
			console.log(this);
			$.ajax({
				url : "/HelperMainLike.do",
				data : {memberNo:memberNo, helperNo:helperNo},
				type: "POST",
				success : function(data){
					console.log(data);
					console.log(data.likeCheck);
					if(data.likeCheck == 0){
						heart2.children().attr("src","/resources/img/icon/heart_off.png");
					}else{
						heart2.children().attr("src","/resources/img/icon/heart_on.png");
					}
				}
			});
		});
		//검색 
		$("#search_data").click(function(){
			var keyword = $("input[name='keyword']").val();
			var genderValue = $("div[data-type='gender']").prev().children("span").text();
			var roomValue = $("div[data-type='room']").prev().children("span").text();
			var housetypeValue = $("div[data-type='house_type']").prev().children("span").text();
			var roomCharge1 = "0";
			var roomCharge2 = "100";
			var gender;
			if(genderValue == "남성전용"){
				houseGender="1";
			}else if(genderValue == "여성전용"){
				houseGender="2";
			}else if(genderValue == "남녀공용"){
				houseGender="3";
			}else{
				houseGender="0";
			}
			if(roomValue == "1인실"){
				roomPersonnel = "1인실";
			}else if(roomValue == "2인실"){
				roomPersonnel = "2인실";
			}else if(roomValue == "다인실"){
				roomPersonnel = "다인실";
			}else{
				roomPersonnel = "";
			}
			if(housetypeValue == "아파트"){
				houseForm="아파트";
			}else if(housetypeValue == "단독주택"){
				houseForm="단독주택";
			}else if(housetypeValue == "빌라"){
				houseForm = "빌라";
			}else{
				houseForm="";
			}
			location.href="/houseList.do?keyword="+keyword+"&houseGender="+houseGender+"&houseForm="+houseForm+"&roomPersonnel="+roomPersonnel+"&roomCharge1="+roomCharge1+"&roomCharge2="+roomCharge2;		
		});		
		//모달
	    $("#house_modal").click(function(){
	    	msgpopupopen();
	    });
	    $("#main_house_login").click(function(){
	    	msgpopupopen();
	    });
		//검색 쪽 셀렉트박스
		$(document).ready(function(){
	        var selected = $(".custom-options>span");
	        $(".custom-select").click(function(){
	            $(this).toggleClass("open");
	            $(selected).click(function(){
	                $(selected).removeClass("selected");
	                $(this).addClass("selected");
	                $(this).parents().prev().children("span").html($(this).html());
	            });
	        });
	        //카운트
	        var memberCountConTxt= "${memcount}";
	        //시작 숫자 0 끝나는 숫자 변수에 담아놓은것
	        $({ val : 0 }).animate({ val : memberCountConTxt }, {
	        duration: 5000,
	        step: function() {
	            var num = numberWithCommas(Math.floor(this.val));
	            $("#allmembercount").text(num);
	        },
	        complete: function() {
	            var num = numberWithCommas(Math.floor(this.val));
	            $("#allmembercount").text(num);
	        }
	        });
	        //3자리마다 , 찍어주는 함수
	        function numberWithCommas(x) {
	            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        }
	    });
		
		//helper 카테고리
		$(function(){
			var options = $(".helper_Category");
			for(var i=0;i<options.length;i++){
				var optionValue = options.eq(i).attr("value");
				//console.log(optionValue);
				for(var j=0;j<optionValue.length;j++){					
					if(optionValue.charAt(j) == 0){
						$(".helper_Category").eq(i).children("span").eq(j).hide();
					}
				}
			}
		});		
	</script>
</body>
</html>