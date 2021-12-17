<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/helper/helper.css">
<!-- 지도 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2fe50c2d1b8d26d2ec5e7053eeb12b16&libraries=services"></script>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<div class="container_mate_filter">
		<div class="house_list">
			<div class="house_left">
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
			<form id="house_filter">
				<div class="h_filter_open">
					<fieldset>
						<div id="select_container">
							<div class="genderFilter">
								<p class="filterTitle">
									<strong>성별 타입</strong>
								</p>
								<div class="filter_cont">
									<div>
										<input type="radio" id="house-filter_gender_division_f" name="gender" value="2">
										<label for="house-filter_gender_division_f"><span class="select_icon02"></span>여성전용</label>
									</div>
									<div>
										<input type="radio" id="house-filter_gender_division_m" name="gender" value="1">
										<label for="house-filter_gender_division_m"><span class="select_icon04"></span>남성전용</label>
									</div>
									<div>
										<input type="radio" id="house-filter_gender_division_mf" name="gender" value="3">
										<label for="house-filter_gender_division_mf"><span class="select_icon03"></span>남녀모두</label>
									</div>
								</div>
							</div>
							<div class="houseTypeWrap">
								<p class="filterTitle">
									<strong>도움 유형</strong>
								</p>
								<div class="filter_cont help_cont">
									<div>
										<input type="checkbox" id="help_type_0" name="houseForm" value="0">
										<label for="help_type_0"><span class="select_icon02"></span>배달·장보기</label>
									</div>
									<div>
										<input type="checkbox" id="help_type_1" name="houseForm" value="0">
										<label for="help_type_1"><span class="select_icon04"></span>청소·집안일</label>
									</div>
									<div>
										<input type="checkbox" id="help_type_2" name="houseForm" value="0">
										<label for="help_type_2"><span class="select_icon03"></span>설치·조립·운반</label>
									</div>
									<div>
										<input type="checkbox" id="help_type_3" name="houseForm" value="0">
										<label for="help_type_3"><span class="select_icon03"></span>동행·돌봄</label>
									</div>
									<div class="clear">
										<input type="checkbox" id="help_type_4" name="houseForm" value="0">
										<label for="help_type_4"><span class="select_icon03"></span>벌레·쥐</label>
									</div>
									<div>
										<input type="checkbox" id="help_type_5" name="houseForm" value="0">
										<label for="help_type_5"><span class="select_icon03"></span>역할대행</label>
									</div>
									<div>
										<input type="checkbox" id="help_type_6" name="houseForm" value="0">
										<label for="help_type_6"><span class="select_icon03"></span>과외·알바</label>
									</div>
									<div>
										<input type="checkbox" id="help_type_7" name="houseForm" value="0">
										<label for="help_type_7"><span class="select_icon03"></span>기타·원격</label>
									</div>
								</div>
							</div>
							<div class="houseTypeWrap">
								<p class="filterTitle">
									<strong>선호 시간</strong>
								</p>
								<div class="filter_cont">
									<div>
										<input type="radio" id="house-filter_max_resident_1" name="roomPersonnel" value="1인실">
										<label for="house-filter_max_resident_1"><span class="select_icon02"></span>1인실</label>
									</div>
									<div>
										<input type="radio" id="house-filter_max_resident_2" name="roomPersonnel" value="2인실">
										<label for="house-filter_max_resident_2"><span class="select_icon04"></span>2인실</label>
									</div>
									<div>
										<input type="radio" id="house-filter_max_resident_3" name="roomPersonnel" value="다인실">
										<label for="house-filter_max_resident_3"><span class="select_icon03"></span>다인실</label>
									</div>
								</div>
							</div>
						</div>
					</fieldset>
					<!--적용하기-->
					<div class="applyWrap">
						<span class="btnBorder" id="resethouse">초기화</span>
						<span class="btnBackground" id="filter_apply_btn">적용하기</span>
						<span class="filterHeader">
							<div class="closeBtn" id="filter-close-btn">
								<img src="/resources/img/icon/close_p.png">
							</div>
						</span>
					</div>
				</div>
			</form>
			<ul class="list_container">
				
			</ul>
			<div class="loading">
				Loading...
			</div>
			</div>
			<div class="house_right">
				<div id="map" style="width:100%;height:100%;"></div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<script>
		//----------------------------------------스크롤 페이징---------------------------------//
		var currentPage = 1;
		var isLoading=false;
		var login = '${sessionScope.m}';
		var totalCount = '${totalCount}';
		var keyword = '${keyword}';
		var houseGender = '${houseGender}';
		var houseForm = '${houseForm}';
		var roomPersonnel = '${roomPersonnel}';
		var roomCharge1 = '${roomCharge1}';
		var roomCharge2 = '${roomCharge2}';
	
		//var start = '${startPageNum}';
		//웹 브라우저의 창을 스크롤 할 때 마다 호출되는 함수 등록
		$(window).on("scroll",function(){
			//위로 스크롤된 길이
			var scrollTop = $(window).scrollTop();
			//웹 브라우저의 창의 높이
			var windowHeight = $(window).height();
			//문서 전체의 높이
			var documentHeight = $(document).height();
			//바닥까지 스크롤 되었는지 여부 확인
			var isBottom = scrollTop + windowHeight + 10 >= documentHeight;
			if(isBottom){
				//만일 현재 마지막 페이지라면
				if(currentPage == totalCount || isLoading){
					return; //함수끝
				}
				//로딩 표시
				isLoading=true;
				$(".loading").show();
				//요청페이지 1증가
				currentPage++;
				GetList(currentPage);
			}
		})
		function GetList(currentPage){
			console.log("1 : "+keyword);
			console.log("2 : "+houseGender);
			if(houseGender == ""){
				houseGender = 0;
			}
			$.ajax({
				type : "GET",
				data : {
					"pageNum" : currentPage,
					keyword : keyword,
					houseGender : houseGender,
					houseForm : houseForm,
					roomPersonnel : roomPersonnel,
					roomCharge1 : roomCharge1,
					roomCharge2 : roomCharge2
				},
				url : "/ajax_page.do",
				success : function(data){
					var html = "";
					var list = data.list;
					totalCount = data.totalPageCount;
					//console.log(data);
					//console.log(list);
					//console.log(totalCount);
					if(list == 0){
						html += '<div class="search_none"><img src="/resources/img/icon/search_img.png"></div>';
						html += '<div class="search_none_text">검색 결과가 없습니다.</div>';
	
					}
					for(var i=0;i<list.length;i++){								
						html += '<li><div class="house_list_photo"><div class="like_house">';
						if(login == ''){
							html += '<button onclick="msgpopupopen();" class="heart"><img src="/resources/img/icon/heart_off.png"></button>';
						}else if(list[i].likedCheck == '좋아요'){
							html += '<a idx="'+list[i].houseNo+'" class="heart"><img src="/resources/img/icon/heart_on.png"></a>';
						}else {
							html += '<a idx="'+list[i].houseNo+'" class="heart"><img src="/resources/img/icon/heart_off.png"></a>'
						}
						if(list[i].photoList.length == 0){
							html += ' </div><img src="/resources/img/icon/heart_off.png"></div>';
						}else{
							html += ' </div><img src="/resources/upload/house/'+list[i].photoList[0].photoPath+'"></div>';
						}
						
						html += '<a href="houseView.do?houseNo='+list[i].houseNo+'"><div class="house_list_text"><div class="list_line_01"><span class="list_house_title">'+list[i].houseTitle+'</span></div>';
						html += '<div class="list_line_02"><span class="list_tag">';
						if(list[i].houseGender == '1'){
							html += '남성전용';
						}else if(list[i].houseGender == '2'){
							html += '여성전용';
						}else{
							html += '남여공용';
						}					
						html += '</span><span class="house_form">'+list[i].houseForm+'</span></div></div>';
						html += '<a href="houseView.do?houseNo='+list[i].houseNo+'" class="house_more_btn">입주 가능한 방 '+list[i].roomCount+'개</a>';
						html += '<input type="hidden" value="'+list[i].addressRoad+'" name="address">';
						html += '<input type="hidden" value="'+list[i].houseTitle+'" name="houseTitle">';
						html += '</li></a>';
						getHouseMap(list[i].addressRoad,list[i].houseTitle,"/resources/img/icon/heart_off.png",list[i].houseForm,list[i].roomCount,list[i].houseNo);
						//getHouseMap(list[i].addressRoad,list[i].houseTitle,list[i].photoList[0].photoPath,list[i].houseForm,list[i].roomCount,list[i].houseNo);
					}
					$(".list_container").append(html);
					$(".loading").hide();
					isLoading = false;					
				}
			});
		}
		$(document).ready(function(){
			GetList(1);
			
		});
		
		//-------------------------------Map --------------------------------------------//
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	      mapOption = {
	         center : new kakao.maps.LatLng(37.5640455, 126.834005), // 지도의 중심좌표
	         level : 6
	      };
	      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	      // 줌아웃에서 아웃 막기
	      map.setMinLevel(4); // 100m
	      map.setMaxLevel(7); // 1km
	      mateMap();
	      // default 서울시 
	      function mateMap() {
	         var lat, lon, locPosition;
	         lat = 37.5662994, 
	         lon = 126.9757564; 
	         locPosition = new kakao.maps.LatLng(37.5662994, 126.9757564); // 서울특별시
	         map.setCenter(locPosition);   
	         map.setLevel(9);
	         getHouseMap();
	      }
	      var oay = null;
	      var selectedMarker = null;
	      var coay = null;
	      var cselectedMarker = null;
	      function getHouseMap(addr,title,photo,housef,count,houseno) {
	    	  // 주소-좌표 변환 객체를 생성합니다
		         var geocoder = new kakao.maps.services.Geocoder();
		         // 주소로 좌표를 검색합니다
		         geocoder.addressSearch(addr, function(result, status) {
		             // 정상적으로 검색이 완료됐으면 
		              if (status === kakao.maps.services.Status.OK) {
		                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x); 
		               var imageSrc = '/resources/img/icon/markerHelper.png', 
		               imageSize = new kakao.maps.Size(50, 54), // 마커이미지의 크기입니다
		               imageOption = {
		                  offset : new kakao.maps.Point(10, -80)
		               }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		      
		               // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		               var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
		               imageOption), markerPosition = coords; // 마커가 표시될 위치입니다
		                 
		                 // 결과값으로 받은 위치를 마커로 표시합니다
		                 var marker = new kakao.maps.Marker({
		                     map: map,
		                     image: markerImage,
		                     zIndex : 11,
		                     position: coords,
	                         clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트
		                 });
			           // 커스텀 오버레이에 표시할 컨텐츠 입니다
			           // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
			           // 별도의 이벤트 메소드를 제공하지 않습니다 
			           var content = '<div class="map_wrap">' +  
			                       '    <div class="info">' + 
			                       '        <div class="title">' + 
			                       '            ' +title+
			                       '            <div class="house_map_close" onclick="closeOverlay(this)" title="닫기"></div>' + 
			                       '        </div>' + 
			                       '        <div class="body">' +
			                       '			<div class="img">' +
			                       //'                <img src="/resources/upload/house/'+photo+'">' +
			                       '                <img src="'+photo+'">' +
			                       '           </div>' + 
			                       '            <div class="desc">' + 
					               '       			<div class="title_tag">' +
					               '           			' +housef+
					               '        		</div>' + 
			                       '                <div class="ellipsis">'+addr+'</div>' + 
			                       '                <div class="jibun ellipsis">입주 가능한 방 '+count+'개</div>' + 
			                       '                <div><a href="houseView.do?houseNo='+houseno+'" target="_blank" class="house_view_more">자세히보기</a></div>' + 
			                       '            </div>' + 
			                       '        </div>' + 
			                       '    </div>' +    
			                       '</div>';
			           // 마커 위에 커스텀오버레이를 표시합니다
			           // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			           var overlay = new kakao.maps.CustomOverlay({
			               content: content,
		                   zIndex : 15,
			               position: marker.getPosition()       
			           });
			           
			           kakao.maps.event.addListener(marker, 'click', function() {
			        	   
			               // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
			               // 오버레이를 표시합니다.
						   if (cselectedMarker != null){
							   coay.setMap(null);
						   }
		                   // 클릭된 마커 객체가 null이 아니면
		                   // 이전에 표시된 오버레이를 표시하지 않습니다.
		                   if(oay != null){
		                	   oay.setMap(null);
		                   }
		                   
	                       if(coay != null){
	                     	   coay.setMap(null);
	                       }
						   // 현재 오버레이를 표시합니다.
			        	   overlay.setMap(map);
						   // 현재 마커를 중심으로 맵을 이동합니다.
			        	   map.setCenter(marker.getPosition());   
						   // 이전 오버레이에 현재 오버레이를 대입합니다.
			        	   oay = overlay;
						   // 클릭된 마커를 변경합니다.
			        	   selectedMarker = marker;
			        	   cselectedMarker = null;
			           });
		             } 
		            });
	      }
	   	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	      function closeOverlay(a) {
	    	  oay.setMap(null);
	      }
		//------------------------------스크롤 안에 리스트에서의 좋아요 부분 --------------------------------//
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
					}else{
						heart.children().attr("src","/resources/img/icon/heart_on.png");						
					}
				}
			});
		});
		//필터 아이콘 누를경우 
		$(".filter_icon").click(function(){
			$(".h_filter_open").slideToggle();
		});
		$(".closeBtn").click(function(){
			$(".h_filter_open").slideToggle();
		});
		// 초기화
		$("#resethouse").click(function(){
			$(".h_filter_open").find("input").prop("checked",false);
		});
		//적용하기
		$("#filter_apply_btn").click(function(){
			var genderValue = $("input[name='houseGender']:checked").val();
			var housetypeValue = $("input[name='houseForm']:checked").val();
			var roomValue = $("input[name='roomPersonnel']:checked").val();
			var roomCharge11 = $(".noUi-handle-lower").children().text();
			var roomCharge22 = $(".noUi-handle-upper").children().text();
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
			if(roomCharge11 == "0"){
				roomCharge1 = "0";
			}else{				
				roomCharge1 = roomCharge11+"0000";
			}
			roomCharge2 = roomCharge22+"0000";
			$(".h_filter_open").slideToggle();
		});
		//서치
		$("#searchHouse").click(function(){
			var keyword = $("input[name='keyword']").val();
			location.href="/houseList.do?keyword="+keyword+"&houseGender="+houseGender+"&houseForm="+houseForm+"&roomPersonnel="+roomPersonnel+"&roomCharge1="+roomCharge1+"&roomCharge2="+roomCharge2;
		});
		//초기화 버튼 누를 경우
	    $(".btnBorder").click(function(){
	    	$("input[type='checkbox']").prop('checked', false);
	    });
	</script>
</body>
</html>