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
	padding: 30px;
	box-sizing: border-box;
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

.content {
	background-color: #fff;
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

.houseForm div {
	text-align: center;
}

.ac-title {
	font-size: 16px;
	color: #847E78;
	margin: 5px;
}

.button-place {
	margin-top: 15px;
}

.content-place {
	margin-top: 30px;
}

.form-title {
	margin: 5px;
	font-weight: bold;
}

.room-counting>span {
	font-size: 18px;
	color: #956bfc;
}

.room-title {
	overflow: hidden;
	border-bottom: 1px solid #9F9F9F;
}

.roomTL {
	float: left;
	margin-left: 5px;
}

.roomBtn {
	float: right;
	margin-right: 5px;
}

.room-list {
	border: 1px solid #9F9F9F;
	border-radius: 5px;
}
</style>
<!-- jQuery라이브러리 -->
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<!--  JSTL 확장 c 태그 선언문 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 폰트어썸(아이콘) -->
<link rel="stylesheet" href="/resources/fontawesome/css/all.css">
<script type="text/javascript" src="/resources/fontawesome/js/all.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<!-- 부트스트랩용 jQuery -->
<script type="text/javascript"
	src="/resources/js/bootstrap.bundle.min.js"></script>
<!-- 기본 CSS -->
<link rel="stylesheet" href="/resources/css/default.css">
<!-- 폰트 CSS -->
<link rel="stylesheet" href="/resources/css/font.css">
<!-- 채팅방 css -->
<link rel="stylesheet" href="/resources/css/main/mate_talk.css">
</head>
<body>
	<div
		style="margin: 0; padding-top: 200px; background-color: #f8f8fa; height: 100%;">
		<div class="content">
			<div class="houseForm">
				<h4 class="form-title point_title">방 리스트</h4>
				<div class="content-place">
					<div class="room-status">
						<div class="room-counting" style="text-align: left;">
							<p class="ac-title">현재 방갯수 ※등록하신 방갯수 채워야함</p>
							<span id="nowRoom"></span>/<span id="endRoom">${houseRoom }</span>
						</div>
					</div>
					<hr>
					<div class="plus-room">
						<form action="/roomWriteFrm.do" method="post">
							<input type="hidden" name="houseNo" value="${houseNo }">
							<input type="hidden" name="houseRoom" value="${houseRoom }">
							<button class="btn btn_w" type="submit"
								style="height: 40px; line-height: 25px"
								onclick="return chkNum()">방 등록하기</button>
						</form>
					</div>
					<br>
					<c:forEach items="${list }" var="r" varStatus="i">
						<div class="room-list" style="margin-top: 15px;">
							<ul>
								<li class="room_li">
									<div class="room-title">
										<div class="roomTL">
											<p
												style="font-size: 25px; font-weight: bold; color: #956bfc; margin-left: 5px">${r.roomTitle }</p>
										</div>
										<div class="roomBtn">
											<c:choose>
												<c:when test="${r.roomStatus==1 }">
													<a
														href="/roomMod.do?roomNo=${r.roomNo }&houseNo=${r.houseNo}&houseRoom=${houseRoom}">
														<i class="fas fa-pen far-2x"></i>
													</a>
													<a
														href="/roomDel.do?houseNo=${r.houseNo }&roomNo=${r.roomNo }&houseRoom=${houseRoom}">
														<i class="fas fa-times far-2x"></i>
													</a>
												</c:when>
											</c:choose>
										</div>
									</div>
									<div class="room-detail">
										<table>
											<tr>
												<td style="width: 100px;">
													<p class="ac-title">보증금</p>
													<div class="font-mid">${r.roomCharge }원</div>
												</td>
												<td>
													<p class="ac-title">첫달 월세</p>
													<div class="font-mid">${r.roomMonth }원</div>
												</td>
												<td>
													<p class="ac-title"
														style="margin-top: 40px; margin-left: 30px;">${r.roomSize }평·${r.roomPersonnel }/전화번호
														: ${r.roomPhone }</p>
												</td>
											</tr>
										</table>
									</div>
								</li>
							</ul>
						</div>
					</c:forEach>
				</div>
				<div class="button-place">
					<button class="btn btn_w" type="button" onclick="chkRoom()"
						style="line-height: 30px">메인페이지로 돌아가기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {

			var length = $(".room-list").length;
			$("#nowRoom").html(length);
		});
		function chkRoom() {
			var now = $("#nowRoom").html();
			var end = $("#endRoom").html();
			if (now == end) {
				location.href = "/main.do";
			} else {
				alert("등록하신 최대 방갯수를 채워주세요~");
			}
		}
		function chkNum() {
			var start = $("#nowRoom").html();
			var co = $("#endRoom").html();
			if (start == co) {
				alert("최대 방갯수가 초과됬습니다.")
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>