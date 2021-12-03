<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content {
	width: 500px;
	margin: 0 auto;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #9F9F9F;
	border-radius: 5px;
}

#bank {
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
	font-size: 20px;
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
	<!-- 달력 -->
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

	<div class="container_mate">
		<div class="content">
			<form action="/houseWrite" enctype="multipart/form-data">
				<div class="accountForm">
					<h4 class="form-title">정산받을 계좌를 입력해주세요</h4>
					<div class="content-place";>
						<p class="ac-title">은행</p>
						<select id="bank" class="control-group" name="incomeBank">
							<option value>선택</option>
							<option value="신한">신한</option>
							<option value="국민">국민</option>
							<option value="IBK">IBK</option>
							<option value="농협">농협</option>
							<option value="수협">수협</option>
							<option value="우리">우리</option>
							<option value="카카오뱅크">카카오뱅크</option>
						</select>
						<p class="ac-title">계좌번호</p>
						<input type="text" name="incomeAccount" class="input_03"
							placeholder="숫자만 기재해주세요">
						<p class="ac-title">예금주</p>
						<input type="text" name="incomeName" class="input_03">
					</div>
					<div class="button-place">
						<button class="btn btn_w" type="button" style="line-height: 30px;">선택완료</button>
					</div>
				</div>
				<div id="calender">
					<h4 class="form-title">정산받을 계좌를 입력해주세요</h4>
					<div class="content-place">
						<input type="text" name="datefilter"
							placeholder="여행시작일 선택후 확인 후/ 끝나는 일자 선택 후 확인"
							class="input_date input_04" style="width: 100%;">
					</div>
					<div class="button-place">
						<button class="btn btn_w" type="button" style="line-height: 30px;">선택완료</button>
					</div>
				</div>
				<div id="houseAddress">
					<h4 class="form-title">위치정보 입력</h4>
					<div class="content-place">
						<div class="postcode">
                                    <input type="text" id="postCode" name="addressCode"class="input_04" readonly placeholder="우편번호">
                                    <button type="button" onclick="addrSearch();" class="btn btn_sm">주소검색</button>
                                </div>
                                <div class="postcode">
                                    <input type="text" id="roadAddr" class="input_03" placeholder="도로명 주소" name="companyAddr">
                                    <input type="hidden" name="addressName">
                                    <input type="hidden" name="addressRoad">
                                    <input type="hddien" name="addressLegal">
                                </div>
                                <div class="postcode">
                                    <input type="text" name="addressDetail" id="detailAddr" class="input_03" placeholder="상세주소">
                                </div>
					</div>
					<div class="button-place">
						
					</div>
				</div>
			</form>
		</div>
	</div>
	<script>
		// 달력 한글화 
		$('input[name="datefilter"]').daterangepicker(
				{
					autoUpdateInput : false,
					locale : {
						cancelLabel : 'Clear',
						"format" : "YYYY-MM-DD",
						"separator" : " ~ ",
						"applyLabel" : "확인",
						"cancelLabel" : "취소",
						"fromLabel" : "From",
						"toLabel" : "To",
						"customRangeLabel" : "Custom",
						"weekLabel" : "W",
						"daysOfWeek" : [ "월", "화", "수", "목", "금", "토", "일" ],
						"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월",
								"7월", "8월", "9월", "10월", "11월", "12월" ],
						"firstDay" : 1
					}
				});
		$('input[name="datefilter"]').on(
				'apply.daterangepicker',
				function(ev, picker) {
					//클릭 시 인풋에 날짜표시 바꾸려면 해당부분 변경하면됨!
					$(this).val(
							picker.startDate.format('YYYY/MM/DD') + ' - '
									+ picker.endDate.format('YYYY/MM/DD'));
				});
		$('input[name="datefilter"]').on('cancel.daterangepicker',
				function(ev, picker) {
					$(this).val('');
				});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>