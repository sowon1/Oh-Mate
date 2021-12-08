<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content {
	width: 600px;
	margin: 0 auto;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #9F9F9F;
	border-radius: 5px;
}

.note-modal-content {
	height: auto;
	position: fixed;
	top: 40%;
	left: 20%;
	transform: translate(-50%, -50%);
}

.note-modal-footer {
	margin-bottom: 40px
}

.content-place>select {
	width: 100%;
	height: 45px;
	font-size: 16px;
	font-weight: bold;
	border-radius: 5px;
	padding: 10px; /* 내부여백 */
	padding-left: 12px;
	border: 1px solid #9F9F9F;
	background: url(/resources/img/icon/arrow_down_18dp.png) no-repeat right
		50%; /* 화살표 위치 */
	background-size: 40px; /* 화살표 크기 */
	border-radius: 4px;
	box-sizing: border-box;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	color: ##9F9F9F;
	outline: none;
}

.content div {
	text-align: center;
}

.ac-title {
	text-align: left;
	font-size: 16px;
	color: #847E78;
	margin: 5px;
}

.button-place {
	margin-top: 15px;
}

.content-place {
	margin-top: 30px;
	height: 300px;
}

.form-title {
	margin: 5px;
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container_mate">
		<div class="houseForm">
			<h4 class="form-title">방 리스트</h4>
			<div class="content-place">
				<div class="room-status">
					<p class="ac-title">현재 방갯수 ※등록하신 방갯수 채워야함</p>
					<span id="nowRoom"></span>/<span id="endRoom">${houseRoom }</span>
				</div>
				<div class="plus-room">
					<form action="/roomWriteFrm.do" method="post">
						<input type="hidden" name="houseNo" value="${houseNo }">
						<button class="btn btn_w" type="submit">방 등록하기</button>
					</form>
				</div>
				<div class="room-list">
					<c:forEach items="${list }" var="r" varStatus="i">
						<ul>
							<li class="room_li">
								<div class="room-title">
									<p>${r.roomTitle }</p>
									<div class="roomBtn">
										<a href="/roomMod.do"> <i class="fas fa-pen far-2x"></i>
										</a> <a href="/roomDel.do"> <i class="fas fa-times far-2x"></i>
										</a>
									</div>
								</div>
								<div class="room-detail">
									<table>
										<tr>
											<td>
												<p class="ac-title">보증금</p>
												<div class="font-mid">${r.roomCharge }원</div>
											</td>
											<td>
												<p class="ac-title">첫달 월세</p>
												<div class="font-mid">${r.roomMonth }원</div>
											</td>
										</tr>
										<tr>
											<td>
												<p class="ac-title">${r.roomSize }평·${r.roomPersonnel }</p>
											</td>
											<td>
												<p class="ac-title">전화번호 : ${r.roomPhone }</p>
											</td>
										</tr>
									</table>
								</div>
							</li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<div class="button-place">
				<a class="btn" style="line-height: 30px" onclick="roomChk()">메인으로돌아가기
				</a>
			</div>
		</div>
	</div>
	<script>
		
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>