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
		<h1 class="point_title">${r.roomTitle }</h1>
		<div style="border-bottom: 1px solid #111111">
			<div>
				<table class="table">
					<tr>
						<th>방 평수</th>
						<td>${r.roomSize }평</td>
						<th>연락처</th>
						<td>${r.roomPhone }</td>
					</tr>
					<tr>
						<th>방 형태</th>
						<td>${r.roomPersonnel }</td>
						<th>입주 상태</th>
						<td><c:choose>
								<c:when test="${r.roomStatus eq 1 }">
									<span class="allow-agree"
										style="color: blue; border: 1px solid blue;">입주가능</span>
								</c:when>
								<c:when test="${r.roomStatus eq 2 }">
									<span class="allow-refuse"
										style="color: red; border: 1px solid red;">입주불가</span>
								</c:when>
							</c:choose></td>
					</tr>
					<tr>
						<th>보증금</th>
						<td>${r.roomCharge }원</td>
						<th>월세</th>
						<td>${r.roomMonth }원</td>
					</tr>
					<tr>
						<th>방 소개</th>
						<td colspan="3">${r.roomContentBr }</td>
					</tr>
				</table>
			</div>
		</div>
		<div style="border-bottom: 1px solid #111111">
			<div>
				<h1 class="point_title">입주내역</h1>
				<table class="table">
					<tr>
						<th>No</th>
						<th>이름</th>
						<th>입주일</th>
						<th>퇴거일(예정포함)</th>
						<th>입주자 연락처</th>
					</tr>
					<c:forEach items="${r.roomMove }" var="m" varStatus="i">
						<tr>
							<td>${moveStart+i.index }</td>
							<td>${m.memberName }</td>
							<td>${m.moveStart }</td>
							<td>${m.moveEnd }</td>
							<td>${m.movePhone }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div style="width: 300px; margin: 0 auto;">${movePage }</div>
		</div>
		<div style="border-bottom: 1px solid #111111">
			<h1 class="point_title">투어신청 내역</h1>
			<div style="margin-bottom: 20px;">
				<table class="table">
					<tr>
						<th>No</th>
						<th>이름</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>방문일자(예정)</th>
						<th>QNA</th>
						<th>방문승인여부</th>
					</tr>
					<c:forEach items="${r.roomTour }" var="t" varStatus="j">
						<tr>
							<td>${tourStart+j.index}</td>
							<td>${t.memberName }</td>
							<td>${t.tourPhone }</td>
							<td>${t.tourEmail }</td>
							<td>${t.tourVisit }</td>
							<td style="width: 90px;">
								<div>
									<button class="modbtn" id="modbtn">QNA내용</button>
									<div class="modal-wrap2">
										<div class="modal2">
											<div class="modal-top2">
												<h1>QNA내용</h1>
												<p style="font-size: 12px;">※창을 나가려면 창 밖으로 클릭하세요!</p>
											</div>
											<div class="modal-content2">
												<table>
													
													<tr>
														<th>이름</th>
														<td>${t.memberName }</td>
														<th>전화번호</th>
														<td>${t.tourPhone }</td>
													</tr>
													<tr>
														<th>이메일</th>
														<td>${t.tourEmail }</td>
														<th>방문일자</th>
														<td>${t.tourVisit }</td>
													</tr>
													<tr>
														<th>내용</th>
														<td colspan="3">
														<c:choose>
														<c:when test="${empty t.tourQna }">
														QNA내용이 없습니다,
														</c:when>
														<c:when test="${not empty t.tourQna }">
														${t.tourQna }
														</c:when>
														</c:choose>
														</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</td>
							<c:choose>
								<c:when test="${t.tourStatus eq 1 }">
									<td style="color: #956bfc;">승인</td>
								</c:when>
								<c:when test="${t.tourStatus eq 3 }">
									<td style="color: #ff0071;">거절</td>
								</c:when>
								<c:when test="${t.tourStatus eq 2 }">
									<td><a
										href="/updateTourStatus.do?roomNo=${r.roomNo }&houseNo=${r.houseNo}&movePage=1&tourPage=1&tourStatus=1&tourNo=${t.tourNo}"
										class="btn btn_b"
										style="width: 80px; height: 30px; font-size: 14px; line-height: 14px;">승인</a>
										<a
										href="/updateTourStatus.do?roomNo=${r.roomNo }&houseNo=${r.houseNo}&movePage=1&tourPage=1&tourStatus=3&tourNo=${t.tourNo}"
										class="btn btn_pk_out"
										style="width: 80px; height: 30px; font-size: 14px; line-height: 14px;">거절</a>
									</td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div style="width: 300px; margin: 0 auto;">${tourPage }</div>
		</div>
		<div style="margin-left: 200px; margin-top: 30px;">
			<a href="/houseOwnerRoom.do?houseNo=${r.houseNo }&memberNo=${sessionScope.m.memberNo }"class="btn btn_b_line btn_rx" style="width: 80%; line-height: 30px;	">하우스 상세페이지로 돌아가기</a>
		</div>
	</div>
	<script>
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
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>