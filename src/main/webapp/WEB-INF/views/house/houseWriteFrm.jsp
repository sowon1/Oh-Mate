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
	width: 600px;
	margin: 0 auto;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #9F9F9F;
	border-radius: 5px;
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

.houseForm {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script src="/resources/summernote/jquery-3.3.1.js"></script>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	
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
				<div class="houseForm" style="display: block;">
					<h4 class="form-title">정산받을 계좌를 입력해주세요</h4>
					<div class="content-place">
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
						<input type="text" id="number" name="incomeAccount"
							class="input_03" placeholder="하이달(-)과 같이 기제해주세요">
						<p class="ac-title">예금주</p>
						<input type="text" id="name" name="incomeName" class="input_03">
					</div>
					<div class="button-place">
						<button class="btn btn_w" type="button" style="line-height: 30px;"
							id="accountcomplate" onclick="accountChk()">선택완료</button>
					</div>
				</div>
				<div class="houseForm">
					<h4 class="form-title">소개가 끝나는 날짜를 정해주세요</h4>
					<div class="content-place">
						<input type="text" name="houseownerDeadLine" id="datefilter"
							class="input_date input_04" style="width: 100%;"
							readonly="readonly">
					</div>
					<div class="button-place">
						<button class="btn btn_w" type="button" style="line-height: 30px;"
							onclick="dateChk()">선택완료</button>
					</div>
				</div>
				<div class="houseForm">
					<h4 class="form-title">위치정보 입력</h4>
					<div class="content-place">
						<div class="postcode">
							<input type="text" id="postCode" name="addressCode"
								class="input_04" readonly placeholder="우편번호" style="width: 81%">
							<button type="button" onclick="addrSearch();" class="btn btn_sm"
								style="line-height: 30px" >주소검색</button>
						</div>
						<div class="postcode">
							<input type="text" id="roadAddr" class="input_03"
								placeholder="도로명 주소" name="companyAddr"> <input
								type="hidden" name="addressName"> <input type="hidden"
								name="addressRoad"> <input type="hidden"
								name="addressLegal">
						</div>
						<div class="postcode">
							<input type="text" name="houseTitle" id="detailAddr"
								class="input_03" placeholder="상세주소">
						</div>
					</div>
					<div class="button-place">
						<a class="btn btn_out" style="line-height: 30px;"
							onclick="backdate()">이전</a> <a class="btn"
							style="line-height: 30px" onclick="chkAddr()">다음</a>
					</div>
				</div>
				<div class="houseForm">
					<h4 class="form-title">집정보 입력</h4>
					<div class="content-place" style="height: 500px">
						<p class="ac-title">하우스 이름</p>
						<input type="text" name="houseTitle" id="houseName"
							class="input_03" placeholder="하우스이름">
						<p class="ac-title">주거형태</p>
						<select id="HSF" class="control-group" name="houseForm">
							<option value="">선택</option>
							<option value="아파트">아파트</option>
							<option value="단독주택">단독주택</option>
							<option value="빌라">빌라</option>
							<option value="기타">기타</option>
						</select>
						<p class="ac-title">하우스 시설 소개</p>
						<textarea id="summernote" name="houseContent"></textarea>
					</div>
					<div class="button-place">
						<a class="btn btn_out" style="line-height: 30px;"
							onclick="backAddr()">이전</a> <a class="btn"
							style="line-height: 30px" onclick="introChk()">다음</a>
					</div>
				</div>
				<div class="houseForm">
					<h4 class="form-title">집정보 입력</h4>
					<div class="content-place" style="height: 400px">
						<p class="ac-title">제공편의시설</p>
						<table>
							<tr>
								<td>
									<div class="check_ent displayflex">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_00" value="텔레비젼"><label for="fun_00">텔레비젼</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_01" value="냉장고"><label for="fun_01">냉장고</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_02" value="밥솥"><label for="fun_02">밥솥</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_03" value="식탁"><label for="fun_03">식탁</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_04" value="토스트기"><label for="fun_04">토스트기</label>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="check_ent displayflex">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_06" value="쇼파"><label for="fun_06">쇼파</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_07" value="가스렌지"><label for="fun_07">가스렌지</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_08" value="전자랜지"><label for="fun_08">전자렌지</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_09" value="세탁기"><label for="fun_09">세탁기</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_10" value="정수기"><label for="fun_10">정수기</label>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="check_ent displayflex">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_11" value="청소기"><label for="fun_11">청소기</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_12" value="커피포드"><label for="fun_12">커피포드</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_13" value="에어컨"><label for="fun_13">에어컨</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_14" value="건조기"><label for="fun_14">건조기</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_15" value="건조대"><label for="fun_15">건조대</label>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="check_ent displayflex">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_16" value="침대"><label for="fun_16">침대</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_17" value="책상"><label for="fun_17">서랍</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_18" value="옷장"><label for="fun_18">옷장</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_19" value="비데"><label for="fun_19">비데</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_20" value="의자"><label for="fun_20">의자</label>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="check_ent displayflex">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_21" value="인터냇TV"><label for="fun_21">인터넷TV</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_22" value="엘레베이터"><label for="fun_22">엘레베이터</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_23" value="보안"><label for="fun_23">보안</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_24" value="청소"><label for="fun_24">청소</label>
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_25" value="WIFI"><label for="fun_25">WIFI</label>
									</div>
								</td>
							</tr>
						</table>
						<input type="hidden" name="houseConvenience">
						<p class="ac-title">방 최대갯수(필수)</p>
						<select id="houseRoom" name="houseRoom">
							<option value="">선택</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select>
						<p class="ac-title">지정성별</p>
						<div class="check_ent displayflex" style="text-align: center;">
							<input type="checkbox" class="chk" name="funderCategory"
								id="gender1" value="1" onclick="checkOnlyOne(this)"><label for="gender1" >남성전용</label>
							<input type="checkbox" class="chk" name="funderCategory"
								id="gender2" value="2" onclick="checkOnlyOne(this)"><label for="gender2">여성전용</label>
							<input type="checkbox" class="chk" name="funderCategory"
								id="gender3" value="3" onclick="checkOnlyOne(this)"><label for="gender3">남녀공용</label>
						</div>
					</div>
					<div class="button-place">
						<a class="btn btn_out" style="line-height: 30px;"
							onclick="backIntro()">이전</a> <a class="btn"
							style="line-height: 30px" onclick="chkRoom()">다음</a>
					</div>
				</div>
				<div class="houseForm">
					<h4 class="form-title">방추가하기</h4>
					<div class="content-place"></div>
					<div class="button-place">
						<a class="btn btn_out" style="line-height: 30px;">이전</a> <a
							class="btn" style="line-height: 30px">다음</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script>
	//체크박스 1개만 선택하도록
	function checkOnlyOne(target) {
	    document.querySelectorAll('input[type=checkbox]')
	    .forEach(el => el.checked = false);			
	    target.checked = true;
	}
		// 달력 한글화 
		$('#datefilter').daterangepicker(
				{
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
						"daysOfWeek" : [ "월", "화", "수", "목", "금", "토", "일" ],
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
			var roadCode = $("roadCode").val();
			var detailAddr = $("detailAddr").val();
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
			if (HSF != "" && houseName != "") {
				next(4);
			} else {
				alert("제목 및 주거형태를 확인해주세요");
			}
		}
		function backIntro() {
			next(3);
		}
		function chkRoom() {
			var houseRoom = $("#houseRoom").val();
			// 추가해야됨 제공편의시설 하나라도 체크하면 넘어가게(월요일 선생님에게 문의)
			if (houseRoom != "") {
				next(5);
			} else {
				alert("방개수 및 제공 편의시설을 확인해주세요");
			}
		}
		//카카오 주소
		function addrSearch(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        	
		        	document.querySelector("#postCode").value = data.zonecode;
		            document.querySelector("#roadAddr").value =  data.address;
		        }
		    }).open();
		}
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>