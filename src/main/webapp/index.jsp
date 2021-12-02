<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/main/main.css">
<head>
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
                            <span class="custom-option" data-value="f">여성전용</span>
                            <span class="custom-option" data-value="m">남성전용</span>
                            <span class="custom-option" data-value="mf">남녀공용</span>
                        </div>
                    </div>
                </div>
                <div class="custom-select-wrapper">
                    <div class="custom-select">
                        <div class="custom-select__trigger"><span>룸 형태</span>
                            <div class="arrow"></div>
                        </div>
                        <div class="custom-options" data-type="max_resident" data-name="룸 형태">
                            <span class="custom-option selected" data-value="">선택안함</span>
                            <span class="custom-option" data-value="1">1인실</span>
                            <span class="custom-option" data-value="2">2인실</span>
                            <span class="custom-option" data-value="3">3인실</span>
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
                <a href="/" class="search_main_btn">적용하기 <img src="/resources/img/icon/search_wh.png"></a>
            </div>
        </div>
    </div>
    <div class="container_mate main_section02">
        <h1 class="point_title">Oh-My, HOUSE!</h1>
        <h3 class="sub_text">혼자 시작하는 첫 걸음, 나를 위한 집!</h3>
        <ul class="main_house_list">
            <li>
                <a href="/">
                    <div class="house_list_photo">
                        <div class="like_house">
                            <img src="/img/icon/heart_off.png">
                        </div>
                        <img src="/img/main_list01.jpg">
                    </div>
                    <div class="house_list_text">
                        <div class="list_line_01">
                            <span class="list_tag">여성전용</span>
                            <span class="list_title">사랑이 넘치는 여기는 모두가 좋은 해피하우스</span>
                        </div>
                        <div class="list_line_02">
                            <span class="house_tag">#신축아파트 #여성혼자살고있음 #청결주의</span>
                        </div>
                        <div class="list_line_03">
                            <span class="house_form">아파트</span>
                            <span class="house_sum">월 30만원 ~</span>
                        </div>
                    </div>
                    <a href="/" class="house_more_btn">5명 입주가능</a>
                </a>
            </li>
            <li>
                <a href="/">
                    <div class="house_list_photo">
                        <div class="like_house">
                            <img src="/resources/img/icon/heart_off.png">
                        </div>
                        <img src="/resources/img/main_list01.jpg">
                    </div>
                    <div class="house_list_text">
                        <div class="list_line_01">
                            <span class="list_tag">여성전용</span>
                            <span class="list_title">사랑이 넘치는 여기는 모두가 좋은 해피하우스</span>
                        </div>
                        <div class="list_line_02">
                            <span class="house_tag">#신축아파트 #여성혼자살고있음 #청결주의</span>
                        </div>
                        <div class="list_line_03">
                            <span class="house_form">아파트</span>
                            <span class="house_sum">월 30만원 ~</span>
                        </div>
                    </div>
                    <a href="/" class="house_more_btn">5명 입주가능</a>
                </a>
            </li>
            <li>
                <a href="/">
                    <div class="house_list_photo">
                        <div class="like_house">
                            <img src="/resources/img/icon/heart_off.png">
                        </div>
                        <img src="/img/main_list01.jpg">
                    </div>
                    <div class="house_list_text">
                        <div class="list_line_01">
                            <span class="list_tag">여성전용</span>
                            <span class="list_title">사랑이 넘치는 여기는 모두가 좋은 해피하우스</span>
                        </div>
                        <div class="list_line_02">
                            <span class="house_tag">#신축아파트 #여성혼자살고있음 #청결주의</span>
                        </div>
                        <div class="list_line_03">
                            <span class="house_form">아파트</span>
                            <span class="house_sum">월 30만원 ~</span>
                        </div>
                    </div>
                    <a href="/" class="house_more_btn">5명 입주가능</a>
                </a>
            </li>
        </ul>
    </div>
    <div class="main_section03">
        <div class="container_mate">
            <div class="sect03_left">
                <h3>오늘부터 우리 1일, Oh-Mate!</h3>
                <h2><em class="section03_point">오늘부터 메이트</em>에서는 <em class="section03_point" id="allmembercount"></em>명이 살고 있습니다.</h2>
            </div>
            <div class="sect03_right">
                <a href="/" class="search_main_btn2">내 메이트 찾기 <img src="/resources/img/icon/search_wh.png"></a>
            </div>
        </div>
    </div>
    <div class="container_mate main_section04">
        <h1 class="point_title">Oh, Help me!</h1>
        <h3 class="sub_text">살다가 혼자서 처리하지 못하는 일이 생긴다면!? 오메, 도와줘요!</h3>
        <ul class="main_house_list">
            <li>
                <a href="/">
                    <div class="house_list_photo">
                        <div class="like_house">
                            <img src="/resources/img/icon/heart_off.png">
                        </div>
                        <img src="/resources/img/main_list01.jpg">
                    </div>
                    <div class="house_list_text">
                        <div class="list_line_01">
                            <span class="list_tag">여성전용</span>
                            <span class="list_title">사랑이 넘치는 여기는 모두가 좋은 해피하우스</span>
                        </div>
                        <div class="list_line_02">
                            <span class="house_tag">#신축아파트 #여성혼자살고있음 #청결주의</span>
                        </div>
                        <div class="list_line_03">
                            <span class="house_form">아파트</span>
                            <span class="house_sum">월 30만원 ~</span>
                        </div>
                    </div>
                    <a href="/" class="house_more_btn">5명 입주가능</a>
                </a>
            </li>
        </ul>
    </div>
    <div class="main_section05">
        <h3>당신의 집 가치는 얼마입니까?</h3>
        <h1>내 집도 오늘부터 메이트!</h1>
        <a href="/" class="">하우스 등록하기</a>
    </div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<script>
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
	        var memberCountConTxt= 333;
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