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

.houseForm {
	display: none;
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
	<!-- 썸머노트 등록 -->

	<script src="/resources/summernote/summernote-lite.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<div class="container_mate">
		<div class="content">
			<form action="/houseWrite.do" id="frm" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="memberNo"
					value="${sessionScope.m.memberNo }">
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
						<input type="text" name="houseownerDeadline" id="datefilter"
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
								class="input_04" readonly="readonly" placeholder="우편번호"
								style="width: 81%">
							<button type="button" onclick="addrSearch();" class="btn btn_sm"
								style="line-height: 30px">주소검색</button>
						</div>
						<div class="postcode">
							<input type="text" id="roadAddr" class="input_03"
								placeholder="도로명 주소" name="companyAddr" readonly="readonly">
							<input type="hidden" id="addressName" name="addressName">
							<input type="hidden" id="addressRoad" name="addressRoad">
							<input type="hidden" id="addressLegal" name="addressLegal">
						</div>
						<div class="postcode">
							<input type="text" name="addressDetail" id="detailAddr"
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
					<div class="content-place" style="height: 1200px">
						<p class="ac-title">하우스 이름</p>
						<input type="text" name="houseTitle" id="houseName"
							class="input_03" placeholder="하우스이름">
						<p class="ac-title">주거형태</p>
						<p class="ac-title">보증금(대표)</p>
						<input type="text" name="houseCharge" id="houseCharge"
							class="input_03" placeholder="보증금"> <select id="HSF"
							class="control-group" name="houseForm">
							<option value="">선택</option>
							<option value="아파트">아파트</option>
							<option value="단독주택">단독주택</option>
							<option value="빌라">빌라</option>
							<option value="기타">기타</option>
						</select>
						<p class="ac-title">하우스 시설 소개</p>
						<textarea class="summernote" name="houseContent"></textarea>
						<p class="ac-title">하우스 이용규칙</p>
						<textarea class="summernote" name="houseRule"></textarea>
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
											id="fun_03" value="0"><label for="fun_03">식탁</label>
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
											id="fun_11" value="0"><label for="fun_11">커피포드</label>
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
											id="fun_17" value="0"><label for="fun_17">비데</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_18" value="0"><label for="fun_18">의자</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_19" value="0"><label for="fun_19">인터넷시설</label>
									</div>
								</td>
							</tr>
							<tr>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_20" value="0"><label for="fun_20">엘레베이터</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_21" value="0"><label for="fun_21">보안</label>
									</div>
								</td>
								<td class="find">
									<div class="check_ent displayflex" style="text-align: left;">
										<input type="checkbox" class="chk" name="funderCategory"
											id="fun_22" value="0"><label for="fun_22">청소</label>
									</div>
								</td>
							</tr>
						</table>
						<input type="hidden" id="houseConvenience" name="houseConvenience">
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
						<div class="check_ent displayflex" id="chkGender"
							style="text-align: center;">
							<input type="checkbox" class="chk" name="funderCategory"
								id="gender1" value="1" onclick="checkOnlyOne(this)"><label
								for="gender1">남성전용</label> <input type="checkbox" class="chk"
								name="funderCategory" id="gender2" value="2"
								onclick="checkOnlyOne(this)"><label for="gender2">여성전용</label>
							<input type="checkbox" class="chk" name="funderCategory"
								id="gender3" value="3" onclick="checkOnlyOne(this)"><label
								for="gender3">남녀공용</label>
						</div>
					</div>
					<div class="button-place">
						<a class="btn btn_out" style="line-height: 30px;"
							onclick="backIntro()">이전</a> <a class="btn"
							style="line-height: 30px" onclick="chkRoom()">다음</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script>
	//input 값변경
		
	$(".find>div>input").change(function() {
		if($(this).is(":checked")){
			$(this).val("1");
			$("#houseConvenience").val($("#fun_00").val()+$("#fun_01").val()+$("#fun_02").val()+$("#fun_03").val()+$("#fun_04").val()+$("#fun_05").val()+$("#fun_06").val()+
					$("#fun_07").val()+$("#fun_08").val()+$("#fun_09").val()+$("#fun_10").val()+$("#fun_11").val()+$("#fun_12").val()+$("#fun_13").val()+$("#fun_14").val()+
					$("#fun_15").val()+$("#fun_16").val()+$("#fun_17").val()+$("#fun_18").val()+$("#fun_19").val()+$("#fun_20").val()+$("#fun_21").val()+$("#fun_22").val());	
			console.log($(this).val());
			console.log($("#houseConvenience").val());
		}else{
			$(this).val("0");
			$("#houseConvenience").val($("#fun_00").val()+$("#fun_01").val()+$("#fun_02").val()+$("#fun_03").val()+$("#fun_04").val()+$("#fun_05").val()+$("#fun_06").val()+
					$("#fun_07").val()+$("#fun_08").val()+$("#fun_09").val()+$("#fun_10").val()+$("#fun_11").val()+$("#fun_12").val()+$("#fun_13").val()+$("#fun_14").val()+
					$("#fun_15").val()+$("#fun_16").val()+$("#fun_17").val()+$("#fun_18").val()+$("#fun_19").val()+$("#fun_20").val()+$("#fun_21").val()+$("#fun_22").val());	
			console.log($(this).val());
			console.log($("#houseConvenience").val());
		}
	});	
	//체크박스 1개만 선택하도록
	function checkOnlyOne(target) {
	    document.querySelectorAll('#chkGender>input[type=checkbox]').forEach(el => el.checked = false);			
	    target.checked = true;
	}
	//오늘날짜 yyyy-mm-dd
	function getToday(){
	    var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);

	    return year + "-" + month + "-" + day;
	}
		// 달력 한글화 
		$('#datefilter').daterangepicker(
				{	
					 minDate: getToday(),
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
		function backCondition() {
			next(4);
		}
		function chkRoom() {
			var houseRoom = $("#houseRoom").val();
			// 추가해야됨 제공편의시설 하나라도 체크하면 넘어가게(월요일 선생님에게 문의)
			if (houseRoom != "" && $("#chkGender input[type=checkbox]:checked").length == 1) {
				$("#frm").submit();
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
		            document.querySelector("#addressName").value =  data.sigungu;
		            document.querySelector("#addressRoad").value =  data.roadname;
		            document.querySelector("#addressLegal").value =  data.bname2;
		        }
		    }).open();
		}
		//썸머노트(파일업로드 문제)
		$(".summernote").summernote({
			height: 300,
			 maxHeight: 300,             // 최대 높이
			lang: "ko-KR",
				callbacks:{
				onImageUpload : function(files){
					houseUploadImage(files[0],this);
				}
			}
			
		});
		//이미지가 제대로 안올라간다.
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
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>