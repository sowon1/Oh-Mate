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
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2fe50c2d1b8d26d2ec5e7053eeb12b16&libraries=services"></script>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<div class="container_mate_filter">
		<div class="container_mate">
			<div class="list_filter">
				<div class="filter_icon">
					<img src="/resources/img/icon/filter.png">
					<span class="filter_name">조건검색</span>					
				</div>
				<div class="search_line">
					<input class="search_input" name="keyword" placeholder="지역, 지하철역, 대학 주변 검색">
					<a href="" class="search_icon">
						<img src="/resources/img/icon/search_on.png">
					</a>
				</div>
			</div>
		<form id="house_filter">
			<div class="h_filter_open">
				<fieldset>
					<div id="select_container">
						<!--보증금조정-->
						<div class="mFeeWrap">
           	              <h2 class="filterTitle"><strong>보증금 범위</strong>&nbsp;&nbsp;<span id="rent-lower">0</span>~<span id="rent-upper">100</span>만원</h2>
       	    		      <input name="roomCharge1" id="house-filter_rent_lower" type="hidden" value="0">
       	    		      <input name="roomCharge2" id="house-filter_rent_upper" type="hidden" value="100">
           	              <div id="rent-slider" class="noUi-target noUi-ltr noUi-horizontal"></div>
           	              <h3 class="leftCaption">0만원</h3><h3 class="rightCaption">100만원</h3>
           	            </div>
						<!--보증금조정 끝-->
						<div class="genderFilter">
							<p class="filterTitle">
								<strong>성별 타입</strong>&nbsp;&nbsp;중복 선택 가능
							</p>
							<div class="filter_cont">
								<div>
									<input type="checkbox" id="house-filter_gender_division_f" name="gender" value="2">
									<label for="house-filter_gender_division_f"><span class="select_icon02"></span>여성전용</label>
								</div>
								<div>
									<input type="checkbox" id="house-filter_gender_division_m" name="gender" value="1">
									<label for="house-filter_gender_division_m"><span class="select_icon04"></span>남성전용</label>
								</div>
								<div>
									<input type="checkbox" id="house-filter_gender_division_mf" name="gender" value="3">
									<label for="house-filter_gender_division_mf"><span class="select_icon03"></span>남녀공용</label>
								</div>
							</div>
						</div>
						<div class="houseTypeWrap">
							<p class="filterTitle">
								<strong>주거 유형</strong>&nbsp;&nbsp;중복 선택 가능
							</p>
							<div class="filter_cont">
								<div>
									<input type="checkbox" id="house-filter_house_type_0" name="housetype" value="아파트">
									<label for="house-filter_house_type_0"><span class="select_icon02"></span>아파트</label>
								</div>
								<div>
									<input type="checkbox" id="house-filter_house_type_1" name="housetype" value="단독주택">
									<label for="house-filter_house_type_1"><span class="select_icon04"></span>단독주택</label>
								</div>
								<div>
									<input type="checkbox" id="house-filter_house_type_2" name="housetype" value="빌라">
									<label for="house-filter_house_type_2"><span class="select_icon03"></span>빌라</label>
								</div>
								<div>
									<input type="checkbox" id="house-filter_house_type_3" name="housetype" value="기타">
									<label for="house-filter_house_type_3"><span class="select_icon03"></span>기타</label>
								</div>
							</div>
						</div>
						<div class="houseTypeWrap">
							<p class="filterTitle">
								<strong>룸 형태</strong>&nbsp;&nbsp;중복 선택 가능
							</p>
							<div class="filter_cont">
								<div>
									<input type="checkbox" id="house-filter_max_resident_1" name="room" value="1인실">
									<label for="house-filter_max_resident_1"><span class="select_icon02"></span>1인실</label>
								</div>
								<div>
									<input type="checkbox" id="house-filter_max_resident_2" name="room" value="2인실">
									<label for="house-filter_max_resident_2"><span class="select_icon04"></span>2인실</label>
								</div>
								<div>
									<input type="checkbox" id="house-filter_max_resident_3" name="room" value="다인실">
									<label for="house-filter_max_resident_3"><span class="select_icon03"></span>다인실</label>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
				<!--적용하기-->
				<div class="applyWrap">
					<span class="btnBorder" id="reset-house">초기화</span>
					<span class="btnBackground" id="filter-apply-btn">적용하기</span>
					<span class="filterHeader">
						<div class="closeBtn" id="filter-close-btn">
							<img src="/resources/img/icon/close_p.png">
						</div>
					</span>
				</div>
			</div>
		</form>
		</div>
		<div class="house_list">
			<div class="house_left">
				list
			</div>
			<div class="house_right">
				<div id="map" style="width:100%;height:100%;"></div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<script>
		//필터 아이콘 누를경우 
		$(".filter_icon").click(function(){
			$(".h_filter_open").slideToggle();
		});
		$(".closeBtn").click(function(){
			$(".h_filter_open").slideToggle();
		});
		//검색바 금액설정
		var connectSlider = document.getElementById('rent-slider');
        var maxAmount = 100
        noUiSlider.create(connectSlider, {
            start: [0,100],
            tooltips: true,
            decimals: 0,
            step: 5,
            connect: true,
            range: {
            'min': 0,
            'max': maxAmount, 
            },
        format: wNumb ({decimals:0})
        });
        var marginMin = document.getElementById('rent-lower'),
        marginMax = document.getElementById('rent-upper');
        connectSlider.noUiSlider.on('update', function (values, handle) {
	        if (handle) {
	            marginMax.innerHTML = values[handle];
	        } else {
	            marginMin.innerHTML = values[handle];
	        }
	    });
        //초기화 버튼 누를 경우
        $(".btnBorder").click(function(){
        	$("input[type='checkbox']").prop('checked', false);
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
		var addr = '남부순환로82길';
		var comname = '네임변수';
		geocoder.addressSearch(addr, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {	
		        var coords = new kakao.maps.LatLng(result[0].y,result[0].x);
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="">'+comname+'</div>'
		        });
		        infowindow.open(map, marker);
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(new kakao.maps.LatLng(result[0].y,result[0].x));
		    } 
		});
	</script>
</body>
</html>