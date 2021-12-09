<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	margin-top: 15px;
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
			<div class="content">
				<form action="/roomWrite.do" method="post">
					<h4 class="form-title">방 리스트</h4>
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
							<option value="3인실">3인실</option>
							<option value="다인실">다인실</option>
						</select>
					</div>
					<div class="content-place">
						<p class="ac-title">첫달 월세금</p>
						<input type="text" class="input_03" name="roomMonth"
							placeholder="숫자만 적어주세요" id="roomMonth">
					</div>
					<div class="content-place">
						<p class="ac-title">보증금</p>
						<input type="text" class="input_03" name="roomCharge"
							placeholder="숫자만 적어주세요" id="roomMonth">
					</div>
					<div class="button-place">
						<button class="btn btn_w" type="submit" style="line-height: 30px;"
							id="accountcomplate" onclick="accountChk()">선택완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		function accountChk() {
			if($("#roomTitle").val()!="" && $("#roomSize").val()!=""&& $("#roomPhone").va()!=""&& $("#roomMonth").val()!="" && $(#"#roomPersonnel").val()!=""){
				return true;
			}else{
				alert("방등록 내용을 확인해주세요!!")
				return false;
			}
	
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>