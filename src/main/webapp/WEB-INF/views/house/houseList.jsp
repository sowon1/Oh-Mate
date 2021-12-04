<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/house/house.css">
<!-- 지도 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2fe50c2d1b8d26d2ec5e7053eeb12b16&libraries=services"></script>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<div class="container_mate_filter">
		<div class="list_filter">
			<div class="filter_icon">
				<img src="/resources/img/icon/filter.png">
				<span class="filter_name">조건검색</span>
			</div>
			<div class="search_line">
				<input class="search_input" placeholder="지역, 지하철역, 대학 주변 검색">
				<a href="" class="search_icon">
					<img src="/resources/img/icon/search_on.png">
				</a>
			</div>
		</div>
	</div>
	<div class="house_list">
	
	</div>
	<div class="house_right">
		<div id="map" style="width:100%;height:400px;"></div>
	</div>
	<script>
		//login 함수
		function login(){
			if(confirm("로그인이 필요 합니다 로그인 하시겠습니까?")){
				location.href="/login"
			}
		}
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
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>