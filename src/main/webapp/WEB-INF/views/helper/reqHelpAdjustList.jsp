<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.line-fr{
	border-bottom: 1px solid #111111;
	margin-top: 30px;
}
</style>
<title>Oh-Mate!</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container_mate">
		<h1 class="point_title" style="margin-bottom: 50px;">헬프 요청 정산 이력</h1>
		<hr>
		<div class="line-fr">
			<div>
				<table class="table">
					<tr>
						<th colspan="2" rowspan="2"><img
							src="/resources/upload/helper/${list[0].helperFilepath }"
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
						<th style="width: 200px">선호분야</th>
						<td colspan="5" >
							<div class="help_helper_pro_cate"
								value="${list[0].helperCategory}" >
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
						<td colspan="5">${list[0].helperCredit }</td>
					</tr>
				</table>
			</div>
			<div>
				<table class="table">
					<tr>
						<th>No</th>
						<th>헬프제목</th>
						<th>결제자 ID</th>
						<th>결제자 이름</th>
						<th>결제일자</th>
						<th>결제 금액</th>
						<th>결제 상태</th>
						<th>결제 취소 일자</th>
					</tr>
					<c:forEach items="${list }" var="h" varStatus="i">
						<tr>
							<td>${start+i.index }</td>
							<td>${h.helpTitle }</td>
							<td>${h.payName }</td>
							<td>${h.payId }</td>
							<td>${h.payDate }</td>
							<td>${h.payPrice }</td>
							<td>${h.payStatus }</td>
							<td>${h.cancelDate }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="pageNavi" style="width: 400px; margin: 0 auto; text-align: center;">${pageNavi }</div>
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
		$(".modbtn").click(function() {
		var idx= $(".modbtn").index(this);
			console.log(idx);
			$(".modal-wrap2").eq(idx).css("display", "flex");
			$('body').css("overflow", "hidden"); //모달시 스크롤 방지
			$(".back_dark").show();
			//오늘시간 구하기
			$("a[name='allowBtn']").click(function() {
						var startTime = $("input[name='StartTime']").eq(idx).val()
								.replaceAll(":", "");
						console.log("확인1"+(idx));
						console.log((startTime));
						var nowTime = new Date();
						var now = formatDate(nowTime);
						console.log(now);
						var startNum = Number(startTime);
						var nowNum = Number(now);
						var helpNo= $('input[name=helpNoNum]').eq(idx).val();
						if(nowNum>=startNum){
							alert("이미 지정된 시작시간이 지났습니다. 다른 요청을 선택해주세요!")
							console.log("승락"+idx);
							location.href="/updateCancelHelpStatus.do?helpStatus=6&helpNo="+helpNo;
						}else if(nowNum<startNum){
							var comTime= startNum-nowNum;
							if(comTime>100){
								location.href="/updateHelpStatus.do?helpStatus=2&helpNo="+helpNo;
							}else{
								alert("한시간 이전까지만 헬프요청 승락이 가능합니다.")
								location.href="/updateCancelHelpStatus.do?helpStatus=6&helpNo="+helpNo;
							}
						}
						
					});
			//취소
			$("a[name='cancelBtn']").click(function() {
				var startTime = $("input[name='StartTime']").eq(idx).val()
						.replaceAll(":", "");
				console.log((idx));
				console.log((startTime));
				var nowTime = new Date();
				var now = formatDate(nowTime);
				console.log(now);
				var startNum = Number(startTime);
				var nowNum = Number(now);
				var helpNo= $('input[name=helpNoNum]').eq(idx).val();
				if(nowNum<startNum){
					var comTime= startNum-nowNum;
					if(comTime>100){
						location.href="/updateCancelHelpStatus.do?helpStatus=4&helpNo="+helpNo;
					}else{
						alert("한시간 이전까지만 취소가 가능합니다.");
					}
				}
				
			});
			//헬프 완료 이미지 띄우기
			var sel_files = [];
			var qq=$("input[name='photoPath']").eq(idx).val();
			console.log(qq);
			$(document).ready(function() {
				$("input[name='photoPath']").eq(idx).on("change", handleImgsFilesSelect);
			});
			
			$("a[name='complete']").click(function () {
				if($("textarea[name='helpComplite']").eq(idx).val()!="" && $("input[name='photoPath']").eq(idx).val()!=""){
					$(".comForm").eq(idx).submit();
				}else{
					if($("textarea[name='helpComplite']").eq(idx).val()==""){
						alert("헬프 마감내역을 적지 않았습니다.")
					}else if($("input[name='photoPath']").eq(idx).val()==""){
						alert("사진을 한장이라도 올려주셔야합니다.")
					}
				}
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
								$(".img_wrap").eq(idx).append(img_html);
							}
							reader.readAsDataURL(f);
						});
			}
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
		
		
		function formatDate(date) {
			var d = new Date(date), hour = '' + d.getHours(), min = ''
					+ d.getMinutes()
			if (hour.length < 2)
				hour = '0' + hour;
			if (min.length < 2)
				min = '0' + min;
			return [ hour, min ].join('');
		}
		
		
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>