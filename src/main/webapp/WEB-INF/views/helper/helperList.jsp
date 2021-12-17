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
										<label for="house-filter_gender_division_f"><span class="select_icon02"></span>여성헬퍼</label>
									</div>
									<div>
										<input type="radio" id="house-filter_gender_division_m" name="gender" value="1">
										<label for="house-filter_gender_division_m"><span class="select_icon04"></span>남성헬퍼</label>
									</div>
									<div>
										<input type="radio" id="house-filter_gender_division_mf" name="gender" value="3">
										<label for="house-filter_gender_division_mf"><span class="select_icon03"></span>남녀모두</label>
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
	
		console.log(keyword);
		console.log(gender);
		console.log(helperStartTime);
		console.log(helperEndTime);
		console.log(helperCategory);
		
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
			$.ajax({
				type : "GET",
				data : {
					"pageNum" : currentPage,
					keyword : keyword,
					gender : gender,
					helperStartTime : helperStartTime,
					helperEndTime : helperEndTime,
					helperCategory : helperCategory
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
						html += '<li><div class="house_list_photo"><div class="like_house">';
						if(login == ''){
							html += '<button onclick="msgpopupopen();" class="heart"><img src="/resources/img/icon/heart_off.png"></button>';
						}else if(list[i].likedCheck == '좋아요'){
							html += '<a idx="'+list[i].helperNo+'" class="heart"><img src="/resources/img/icon/heart_on.png"></a>';
						}else {
							html += '<a idx="'+list[i].helperNo+'" class="heart"><img src="/resources/img/icon/heart_off.png"></a>'
						}
						if(list[i].photoList.length == 0){
							html += ' </div><img src="/resources/img/icon/heart_off.png"></div>';
						}else{
							html += ' </div><img src="/resources/upload/helper/'+list[i].helperFilepath+'"></div>';
						}
						
						html += '<a href="houseView.do?houseNo='+list[i].helperNo+'"><div class="house_list_text"><div class="list_line_01"><span class="list_house_title">'+list[i].helperName+'</span></div>';
						html += '<div class="list_line_02"><span class="list_tag">';					
						html += '</span><span class="house_form">'+list[i].helperRide+'</span></div></div>';
						html += '<a href="helperView.do?helperNo='+list[i].helperNo+'" class="house_more_btn">입주 가능한 방 '+list[i].helperName+'개</a>';
						html += '<input type="hidden" value="'+list[i].addressRoad+'" name="address">';
						html += '<input type="hidden" value="'+list[i].helperName+'" name="houseTitle">';
						html += '</li></a>';
						//getHouseMap(list[i].addressRoad,list[i].houseTitle,"/resources/img/icon/heart_off.png",list[i].houseForm,list[i].roomCount,list[i].houseNo);
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
			if(genderValue == ""){
				gender = "0";
			}else if(genderValue == "1"){
				gender = "1";
			}else if (genderValue == "2"){
				gender = "2";
			}else{
				gender="0";
			}
			console.log(gender);
			console.log(helperStartTime);
			console.log(helperEndTime);
			console.log(helperCategory);
			$(".h_filter_open").slideToggle();
		});
		//서치
		$("#searchHouse").click(function(){
			var keyword = $("input[name='keyword']").val();
			location.href="/helperList.do?keyword="+keyword+"&gender="+gender+"&helperStartTime="+helperStartTime+"&helperEndTime="+helperEndTime+"&helperCategory="+helperCategory;
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