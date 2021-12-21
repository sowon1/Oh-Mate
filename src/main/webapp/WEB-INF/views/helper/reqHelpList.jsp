<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container_mate">
		<h1 class="point_title">헬프요청 리스트</h1>
		<div style="border-bottom: 1px solid #111111">
			<div style="margin-top: 30px;">
				<table class="table">
					<tr>
						<th colspan="2" rowspan="2"><img
							src="/resources/upload/house/${list[0].helperFilepath }"
							style="width: 150px; height: 150px;"></th>
						<th style="width: 120px;">닉네임</th>
						<td>${list[0].helperName }</td>
						<th>이동수단</th>
						<td><c:choose>
								<c:when test="${list[0].helperRide eq 1}">
							자동차
							</c:when>
								<c:when test="${list[0].helperRide eq 2 }">
							오토바이
							</c:when>
								<c:when test="${list[0].helperRide eq 3 }">
							전동퀵보드
							</c:when>
								<c:when test="${list[0].helperRide eq 4 }">
							자전거
							</c:when>
								<c:when test="${list[0].helperRide eq 5 }">
							없음
							</c:when>
							</c:choose></td>
					</tr>
					<tr>
						<th>선호시작시간</th>
						<td>${list[0].helperStartTime }</td>
						<th>선호마감시간</th>
						<td>${list[0].helperEndTime }</td>
					</tr>
					<tr>
						<th>선호분야</th>
						<td colspan="3">
							<div class="help_helper_pro_cate"
								value="${list[0].helperCategory}">
								<em class="help_helper_pro_cate">배달·장보기</em> <em
									class="help_helper_pro_cate">청소·집안일</em> <em
									class="help_helper_pro_cate">설치·조립·운반</em> <em
									class="help_helper_pro_cate">동행·돌봄</em> <em
									class="help_helper_pro_cate">벌레·쥐</em> <em
									class="help_helper_pro_cate">역할대행</em> <em
									class="help_helper_pro_cate">과외·알바</em> <em
									class="help_helper_pro_cate">기타·원격</em>
							</div>
						</td>
					</tr>
					<tr>
						<th>자격증 소개</th>
						<td colspan="3">${list[0].helperCredit }</td>
					</tr>
				</table>
			</div>
			<div>
				<table class="table">
					<tr>
						<th>No</th>
						<th>헬프분야</th>
						<th>헬프제목</th>
						<th>시작시간</th>
						<th>마감시간</th>
						<th>마감일자</th>
						<th>헬프상태</th>
						<th>상세보기</th>
					</tr>
					<c:forEach items="${list }" var="h" varStatus="i">
						<tr>
							<td>${start+i.index }
							<input type="hidden" name=helpNo value="${h.helpNo }">
							</td>
							<td><c:choose>
									<c:when test="${h.helpCategory eq 1}">배달·장보기</c:when>
									<c:when test="${h.helpCategory eq 2}">청소·집안일</c:when>
									<c:when test="${h.helpCategory eq 3}">설치·조립·운반</c:when>
									<c:when test="${h.helpCategory eq 4}">동행·돌봄</c:when>
									<c:when test="${h.helpCategory eq 5}">벌레·쥐</c:when>
									<c:when test="${h.helpCategory eq 6}">역할대행</c:when>
									<c:when test="${h.helpCategory eq 7}">과외·알바</c:when>
									<c:when test="${h.helpCategory eq 8}">기타·원격</c:when>
								</c:choose></td>
							<td>${h.helpTitle }</td>
							<td>${h.helpRequestDate}${h.helpStartTime }</td>
							<td>${h.helpRequestDate}${h.helpEndTime }</td>
							<td>${h.helpFinishDate }</td>
							<td>
							<c:choose>
								<c:when test="${h.helpStatus eq 1 }">헬프요청중</c:when>
								<c:when test="${h.helpStatus eq 2 }">헬프진행중</c:when>
								<c:when test="${h.helpStatus eq 3 }">헬프완료</c:when>
								<c:when test="${h.helpStatus eq 4 }">헬프취소</c:when>
								<c:when test="${h.helpStatus eq 5 }">헬프만료</c:when>
								<c:when test="${h.helpStatus eq 6 }">헬프거절</c:when>
							</c:choose>
							</td>
							<td>
								<div>
									<button class="modbtn" id="modbtn" style="float: left;">확인하기</button>
									<div class="modal-wrap2">
										<div class="modal2">
											<div class="modal-top2">
												<h1>헬퍼 상세 내용 ${h.helpStatus }</h1>
												<p style="font-size: 12px;">※창을 나가려면 창 밖으로 클릭하세요!</p>
											</div>
											<div class="modal-content2">
												<table>
													<tr>
														<th>헬프제목</th>
														<td>${h.helpTitle }</td>
														<th>작성자</th>
														<td>${h.memberName }</td>
													</tr>
													<tr>
														<th>이메일</th>
														<td>${h.email}</td>
														<th>연락처</th>
														<td>${h.phone }</td>
													</tr>
													<tr>
														<th>시작시간</th>
														<td>${h.helpStartTime }</td>
														<th>마감시간</th>
														<td>${h.helpEndTime }</td>
													</tr>
													<tr>
														<th>주소</th>
														<td>${h.addressName }${h.addressRoad }
															${h.addressLegal }</td>
														<td>
														<c:choose>
														<c:when test="${helpStatus eq 1}">헬프 요청중</c:when>
														<c:when test="${helpStatus eq 2 }">헬프 진행중</c:when>
														<c:when test="${helpStatus eq 3 }">헬프 처리완료</c:when>
														<c:when test="${helpStatus eq 4 }">헬프취소</c:when>
														<c:when test="${helpStatus eq 5 }">만료됨</c:when>
														<c:when test="${helpStatus eq 6 }">헬프거절</c:when>
														</c:choose>
														</td>
													</tr>
													<tr>
														<th>헬프내용</th>
														<td colspan="3">${h.helpContent }</td>
													</tr>
												</table>
											</div>
											<div class="modal-content2" style="text-align: center;">
														<input type="hidden" value="${h.helpStartTime }"
															name="StartTime">
												<c:choose>
													<c:when test="${h.helpStatus eq 1 }">
														<a href="#" class="btn btn_b_line btn_rx" name="allowBtn" style="line-height: 30px">승인</a>
														<a href="/updateHelpStatus.do?helpStatus=6 and helpNo=${h.helpNo }" class="btn btn_b_line btn_rx" style="line-height: 30px">거절</a>
													</c:when>
													<c:when test="${h.helpStatus eq 2 }">
														<div>
														<form action="/helpComplete.do" class="comForm"  method="post" enctype="multipart/form-data">
														<table>
															<tr>
															<th>헬프완료 내역</th>
															<td>
															 	<textarea name="helpComplite" class="textarea_pro"></textarea>
															</td>
															</tr>
															<tr>
																<th>헬프완료 사진</th>
															<td>
																<div>
																	<input type="file" id="input_imgs" name="photoPath" multiple />
																</div>
																<div class="img_wrap"></div>
															</td>
															</tr>
														</table>
														</form>
														</div>
														<div>
														<a href="#" class="btn btn_b_line btn_rx"  style="line-height: 30px" onclick="complete();">헬프 완료</a>														
														<a href="#" class="btn btn_b_line btn_rx" name="cancelBtn" style="line-height: 30px" >헬프취소하기</a>
														</div>
													</c:when>
													<c:when test="${h.helpStatus eq 3}">
													<strong>헬프처리완료</strong>
													</c:when>
													<c:when test="${h.helpStatus eq 4}">
													<strong>헬프요청 취소하셨습니다.</strong>
													</c:when>
													<c:when test="${h.helpStatus eq 5 }">
													<strong>시간이 만료되었습니다.!</strong>
													</c:when>
													<c:when test="${h.helpStatus eq 6}">
													<strong>거절하셨습니다.</strong>
													</c:when>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<script>
		//도움 요청 - 상단 프로필
		$(function() {
			var options = $(".help_helper_pro_cate").attr("value");
			for (var i = 0; i < options.length; i++) {
				if (options.charAt(i) == 0) {
					$(".help_helper_pro_cate>em").eq(i).hide();
				}
			}
		});
		//모달
		$(".modbtn").eq(0).click(function() {
			$(".modal-wrap2").eq(0).css("display", "flex");
			$('body').css("overflow", "hidden"); //모달시 스크롤 방지
			$(".back_dark").show();
		});
		$(".modbtn").eq(1).click(function() {
			$(".modal-wrap2").eq(1).css("display", "flex");
			$('body').css("overflow", "hidden"); //모달시 스크롤 방지
			$(".back_dark").show();
		});
		$(".modbtn").eq(2).click(function() {
			$(".modal-wrap2").eq(2).css("display", "flex");
			$('body').css("overflow", "hidden"); //모달시 스크롤 방지
			$(".back_dark").show();
		});
		$(".modbtn").eq(3).click(function() {
			$(".modal-wrap2").eq(3).css("display", "flex");
			$('body').css("overflow", "hidden"); //모달시 스크롤 방지
			$(".back_dark").show();
		});
		$(".modbtn").eq(4).click(function() {
			$(".modal-wrap2").eq(4).css("display", "flex");
			$('body').css("overflow", "hidden"); //모달시 스크롤 방지
			$(".back_dark").show();
		});
		$(document).mouseup(function(e) {
			//마우스 영역 밖 클릭 시 모달 닫기
			var container = $('.modal-wrap2');
			if (container.has(e.target).length === 0) {
				container.css('display', 'none');
				$('body').css("overflow", "auto"); //본문 스크롤 살리기
			}
		});
		$("#text_hover").mouseover(function() {
			$(".brand_info").css("visibility", "visible");
		});
		$("#text_hover").mouseleave(function() {
			$(".brand_info").css("visibility", "hidden");
		});
		//오늘시간 구하기
		$("a[name='allowBtn']").eq(0).click(
				function() {
					var startTime = $("input[name='StartTime']").eq(0).val()
							.replaceAll(":", "");
					console.log((startTime));
					var nowTime = new Date();
					var now = formatDate(nowTime);
					console.log(now);
					var startNum = Number(startTime);
					var nowNum = Number(now);
					var helpNo= $('input[name=helpNo]').eq(0).val();
					if(nowNum>=startNum){
						alert("이미 지정된 시작시간이 지났습니다. 다른 요청을 선택해주세요!")
						location.href="/updateHelpStatus.do?helpStatus=5&helpNo="+helpNo;
					}else if(nowNum<startNum){
						var comTime= startNum-nowNum;
						if(comTime>100){
							location.href="/updateHelpStatus.do?helpStatus=2&helpNo="+helpNo;
						}else{
							alert("한시간 이전까지만 헬프요청 승락이 가능합니다.")
							location.href="/updateHelpStatus.do?helpStatus=5&helpNo="+helpNo;
						}
					}
					
				});
		$("a[name='allowBtn']").eq(1).click(
				function() {
					var startTime = $("input[name='StartTime']").eq(1).val()
							.replaceAll(":", "");
					console.log((startTime));
					var nowTime = new Date();
					var now = formatDate(nowTime);
					console.log(now);
					var startNum = Number(startTime);
					var nowNum = Number(now);
					var helpNo1= $('input[name=helpNo]').eq(1).val();
					if(nowNum>=startNum){
						alert("이미 지정된 시작시간이 지났습니다. 다른 요청을 선택해주세요!")
						location.href="/updateHelpStatus.do?helpStatus=5&helpNo="+helpNo1;
					}else if(nowNum<startNum){
						var comTime= startNum-nowNum;
						if(comTime>100){
							location.href="/updateHelpStatus.do?helpStatus=2&helpNo="+helpNo1;
						}else{
							alert("한시간 이전까지만 헬프요청 승락이 가능합니다.")
							location.href="/updateHelpStatus.do?helpStatus=5&helpNo="+helpNo1;
						}
					}
					
				});
		$("a[name='allowBtn']").eq(2).click(
				function() {
					var startTime = $("input[name='StartTime']").eq(2).val()
							.replaceAll(":", "");
					console.log((startTime));
					var nowTime = new Date();
					var now = formatDate(nowTime);
					console.log(now);
					var startNum = Number(startTime);
					var nowNum = Number(now);
					var helpNo= $('input[name=helpNo]').eq(2).val();
					if(nowNum>=startNum){
						alert("이미 지정된 시작시간이 지났습니다. 다른 요청을 선택해주세요!")
						location.href="/updateHelpStatus.do?helpStatus=5&helpNo="+helpNo;
					}else if(nowNum<startNum){
						var comTime= startNum-nowNum;
						if(comTime>100){
							location.href="/updateHelpStatus.do?helpStatus=2&helpNo="+helpNo;
						}else{
							alert("한시간 이전까지만 헬프요청 승락이 가능합니다.")
							location.href="/updateHelpStatus.do?helpStatus=5&helpNo="+helpNo;
						}
					}
					
				});
		$("a[name='allowBtn']").eq(3).click(
				function() {
					var startTime = $("input[name='StartTime']").eq(3).val()
							.replaceAll(":", "");
					console.log((startTime));
					var nowTime = new Date();
					var now = formatDate(nowTime);
					console.log(now);
					var startNum = Number(startTime);
					var nowNum = Number(now);
					var helpNo= $('input[name=helpNo]').eq(3).val();
					if(nowNum>=startNum){
						alert("이미 지정된 시작시간이 지났습니다. 다른 요청을 선택해주세요!")
						location.href="/updateHelpStatus.do?helpStatus=5&helpNo="+helpNo;
					}else if(nowNum<startNum){
						var comTime= startNum-nowNum;
						if(comTime>100){
							location.href="/updateHelpStatus.do?helpStatus=2&helpNo="+helpNo;
						}else{
							alert("한시간 이전까지만 헬프요청 승락이 가능합니다.")
							location.href="/updateHelpStatus.do?helpStatus=5&helpNo="+helpNo;
						}
					}
					
				});
		$("a[name='allowBtn']").eq(4).click(
				function() {
					var startTime = $("input[name='StartTime']").eq(4).val()
							.replaceAll(":", "");
					console.log((startTime));
					var nowTime = new Date();
					var now = formatDate(nowTime);
					console.log(now);
					var startNum = Number(startTime);
					var nowNum = Number(now);
					var helpNo= $('input[name=helpNo]').eq(4).val();
					if(nowNum>=startNum){
						alert("이미 지정된 시작시간이 지났습니다. 다른 요청을 선택해주세요!")
						location.href="/updateHelpStatus.do?helpStatus=5&helpNo="+helpNo;
					}else if(nowNum<startNum){
						var comTime= startNum-nowNum;
						if(comTime>100){
							location.href="/updateHelpStatus.do?helpStatus=2&helpNo="+helpNo;
						}else{
							alert("한시간 이전까지만 헬프요청 승락이 가능합니다.")
							location.href="/updateHelpStatus.do?helpStatus=5&helpNo="+helpNo;
						}
					}
					
				});
		$("a[name='cancelBtn']").eq(0).click(
				function() {
					var startTime = $("input[name='StartTime']").eq(0).val()
							.replaceAll(":", "");
					console.log((startTime));
					var nowTime = new Date();
					var now = formatDate(nowTime);
					console.log(now);
					var startNum = Number(startTime);
					var nowNum = Number(now);
					var helpNo= $('input[name=helpNo]').eq(0).val();
					if(nowNum<startNum){
						var comTime= startNum-nowNum;
						if(comTime>100){
							location.href="/updateHelpStatus.do?helpStatus=4&helpNo="+helpNo;
						}else{
							alert("한시간 이전까지만 취소가 가능합니다.");
						}
					}
					
				});
		$("a[name='cancelBtn']").eq(1).click(
				function() {
					var startTime = $("input[name='StartTime']").eq(1).val()
							.replaceAll(":", "");
					console.log((startTime));
					var nowTime = new Date();
					var now = formatDate(nowTime);
					console.log(now);
					var startNum = Number(startTime);
					var nowNum = Number(now);
					var helpNo= $('input[name=helpNo]').eq(1).val();
					if(nowNum<startNum){
						var comTime= startNum-nowNum;
						if(comTime>100){
							location.href="/updateHelpStatus.do?helpStatus=4&helpNo="+helpNo;
						}else{
							alert("한시간 이전까지만 취소가 가능합니다.");
						}
					}
					
				});
		$("a[name='cancelBtn']").eq(2).click(
				function() {
					var startTime = $("input[name='StartTime']").eq(2).val()
							.replaceAll(":", "");
					console.log((startTime));
					var nowTime = new Date();
					var now = formatDate(nowTime);
					console.log(now);
					var startNum = Number(startTime);
					var nowNum = Number(now);
					var helpNo= $('input[name=helpNo]').eq(2).val();
					if(nowNum<startNum){
						var comTime= startNum-nowNum;
						if(comTime>100){
							location.href="/updateHelpStatus.do?helpStatus=4&helpNo="+helpNo;
						}else{
							alert("한시간 이전까지만 취소가 가능합니다.");
						}
					}
					
				});
		$("a[name='cancelBtn']").eq(3).click(
				function() {
					var startTime = $("input[name='StartTime']").eq(3).val()
							.replaceAll(":", "");
					console.log((startTime));
					var nowTime = new Date();
					var now = formatDate(nowTime);
					console.log(now);
					var startNum = Number(startTime);
					var nowNum = Number(now);
					var helpNo= $('input[name=helpNo]').eq(3).val();
					if(nowNum<startNum){
						var comTime= startNum-nowNum;
						if(comTime>100){
							location.href="/updateHelpStatus.do?helpStatus=4&helpNo="+helpNo;
						}else{
							alert("한시간 이전까지만 취소가 가능합니다.");
						}
					}
					
				});
		$("a[name='cancelBtn']").eq(4).click(
				function() {
					var startTime = $("input[name='StartTime']").eq(4).val()
							.replaceAll(":", "");
					console.log((startTime));
					var nowTime = new Date();
					var now = formatDate(nowTime);
					console.log(now);
					var startNum = Number(startTime);
					var nowNum = Number(now);
					var helpNo= $('input[name=helpNo]').eq(4).val();
					if(nowNum<startNum){
						var comTime= startNum-nowNum;
						if(comTime>100){
							location.href="/updateHelpStatus.do?helpStatus=4&helpNo="+helpNo;
						}else{
							alert("한시간 이전까지만 취소가 가능합니다.");
						}
					}
					
				});
		
		function formatDate(date) {
			var d = new Date(date), hour = '' + d.getHours(), min = ''
					+ d.getMinutes()
			if (hour.length < 2)
				hour = '0' + hour;
			if (min.length < 2)
				min = '0' + day;
			return [ hour, min ].join('');
		}
		//헬프 완료 이미지 띄우기
		var sel_files = [];
		var idx= $("input[name='photoPath']").index()
		$(document).ready(function() {
			$("input[name='photoPath']").eq(0).on("change", handleImgsFilesSelect);
		});
		$(document).ready(function() {
			$("input[name='photoPath']").eq(1).on("change", handleImgsFilesSelect);
		});
		$(document).ready(function() {
			$("input[name='photoPath']").eq(2).on("change", handleImgsFilesSelect);
		});
		$(document).ready(function() {
			$("input[name='photoPath']").eq(3).on("change", handleImgsFilesSelect);
		});
		$(document).ready(function() {
			$("input[name='photoPath']").eq(4).on("change", handleImgsFilesSelect);
		});
		function handleImgsFilesSelect(e) {
			var files = e.target.files;
			var fileArr = Array.prototype.slice.call(files);

			fileArr
					.forEach(function(f) {
						if (!f.type.match("image.*")) {
							alert("확장자는 이미지 확장자만 가능합니다.");
							return;
						}
						sel_files.push(f);

						var reader = new FileReader();
						reader.onload = function(e) {
							var img_html = "<span><img src=\""+e.target.result+"\" style='width:80px;height:80px;'/></span>";
							$(".img_wrap").append(img_html);
						}
						reader.readAsDataURL(f);
					});
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>