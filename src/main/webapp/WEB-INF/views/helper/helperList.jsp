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
	<!-- 달력 -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
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
					<a id="searchHelper" class="search_icon">
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
									<strong>선호 성별</strong>
								</p>
								<div class="filter_cont">
									<div>
										<input type="radio" id="helper_gender__f" name="gender" value="2">
										<label for="helper_gender__f"><span class="select_icon02"></span>여성</label>
									</div>
									<div>
										<input type="radio" id="helper_gender__m" name="gender" value="1">
										<label for="helper_gender__m"><span class="select_icon04"></span>남성</label>
									</div>
									<div>
										<input type="radio" id="helper_gender__mf" name="gender" value="3">
										<label for="helper_gender__mf"><span class="select_icon03"></span>남녀모두</label>
									</div>
								</div>
							</div>
							<div class="ageFilter">
								<p class="filterTitle">
									<strong>선호 연령</strong>
								</p>
								<div class="filter_cont">
									<div>
										<input type="radio" id="helper_age1" name="helperage" value="1">
										<label for="helper_age1"><span class="select_icon02"></span>20대 이상</label>
									</div>
									<div>
										<input type="radio" id="helper_age2" name="helperage" value="2">
										<label for="helper_age2"><span class="select_icon04"></span>30대 이상</label>
									</div>
									<div>
										<input type="radio" id="helper_age3" name="helperage" value="3">
										<label for="helper_age3"><span class="select_icon03"></span>40대 이상</label>
									</div>
								</div>
							</div>
							<div class="timeWrap">
								<p class="filterTitle">
									<strong>선호 시간</strong>
								</p>
								<div class="filter_cont time_filter_cont">
									<div>
										<input type="text" class="timeform input_05" name="helperStartTime">
									</div>									
									<div>
										<input class="timeform input_05" type="text" name="helperEndTime">
									</div>
								</div>
							</div>
							<div class="houseTypeWrap">
								<p class="filterTitle">
									<strong>도움 유형</strong>&nbsp;&nbsp;중복 선택 가능
								</p>
								<div class="filter_cont help_cont">
									<div>
										<input type="checkbox" id="help_type_0" name="houseForm" value="0" class="chk">
										<label for="help_type_0"><span class="select_icon02"></span>배달·장보기</label>
									</div>
									<div>
										<input type="checkbox" id="help_type_1" name="houseForm" value="0" class="chk">
										<label for="help_type_1"><span class="select_icon02"></span>청소·집안일</label>
									</div>
									<div>
										<input type="checkbox" id="help_type_2" name="houseForm" value="0" class="chk">
										<label for="help_type_2"><span class="select_icon02"></span>설치·조립·운반</label>
									</div>
									<div>
										<input type="checkbox" id="help_type_3" name="houseForm" value="0" class="chk">
										<label for="help_type_3"><span class="select_icon02"></span>동행·돌봄</label>
									</div>
									<div class="clear">
										<input type="checkbox" id="help_type_4" name="houseForm" value="0" class="chk">
										<label for="help_type_4"><span class="select_icon02"></span>벌레·쥐</label>
									</div>
									<div>
										<input type="checkbox" id="help_type_5" name="houseForm" value="0" class="chk">
										<label for="help_type_5"><span class="select_icon02"></span>역할대행</label>
									</div>
									<div>
										<input type="checkbox" id="help_type_6" name="houseForm" value="0" class="chk">
										<label for="help_type_6"><span class="select_icon02"></span>과외·알바</label>
									</div>
									<div>
										<input type="checkbox" id="help_type_7" name="houseForm" value="0" class="chk">
										<label for="help_type_7"><span class="select_icon02"></span>기타·원격</label>
									</div>
									<input type="hidden" id="helperCategory" name="helperCategory">
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
		var gender = '${gender}';
		var helperStartTime = '${helperStartTime}';
		var helperEndTime = '${helperEndTime}';
		var helperCategory = '${helperCategory}';
		var age = '${age}';
		var addrs = new Array();
	
		
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
			if(gender == ""){
				gender = 0;
			}
			if(age == ""){
				age = 0;
			}
		//console.log(keyword);
		//console.log(gender);
		//console.log(helperStartTime);
		//console.log(helperEndTime);
		//console.log(helperCategory);
		//console.log(age);
			$.ajax({
				type : "GET",
				data : {
					"pageNum" : currentPage,
					keyword : keyword,
					gender : gender,
					helperStartTime : helperStartTime,
					helperEndTime : helperEndTime,
					helperCategory : helperCategory,
					age : age
				},
				url : "/ajax_helper_page.do",
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
						html += '<li><div class="helper_list_photo"><div class="like_helper">';
						if(login == ''){
							html += '<button onclick="msgpopupopen();" class="heart"><img src="/resources/img/icon/heart_off.png"></button>';
						}else if(list[i].likedCheck == '좋아요'){
							html += '<a idx="'+list[i].helperNo+'" class="heart"><img src="/resources/img/icon/heart_on.png"></a>';
						}else {
							html += '<a idx="'+list[i].helperNo+'" class="heart"><img src="/resources/img/icon/heart_off.png"></a>'
						}
						html += '</div><div class="helper_list_profile">';
						html += '<img src="/resources/upload/helper/'+list[i].helperFilepath+'" class="profile_view"></div></div>';
						html += '<a href="helperView.do?helperNo='+list[i].helperNo+'"><div class="helper_list_text_name"><span class="helper_list_nickname">'+list[i].helperName+'</span>';
						if(list[i].age == '1'){
							html += '<span class="helper_list_age">20대 · </span>';
						}else if(list[i].age == '2'){
							html += '<span class="helper_list_age">30대 · </span>';							
						}else{
							html += '<span class="helper_list_age">40대 · </span>';
						}
						if(list[i].gender == '1'){
							html += '<span class="helper_list_gender">남</span>';
						}else{
							html += '<span class="helper_list_gender">여</span>';
						}
						html += '</div><div class="helper_list_text_info">';
						html += '<span class="helper_list_text_code">활동시간 '+list[i].helperStartTime+'</span>';
						html += '<span class="helper_list_text_code">';
						if(list[i].helperRide == '1'){							
							html += '자동차';
						}else if(list[i].helperRide == '2'){
							html += '오토바이';
						}else if(list[i].helperRide == '3'){
							html += '전동퀵보드';
						}else if(list[i].helperRide == '4'){
							html += '자전거';
						}else{
							html += '걸어서';
						}
						html += '</span></div><div class="helper_list_intro">'+list[i].helperIntro+'</div>';
						html += '<div class="helper_Category" value="'+list[i].helperCategory+'">';
						html += '<span class="helper_Category_title">#배달·장보기</span>';
						html += '<span class="helper_Category_title">#청소·집안일</span>';
						html += '<span class="helper_Category_title">#설치·조립·운반</span>';
						html += '<span class="helper_Category_title">#동행·돌봄</span>';
						html += '<span class="helper_Category_title">#벌레·쥐</span>';
						html += '<span class="helper_Category_title">#역할대행</span>';
						html += '<span class="helper_Category_title">#과외·알바</span>';
						html += '<span class="helper_Category_title">#기타·원격</span>';
						html += '</div></a></li>';
						//for(var j =0; j < list[i].addr.length;j++){
						//	addrs.push(list[i].addr[j].addressRoad);
						//}
						//console.log(addr);
						getHouseMap(list[i].addr[0].addressRoad,list[i].helperName,list[i].helperFilepath,list[i].gender,list[i].age,list[i].helperNo,list[i].helperStartTime,list[i].helperEndTime,list[i].helperRide);
					}
					$(".list_container").append(html);
					$(".loading").hide();
					isLoading = false;
					//카테고리
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
	      console.log("주소 : "+addrs);
	      function getHouseMap(addr,name,photo,gender,age,helperno,time,time2,ride) {
	    	  
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
			           if(gender == 1){
			        	   gender = "남";
			           }else{
			        	   gender = "여";
			           }
			           if(age == 1){
			        	   age = "20대 · ";
			           }else if(age == 2){
			        	   age = "30대 · ";
			           }else{
			        	   age = "40대 · ";
			           }
			           if(ride == '1'){							
			        	   ride= '자동차';
						}else if(ride == '2'){
							ride= '오토바이';
						}else if(ride == '3'){
							ride= '전동퀵보드';
						}else if(ride == '4'){
							ride= '자전거';
						}else{
							ride= '걸어서';
						}
			           var content = '<div class="map_wrap">' +  
			                       '    <div class="info">' + 
			                       '        <div class="title"> Helper' +
			                       '            <div class="house_map_close" onclick="closeOverlay(this)" title="닫기"></div>' + 
			                       '        </div>' + 
			                       '        <div class="body">' +
			                       '			<div class="img">' +
			                       '                <img src="/resources/upload/helper/'+photo+'">' +
			                       '           </div>' + 
			                       '            <div class="desc">' +
			                       '				<span class="map_title_name">'+name+'</span>' +
					               '       			<div class="title_age">' +
					               '           			' +age+
					               '        		</div>' + 
			                       '                <div class="title_gender">'+gender+'</div>' + 
			                       '				</div><span class="map_titme">활동시간 : '+time+' ~ '+time2+'</span>'+
			                       '				<span class="map_ride">이동수단 : '+ride+'</span>'+
			                       '                <div><a href="helperView.do?helperNo='+helperno+'" target="_blank" class="house_view_more">More</a></div>' + 
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
			var helperNo = $(this).attr('idx');		
			var heart = $(this);
			$.ajax({
				url : "/HelperListLike.do",
				data : {memberNo:memberNo, helperNo:helperNo},
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
		$(".chk").change(function () {
			if($(this).is(":checked")){
				$(this).val(1);
				$("#helperCategory").val($("#help_type_0").val()+$("#help_type_1").val()+$("#help_type_2").val()
					+$("#help_type_3").val()+$("#help_type_4").val()+$("#help_type_5").val()+$("#help_type_6").val()+$("#help_type_7").val());
			}else{
				$(this).val(0);
				$("#helperCategory").val($("#help_type_0").val()+$("#help_type_1").val()+$("#help_type_2").val()
					+$("#help_type_3").val()+$("#help_type_4").val()+$("#help_type_5").val()+$("#help_type_6").val()+$("#help_type_7").val());
			}
	
		});
		$("#filter_apply_btn").click(function(){
			var genderValue = $("input[name='gender']:checked").val();
			var helperStartTime = $("input[name='helperStartTime']").val();
			var helperEndTime = $("input[name='helperEndTime']").val();
			var helperCategory = $("#helperCategory").val();
			var ageValue = $("input[name='age']:checked").val();
			if(genderValue == ""){
				gender = "0";
			}else if(genderValue == "1"){
				gender = "1";
			}else if (genderValue == "2"){
				gender = "2";
			}else{
				gender="0";
			}
			if(ageValue == ""){
				age = "0";
			}else if(ageValue == "1"){
				age = "1";
			}else if(ageValue == "2"){
				age = "2";
			}else{
				age = "0";
			}
			if(helperCategory == ""){
				helperCategory="00000000";
			}
			$(".h_filter_open").slideToggle();
		});
		//서치
		$("#searchHelper").click(function(){
			var keyword = $("input[name='keyword']").val();
			location.href="/helperList.do?keyword="+keyword+"&gender="+gender+"&helperStartTime="+helperStartTime+"&helperEndTime="+helperEndTime+"&helperCategory="+helperCategory+"&age="+age;
		});
		$(function() {
			// 시간
			$('.timeform').daterangepicker({
				timePicker : true,
				singleDatePicker : true,
				timePicker24Hour : true,
				timePickerIncrement : 30,
				locale : {
					"format" : 'HH:mm',
					"applyLabel" : "확인",
					"cancelLabel" : "취소"
				}
			}).on('show.daterangepicker', function(ev, picker) {
				picker.container.find(".calendar-table").hide();
			});
			$("input[name='helperStartTime']").on('apply.daterangepicker', function(ev, picker) {
				$("input[name='helperStartTime']").css("color","#956bfc");       
		   });
			$("input[name='helperEndTime']").on('apply.daterangepicker', function(ev, picker) {
				$("input[name='helperEndTime']").css("color","#956bfc");	       
		   });
		});	
		//초기화 버튼 누를 경우
	    $(".btnBorder").click(function(){
	    	$("input[type='checkbox']").prop('checked', false);
	    	$("input[name='helperStartTime']").val("");
	    	$("input[name='helperEndTime']").val("");
	    });
	  
	</script>
</body>
</html>