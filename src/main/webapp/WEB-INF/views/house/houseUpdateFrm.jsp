<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
<style>
.content {
	width: 600px;
	margin: 150px auto;
	box-sizing: border-box;
	padding: 30px;
	border-radius: 5px;
	background-color: #fff;
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

.content {
	background-color: #fff;
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
	margin-bottom: 30px;
	font-weight: bold;
	text-align: left;
}

.houseForm {
	display: none;
}

.img_wap>span>img {
	width: 80px;
	height: 100px;
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

	<!-- 달력 -->
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<!-- 썸머노트 등록 -->

	<script src="/resources/summernote/summernote-lite.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<div style="margin: 0; background-color: #f8f8fa; height: 100%;">
		<div class="content">
			<form action="/houseUpdate.do" id="frm" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name=houseNo value="${h.houseNo }">
				<input type="hidden" name="memberNo"
					value="${sessionScope.m.memberNo }">
				<!-- 0 -->
				<div class="houseForm" style="display: block;">
					<h4 class="form-title point_title">정산받을 계좌를 입력해주세요</h4>
					<div class="content-place">
						<p class="ac-title">은행</p>
						<select id="bank" class="control-group" name="incomeBank">
							<c:choose>
								<c:when test="${h.houseIncome[0].incomeBank eq '신한' }">
									<option value="신한" selected="selected">신한</option>
									<option value="국민">국민</option>
									<option value="IBK">IBK</option>
									<option value="농협">농협</option>
									<option value="수협">수협</option>
									<option value="우리">우리</option>
									<option value="카카오뱅크">카카오뱅크</option>
								</c:when>
								<c:when test="${h.houseIncome[0].incomeBank eq '국민' }">
									<option value="신한">신한</option>
									<option value="국민" selected="selected">국민</option>
									<option value="IBK">IBK</option>
									<option value="농협">농협</option>
									<option value="수협">수협</option>
									<option value="우리">우리</option>
									<option value="카카오뱅크">카카오뱅크</option>
								</c:when>
								<c:when test="${h.houseIncome[0].incomeBank eq 'IBK' }">
									<option value="신한">신한</option>
									<option value="국민">국민</option>
									<option value="IBK" selected="selected">IBK</option>
									<option value="농협">농협</option>
									<option value="수협">수협</option>
									<option value="우리">우리</option>
									<option value="카카오뱅크">카카오뱅크</option>
								</c:when>
								<c:when test="${h.houseIncome[0].incomeBank eq '농협' }">
									<option value="신한">신한</option>
									<option value="국민">국민</option>
									<option value="IBK">IBK</option>
									<option value="농협" selected="selected">농협</option>
									<option value="수협">수협</option>
									<option value="우리">우리</option>
									<option value="카카오뱅크">카카오뱅크</option>
								</c:when>
								<c:when test="${h.houseIncome[0].incomeBank eq '수협' }">
									<option value="신한">신한</option>
									<option value="국민">국민</option>
									<option value="IBK">IBK</option>
									<option value="농협">농협</option>
									<option value="수협" selected="selected">수협</option>
									<option value="우리">우리</option>
									<option value="카카오뱅크">카카오뱅크</option>
								</c:when>
								<c:when test="${h.houseIncome[0].incomeBank eq '우리' }">
									<option value="신한">신한</option>
									<option value="국민">국민</option>
									<option value="IBK">IBK</option>
									<option value="농협">농협</option>
									<option value="수협">수협</option>
									<option value="우리" selected="selected">우리</option>
									<option value="카카오뱅크">카카오뱅크</option>
								</c:when>
								<c:when test="${h.houseIncome[0].incomeBank eq '카카오뱅크' }">
									<option value="신한">신한</option>
									<option value="국민">국민</option>
									<option value="IBK">IBK</option>
									<option value="농협">농협</option>
									<option value="수협">수협</option>
									<option value="우리">우리</option>
									<option value="카카오뱅크" selected="selected">카카오뱅크</option>
								</c:when>
							</c:choose>
						</select>
						<input type="hidden" name=incomeNo value="${h.houseIncome[0].incomeNo }">
						<p class="ac-title">계좌번호</p>
						<input type="text" id="number" name="incomeAccount"
							class="input_03" placeholder="하이픈(-)과 같이 기제해주세요"
							value="${h.houseIncome[0].incomeAccount }">
						<p class="ac-title">예금주</p>
						<input type="text" id="name" name="incomeName" class="input_03"
							value="${h.houseIncome[0].incomeName}">
					</div>
					<div class="button-place">
						<button class="btn btn_w" type="button" style="line-height: 30px;"
							id="accountcomplate" onclick="accountChk()">선택완료</button>
					</div>
				</div>
				<!-- 1 -->
				<div class="houseForm">
					<h4 class="form-title point_title">소개가 끝나는 날짜를 정해주세요</h4>
					<div class="content-place">
						<input type="text" name="houseownerDeadline" id="datefilter"
							class="input_date input_04" style="width: 100%;"
							readonly="readonly" value="${h.houseownerDeadline }">
					</div>
					<div class="button-place">
						<button class="btn btn_w" type="button" style="line-height: 30px;"
							onclick="dateChk()">선택완료</button>
					</div>
				</div>
				<!-- 2 -->
				<div class="houseForm">
					<h4 class="form-title point_title">집정보 입력</h4>
					<div class="content-place" style="height: 600px;">
						<p class="ac-title">하우스 이름</p>
						<input type="text" name="houseTitle" id="houseTitle"
							class="input_03" placeholder="하우스이름" value="${h.houseTitle }">
						<p class="ac-title">보증금(대표)</p>
						<input type="text" name="houseCharge" id="houseCharge"
							class="input_03" placeholder="보증금" value="${h.houseCharge }">
						<p class="ac-title">주거형태</p>
						<select id="HSF" class="control-group" name="houseForm">
							<c:choose>
								<c:when test="${h.houseForm eq '아파트' }">
									<option value="" disabled="disabled">선택</option>
									<option value="아파트" selected="selected">아파트</option>
									<option value="단독주택" disabled="disabled">단독주택</option>
									<option value="빌라" disabled="disabled">빌라</option>
									<option value="기타" disabled="disabled">기타</option>
								</c:when>
								<c:when test="${h.houseForm eq '단독주택' }">
									<option value="" disabled="disabled">선택</option>
									<option value="아파트" disabled="disabled">아파트</option>
									<option value="단독주택" selected="selected">단독주택</option>
									<option value="빌라" disabled="disabled">빌라</option>
									<option value="기타" disabled="disabled">기타</option>
								</c:when>
								<c:when test="${h.houseForm eq '빌라' }">
									<option value="" disabled="disabled">선택</option>
									<option value="아파트" disabled="disabled">아파트</option>
									<option value="단독주택" disabled="disabled">단독주택</option>
									<option value="빌라" selected="selected">빌라</option>
									<option value="기타" disabled="disabled">기타</option>
								</c:when>
								<c:when test="${h.houseForm eq '기타' }">
									<option value="" disabled="disabled">선택</option>
									<option value="아파트" disabled="disabled">아파트</option>
									<option value="단독주택" disabled="disabled">단독주택</option>
									<option value="빌라" disabled="disabled">빌라</option>
									<option value="기타" selected="selected">기타</option>
								</c:when>
							</c:choose>
						</select>
						<p class="ac-title">하우스 시설 소개</p>
						<textarea class="summernote" name="houseContent">${h.houseContent }</textarea>
					</div>
					<div class="button-place">
						<a class="btn btn_out" style="line-height: 30px;"
							onclick="backdate()">이전</a> <a class="btn"
							style="line-height: 30px" onclick="introChk()">다음</a>
					</div>
				</div>
				<!-- 3 -->
				<div class="houseForm">
					<h4 class="form-title point_title">이용규칙/이미지 업로드</h4>
					<div class="content-place" style="height: 400px;">
						<p class="ac-title">하우스 이용규칙</p>
						<textarea class="summernote" name="houseRule">${h.houseRule }</textarea>
					</div>
					<div class="imageForm">
						<div class="input_wrap">
							<p class="ac-title">이미지업로드 (삭제하고싶은 이미지를 선택해주시고 이미지가 없는 경우 추가해주세요(이미지 추가 필수!))</p>
							<c:choose>
								<c:when test="${not empty h.photoList }">
									<div style="height: 150px; border: 1px solid #ededed; padding: 15px;">
									<c:forEach items="${h.photoList }" var="hs">
									
										<span class="delFile">${hs.photoPath }</span>
										<button type="button" class="delBtn" style="border: none; background-color: #956bfc; color: #fff; border-radius: 2px; width: 40px;"  >삭제</button>
										<input type="hidden" class="oldPhotoPath" name="oldPhotoPath" value="${hs.photoPath }">
										<input type="hidden" class="oldPhotoNo" name="oldPhotoNo" value="${hs.photoNo }">
									</c:forEach>
									</div>
									<input type="file" id="input_imgs" name="photoPath" multiple />
								</c:when>
								<c:otherwise>								
								<input type="file" id="input_imgs" name="photoPath" multiple />
								</c:otherwise>
							</c:choose>
						</div>
						<div class="img_wrap"></div>
					</div>
					<div class="button-place">
						<a class="btn btn_out" style="line-height: 30px;"
							onclick="backIntro()">이전</a> <a class="btn"
							style="line-height: 30px" onclick="ruleChk()">다음</a>
					</div>
				</div>
				<!-- 4 -->
				<div class="houseForm">
					<h4 class="form-title point_title">제공정보 입력</h4>
					<div class="content-place" style="height: auto;">
						<p class="ac-title">제공편의시설</p>
						<table>
							<tr>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_00" value="0"><label for="fun_00">텔레비젼</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_01" value="0"><label for="fun_01">냉장고</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_02" value="0"><label for="fun_02">밥솥</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_03" value="0"><label for="fun_03">책상</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_04" value="0"><label for="fun_04">토스트기</label>
									</div>
								</td>
							</tr>
							<tr>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_05" value="0"><label for="fun_05">쇼파</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_06" value="0"><label for="fun_06">가스렌지</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_07" value="0"><label for="fun_07">전자렌지</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_08" value="0"><label for="fun_08">세탁기</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_09" value="0"><label for="fun_09">정수기</label>
									</div>
								</td>
							</tr>
							<tr>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_10" value="0"><label for="fun_10">청소기</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_11" value="0"><label for="fun_11">커피포트</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_12" value="0"><label for="fun_12">에어컨</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_13" value="0"><label for="fun_13">건조시설</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_14" value="0"><label for="fun_14">침대</label>
									</div>
								</td>
							</tr>
							<tr>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_15" value="0"><label for="fun_15">서랍</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_16" value="0"><label for="fun_16">옷장</label>
									</div>
								</td>

								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_17" value="0"><label for="fun_17">의자</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_18" value="0"><label for="fun_18">인터넷시설</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_19" value="0"><label for="fun_19">엘레베이터</label>
									</div>
								</td>
							</tr>
							<tr>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_20" value="0"><label for="fun_20">보안</label>
									</div>
								</td>
							</tr>
						</table>
						<input type="hidden" id="houseConvenience" name="houseConvenience"
							value="${h.houseConvenience }">
						<input type="hidden" id="houseRoom" name="houseRoom" value="${h.houseRoom }">
						<p class="ac-title" style="margin-top: 15px;">지정성별</p>
						<table>
							<tr style="text-align: center;">
								<c:choose>
									<c:when test="${h.houseGender eq 1}">
										<td style="width: 100px"><input type="radio" class="chk"
											name="houseGender" id="gender1" value="1" checked="checked"><label
											for="gender1">남성전용</label></td>
										<td style="width: 100px"><input type="radio" class="chk"
											name="houseGender" id="gender2" value="2"><label
											for="gender2">여성전용</label></td>
										<td style="width: 100px"><input type="radio" class="chk"
											name="houseGender" id="gender3" value="3"><label
											for="gender3">남녀공용</label></td>
									</c:when>
									<c:when test="${h.houseGender eq 2}">
										<td style="width: 100px"><input type="radio" class="chk"
											name="houseGender" id="gender1" value="1"><label
											for="gender1">남성전용</label></td>
										<td style="width: 100px"><input type="radio" class="chk"
											name="houseGender" id="gender2" value="2" checked="checked"><label
											for="gender2">여성전용</label></td>
										<td style="width: 100px"><input type="radio" class="chk"
											name="houseGender" id="gender3" value="3"><label
											for="gender3">남녀공용</label></td>
									</c:when>
									<c:when test="${h.houseGender eq 3}">
										<td style="width: 100px"><input type="radio" class="chk"
											name="houseGender" id="gender1" value="1"><label
											for="gender1">남성전용</label></td>
										<td style="width: 100px"><input type="radio" class="chk"
											name="houseGender" id="gender2" value="2"><label
											for="gender2">여성전용</label></td>
										<td style="width: 100px"><input type="radio" class="chk"
											name="houseGender" id="gender3" value="3" checked="checked"><label
											for="gender3">남녀공용</label></td>
									</c:when>
								</c:choose>
							</tr>
						</table>

					</div>
					<div class="button-place">
						<a class="btn btn_out" style="line-height: 30px;"
							onclick="backCondition()">이전</a> <a class="btn"
							style="line-height: 30px" onclick="chkRoom()">다음</a>
					</div>
				</div>

			</form>
		</div>
	</div>
	<script>
		$(function () {
		var conval = $("#houseConvenience").val();
		console.log(conval.length);
		for(var i=0;i<conval.length;i++){
			console.log($(".find input").eq(i));
			if(conval.charAt(i)==1){
				$(".find input").eq(i).attr("checked",true);
				$(".find input").eq(i).val(1);
			}
		}
		//input 값변경

		$(".find>div>input").change(
				function() {
					if ($(this).is(":checked")) {
						$(this).val("1");
						$("#houseConvenience").val(
								$("#fun_00").val() + $("#fun_01").val()
										+ $("#fun_02").val()
										+ $("#fun_03").val()
										+ $("#fun_04").val()
										+ $("#fun_05").val()
										+ $("#fun_06").val()
										+ $("#fun_07").val()
										+ $("#fun_08").val()
										+ $("#fun_09").val()
										+ $("#fun_10").val()
										+ $("#fun_11").val()
										+ $("#fun_12").val()
										+ $("#fun_13").val()
										+ $("#fun_14").val()
										+ $("#fun_15").val()
										+ $("#fun_16").val()
										+ $("#fun_17").val()
										+ $("#fun_18").val()
										+ $("#fun_19").val()
										+ $("#fun_20").val());
						console.log($(this).val());
						console.log($("#houseConvenience").val());
					} else {
						$(this).val("0");
						$("#houseConvenience").val(
								$("#fun_00").val() + $("#fun_01").val()
										+ $("#fun_02").val()
										+ $("#fun_03").val()
										+ $("#fun_04").val()
										+ $("#fun_05").val()
										+ $("#fun_06").val()
										+ $("#fun_07").val()
										+ $("#fun_08").val()
										+ $("#fun_09").val()
										+ $("#fun_10").val()
										+ $("#fun_11").val()
										+ $("#fun_12").val()
										+ $("#fun_13").val()
										+ $("#fun_14").val()
										+ $("#fun_15").val()
										+ $("#fun_16").val()
										+ $("#fun_17").val()
										+ $("#fun_18").val()
										+ $("#fun_19").val()
										+ $("#fun_20").val());
						console.log($(this).val());
						console.log($("#houseConvenience").val());
					}
				});
		});
		

		//오늘날짜 yyyy-mm-dd
		function getToday() {
			var date = new Date();
			var year = date.getFullYear();
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);

			return year + "-" + month + "-" + day;
		}
		// 달력 한글화 
		$('#datefilter').daterangepicker(
				{
					minDate : getToday(),
					singleDatePicker : true,
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
						"daysOfWeek" : [ "일", "월", "화", "수", "목", "금", "토" ],
						"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월",
								"7월", "8월", "9월", "10월", "11월", "12월" ],
						"firstDay" : 1
					}
				});
		$('#datefilter').on('apply.daterangepicker', function(ev, picker) {
			//클릭 시 인풋에 날짜표시 바꾸려면 해당부분 변경하면됨!
			$(this).val(picker.endDate.format('YYYY-MM-DD'));
		});
		$('#datefilter').on('cancel.daterangepicker', function(ev, picker) {
			$(this).val('');
		});
		function init() {
			var tab = $(".houseForm");
			for (var i = 0; i < tab.length; i++) {
				$(".houseForm").eq(i).css("display", "none");
			}
		}
		function next(idx) {
			init();
			$(".houseForm").eq(idx).css("display", "block");
		}
		//계좌페이지
		function accountChk() {
			var bank = $("#bank").val();
			var name = $("#name").val();
			var account = $("#number").val();
			if (bank != "선택" && name && bank != "") {
				next(1);
			} else {
				alert("은행계좌를 다시한 번 확인해주세요")
			}
		}
		//날짜 확인
		function dateChk() {
			var today = new Date();
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var dateString = year + '-' + month + '-' + day;
			var endDate = $("#datefilter").val();

			if (dateString < endDate) {
				next(2);
			} else {
				alert("날짜선택을 잘못 하셨습니다.")
			}

		}
		//돌아가기(1)
		function backdate() {
			next(1);
		}
		//주소확인(공백확인)
		function chkAddr() {
			var postCode = $("#postCode").val();
			var roadCode = $("#roadCode").val();
			var detailAddr = $("#detailAddr").val();
			if (roadCode != "" && detailAddr != "") {
				next(3);
			} else {
				alert("주소를 다시한번 확인해 주세요");
			}
		}
		//돌아가기(2)
		function backAddr() {
			next(2);
		}

		function introChk() {
			var houseName = $("#houseName").val();
			var HSF = $("#HSF").val();
			var houseCharge = $("#houseCharge").val();
			var houseChargeChk = /^[0-9]/;
			var houseTitle = $("#houseTitle").val();
			console.log(houseTitle);
			var houseTitleChk = /.{4,30}$/;
			if (HSF != "" && houseName != ""
					&& houseChargeChk.test(houseCharge)) {
				if (houseTitleChk.test(houseTitle)) {
					next(3);
				} else {
					alert("제목은 4글자 이상 30자이내로 작성해주세요!");
				}
			} else {
				alert("제목 및 주거형태를 확인해주세요");
			}
		}
		function backIntro() {
			next(2);
		}
		function backCondition() {
			next(3);
		}
		function chkRoom() {
			var houseRoom = $("#houseRoom").val();
			// 추가해야됨 제공편의시설 하나라도 체크하면 넘어가게(월요일 선생님에게 문의)
			if (houseRoom != "") {
				$("#frm").submit();
			} else {
				alert("방개수 및 제공 편의시설을 확인해주세요");
			}
		}
		//카카오 주소
		function addrSearch() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							document.querySelector("#postCode").value = data.zonecode;
							document.querySelector("#roadAddr").value = data.address;
							document.querySelector("#addressName").value = data.sigungu;
							document.querySelector("#addressRoad").value = data.roadname;
							document.querySelector("#addressLegal").value = data.bname2;
						}
					}).open();
		}
		//썸머노트
		$(".summernote").summernote({
			height : 250,
			maxHeight : 250, // 최대 높이
			lang : "ko-KR",
			callbacks : {
				onImageUpload : function(files) {
					for (var i = 0; i < files.length; i++) {
						houseUploadImage(files[i], this);
					}
				}
			}

		});
		//ajax이용 이미지 업로드
		function houseUploadImage(file, editor) {
			var form = new FormData();
			form.append("file", file);
			$.ajax({
				url : "/houseUploadImage.do",
				type : "post",
				data : form,
				processData : false,
				enctype : 'multipart/form-data',
				contentType : false,
				success : function(data) {
					$(editor).summernote("insertImage", data.url);
				}
			});
		}
		function ruleChk() {
			var length = $(".img_wrap>span").length;
			var delLen =$(".delFile").length;
			console.log(length);
			console.log(delLen);
			if(length==0 && delLen==0){
				alert("이미지는 필수입니다. 등록해 주세요");
			}else{
			next(4);				
			}
		}
		//하우스 전체적 이미지
		var sel_files = [];
		$(document).ready(function() {
			$("#input_imgs").on("change", handleImgsFilesSelect);
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
							var img_html = "<span class='file-span'><img src=\""+e.target.result+"\" style='width:80px;height:80px;'/></span>";
							$(".img_wrap").append(img_html);
						}
						reader.readAsDataURL(f);
					});
		}
		$(".delBtn").click(function () {
			var idx = $(".delBtn").index(this);
			console.log($("input	[name=delPhotoPath]").eq(idx).val());
			console.log($("input[name=delPhotoNo]").eq(idx).val());
			$(this).hide();
			$(this).prev().hide();
			$(".oldPhotoPath").eq(idx).removeAttr("name");
			$(".oldPhotoPath").eq(idx).attr({name:"delPhotoPath"});
			$(".oldPhotoNo").eq(idx).removeAttr("name");
			$(".oldPhotoNo").eq(idx).attr({name:"delPhotoNo"});
		})
		
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>