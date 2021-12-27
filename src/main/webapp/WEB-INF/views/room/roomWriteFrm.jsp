<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
<style>
.content {
	width: 600px;
	margin: 0 auto;
	padding: 10px;
	box-sizing: border-box;
	border-radius: 5px;
	background-color: #fff;
	padding: 30px;
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
	margin-top: 15px;
}

.form-title {
	margin: 5px;
	margin-bottom: 30px;
	font-weight: bold;
}
</style>
<!-- jQuery라이브러리 -->
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<!--  JSTL 확장 c 태그 선언문 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 폰트어썸(아이콘) -->
<link rel="stylesheet" href="/resources/fontawesome/css/all.css">
<script type="text/javascript" src="/resources/fontawesome/js/all.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<!-- 부트스트랩용 jQuery -->
<script type="text/javascript" src="/resources/js/bootstrap.bundle.min.js"></script>
<!-- 기본 CSS -->
<link rel="stylesheet" href="/resources/css/default.css">
<!-- 폰트 CSS -->
<link rel="stylesheet" href="/resources/css/font.css">
<!-- 채팅방 css -->
<link rel="stylesheet" href="/resources/css/main/mate_talk.css">
</head>
<body>
	<div style="margin: 0; padding-top: 50px; background-color: #f8f8fa; height: 100%;">
			<div class="content">
				<form action="/roomWrite.do" method="post" id="frm">
					<h4 class="form-title point_title">방 리스트</h4>
					<input type="hidden" name="houseNo" value="${houseNo }">
					<input type="hidden" name="houseRoom" value="${houseRoom }">
					<div class="content-place">
						<p class="ac-title">방 제목</p>
						<input type="text" class="input_03" id="roomTitle" name="roomTitle"
							placeholder="방 제목">
					</div>
					<div class="content-place">
						<p class="ac-title">방 평수</p>
						<input type="text" class="input_03" id="roomSize" name="roomSize"
							placeholder="ex)30평  etc">
					</div>
					<div class="content-place">
						<p class="ac-title">연락처</p>
						<input type="text" class="input_03" id="roomPhone" name="roomPhone"
							placeholder="010-XXXX-XXXX 로 적어주세요">
					</div>
					<div class="content-place">
						<p class="ac-title">룸 내용</p>
						<textarea name="roomContent" class="textarea_pro"></textarea>
					</div>
					<div class="content-place" >
						<p class="ac-title">방 유형</p>
						<select class="control-group" id="roomPersonnel" name="roomPersonnel">
							<option value="">선택</option>
							<option value="1인실">1인실</option>
							<option value="2인실">2인실</option>
							<option value="다인실">다인실</option>
						</select>
					</div>
					<div class="content-place">
						<p class="ac-title">첫달 월세금</p>
						<input type="text" class="input_03" id="roomMonth" name="roomMonth"
							placeholder="숫자만 적어주세요" >
					</div>
					<div class="content-place">
						<p class="ac-title">보증금</p>
						<input type="text" class="input_03" id="roomCharge"name="roomCharge"
							placeholder="숫자만 적어주세요" >
					</div>
					<div class="button-place">
						 <a class="btn" 
							style="line-height: 30px;width: 300px;" onclick="accountChk()">방만들기</a>
					</div>
				</form>
			</div>
	</div>
	<script>
		function accountChk() {
			var roomMonth=$("#roomMonth").val();
			var roomCharge = $("#roomCharge").val();
			var roomIntChk=/^[0-9]/;
			if($("#roomTitle").val()!="" && $("#roomSize").val()!=""&& $("#roomPhone").val()!=""&& $("#roomMonth").val()!="" && $("#roomPersonnel").val()!=""
					&&roomIntChk.test(roomMonth)&&roomIntChk.test(roomCharge))
			{
				$("#frm").submit();
			}else{
				alert("방등록 내용을 확인해주세요!!")
			}
	
		}
	</script>
</body>
</html>