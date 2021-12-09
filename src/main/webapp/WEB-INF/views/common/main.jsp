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
            <h1 class="main_section01_h1">어느 지역에<br>살고싶으신가요?</h1>
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
                <a id="search_date" class="search_main_btn">적용하기 <img src="/resources/img/icon/search_wh.png"></a>
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
	                        			<button onclick="msgpopupopen();" class="heart">	                        			
				                         
	                        			</button>
	                        		</c:when>
	                        		<c:when test="${h.likedCheck == '좋아요'}">
				                		<button onclick="likehouse(this,${h.houseNo});" class="heart _click">
				                		
				                		</button>
				                	</c:when>
				                	<c:otherwise>                							              
										<button onclick="likehouse(this,${h.houseNo});" class="heart">
											
										</button>
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
	                    <a href="<c:url value='houseView.do?houseNo=${h.houseNo}'/>" class="house_more_btn">입주 가능 방 ${h.houseRoom}개</a>
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
        <ul class="main_house_list">
           <c:forEach items="${hplist}" var="hp">
	        	<a href="<c:url value='/helper/helperView?helperNo=${hp.helperNo}'/>">
		            <li>
	                    <div class="helper_list_photo">
	                        <div class="like_house">
	                            <img src="/resources/img/icon/heart_off.png">
	                        </div>
	                        <img src="/upload/helper/${hp.helperFilepath}">
	                    </div>
		            </li>           
	        	</a>
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
		                            <span id="btnclose" style="cursor: pointer;"><img src="/resources/img/icon/close_wh.png"></span>
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
		                            <span id="btnclose" style="cursor: pointer;"><img src="/resources/img/icon/close_wh.png"></span>
		                        </div>
		                        <div class="msg_modal_content">
		                        	<h1>로그인이 필요한 기능입니다.</h1>
		                        	<div class="main_modal_btn">
			                        	<a data-toggle="modal" href="#modal1" class="main_btn btn_out main_modal_login">로그인</a>
			                        	<a id="main_close" class="main_btn btn_out">닫기</a>
		                        	</div>
		                        </div>
		                	</div> 
		                </div>
       		</c:otherwise>
       	</c:choose>
    </div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<script>
		//좋아요
		function likehouse(c,obj){
			var memberNo = "${sessionScope.m.memberNo}";
			var houseNo = obj;
			$.ajax({
				url : "/houseLike.do",
				data : {memberNo:memberNo, houseNo:houseNo},
				type: "POST",
				success : function(data){					
					if(data.likeCheck == 0){						
						 $(c).attr("class","heart is_animating");						
					}else{
						$(c).attr("class","heart is_animating _click");					
					}
				}
			})
		}
		//검색 
		$("#search_date").click(function(){
			var keyword = $("input[name='keyword']").val();
			var genderValue = $("div[data-type='gender']").prev().children("span").text();
			var room = $("div[data-type='room']").prev().children("span").text();
			var housetype = $("div[data-type='house_type']").prev().children("span").text();
			var gender;
			if(genderValue == "남성전용"){
				gender="1";
			}else if(genderValue == "어성전용"){
				gender="2";
			}else if(genderValue == "남녀공용"){
				gender="3";
			}else{
				gender="";
			}
			console.log(gender);
			console.log(room);
			console.log(housetype);
			console.log(keyword);
			location.href="/houseList.do?gender="+gender+"&room="+room+"&housetype="+housetype+"&keyword="+keyword;
		});
		//모달
	    $("#house_modal").click(function(){
	    	msgpopupopen();
	    });
	    $("#btnclose").click(function(){
	    	msgpopupclose();
	    });
	    $("#main_close").click(function(){
	    	msgpopupclose();
	    });
	    $("#main_house_login").click(function(){
	    	msgpopupopen();
	    });
	    $(".main_modal_login").click(function(){
	    	msgpopupclose();
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
	</script>
</body>
</html>