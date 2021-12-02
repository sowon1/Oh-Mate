<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 달력 -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div class="container_mate">
		<form action="/helpRequest.do" method="post"
			enctype="multipart/form-data" id="funder_add">
			<div class="add_right border_a">
				<table class="table">
					<tr class="table-active">
						<th>1. 자신이 자신 있는 분야</th>
						<td>
							<div class="check_ent displayflex">
								<input type="checkbox" class="chk" name="helperCategory"
									id="fun_01" value="0"><label for="fun_01">배달·장보기</label>
								<input type="checkbox" class="chk" name="helperCategory"
									id="fun_02" value="0"><label for="fun_02">청소·집안일</label>
								<input type="checkbox" class="chk" name="helperCategory"
									id="fun_03" value="0"><label for="fun_03">설치·조립·운반</label>
								<input type="checkbox" class="chk" name="helperCategory"
									id="fun_04" value="0"><label for="fun_04">동행·돌봄</label>
							</div>
							<div class="check_ent displayflex">
								<input type="checkbox" class="chk" name="helperCategory"
									id="fun_05" value="0"><label for="fun_05">벌레·쥐
									잡기</label> <input type="checkbox" class="chk" name="helperCategory"
									id="fun_06" value="0"><label for="fun_06">역할대행</label>
								<input type="checkbox" class="chk" name="helperCategory"
									id="fun_07" value="0"><label for="fun_07">과외·알바</label>
								<input type="checkbox" class="chk" name="helperCategory"
									id="fun_08" value="0"><label for="fun_08">기타·원격</label>
								<input type="hidden" name="category">
							</div>
						</td>
					</tr>
					<tr class="table-active">
						<th>2.선호분야와 관련된 사진첨부</th>
						<td class="displayflex">
							<div class="img-viewr">
								<img id="img-view" class="profile_view"
									src="/img/img/profile.png">
							</div> <label class="btn btn_sm btn_out" for="profile">사진첨부</label> <input
							type="file" name="profileFilepath" id="profile"
							name="helperFilepath" onchange="loadImg(this);"
							accept=".jpg,.jpeg,.png,.gif" style="display: none;">
						</td>
					</tr>
					<tr class="table-active">
						<th>활동닉네임</th>
						<td><input type="text" name="helperName" class="input_03"
							placeholder="닉네임 입력"></td>
					</tr>
					<tr class="table-active">
						<th>선호 시작 시간 선택</th>
						<td><input type="text" name="datefilter"
							placeholder="여행시작일 선택" class="input_date input_04"></td>
					</tr>
					<tr class="table-active">
						<th>선호 마감 시간 선택</th>
						<td><input type="text" name="datefilter"
							placeholder="여행시작일 선택" class="input_date input_04"></td>
					</tr>
					<tr class="table-active">
						<th>이동수단</th>
						<td>
							<div class="check_ent displayflex">
								<input type="checkbox" class="chk" name="helperRide" id="fun_01"
									value="1" onclick="checkOnlyOne(this)"><label
									for="fun_01">자동차</label> <input type="checkbox" class="chk"
									name="helperRide" id="fun_02" value="2"
									onclick="checkOnlyOne(this)"><label for="fun_02">스쿠터(오토바이)</label>
								<input type="checkbox" class="chk" name="helperRide" id="fun_03"
									value="3" onclick="checkOnlyOne(this)"><label
									for="fun_03">전동퀵보드</label> <input type="checkbox" class="chk"
									name="helperRide" id="fun_04" value="4"
									onclick="checkOnlyOne(this)"><label for="fun_04">자전거</label>
								<input type="checkbox" class="chk" name="helperRide" id="fun_05"
									value="5" onclick="checkOnlyOne(this)"><label
									for="fun_05">없음</label>
							</div>
						</td>
					</tr>
					<tr class="table-active">
						<th>활동가능한 지역</th>
						<td>
							<!-- 주소검색 API -->
							<div class="postcode">
								<input type="text" id="postCode" class="input_04"
									name="addressCode" readonly placeholder="우편번호">
								<button type="button" onclick="addrSearch();" class="btn btn_sm">주소검색</button>
							</div>
							<div class="postcode">
								<input type="text" id="roadAddr" class="input_03"
									name="addressRoad" placeholder="도로명 주소" name="companyAddr">
							</div>
							<div class="postcode">
								<input type="text" id="detailAddr" class="input_03"
									placeholder="상세주소">
							</div>
						</td>
					</tr>
					<tr>개인정보 수집 동의
					</tr>
					<td>
						<div class="container border_t">
							<button id="modbtn">상새보기</button>
							<div class="modal-wrap2">
								<div class="modal2">
									<div class="modal-top2">
										<h3>개인정보 수집 및 동의</h3>
										<span id="btnclose" style="cursor: pointer;">x</span>
									</div>
									<div class="modal-content2">
										<table>
											<tr>
												<td>'oh-mate'(이하 ‘회사’라 한다)는 개인정보 보호법 제30조에 따라 정보 주체의
													개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이
													개인정보 처리지침을 수립, 공개합니다. 제1조 (개인정보의 처리목적) 회사는 다음의 목적을 위하여
													개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이
													변경되는 경우에는 개인정보보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.

													1. 홈페이지 회원 가입 및 관리 회원 가입 의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증,
													회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정 이용 방지, 만 14세 미만
													아동의 개인정보처리 시 법정대리인의 동의 여부 확인, 각종 고지․통지, 고충 처리 등을 목적으로 개인정보를
													처리합니다. 2. 재화 또는 서비스 제공 물품 배송, 서비스 제공, 계약서 및 청구서 발송, 콘텐츠 제공,
													맞춤서비스 제공, 본인인증, 연령인증, 요금 결제 및 정산, 채권추심 등을 목적으로 개인정보를 처리합니다.

													3. 고충 처리 민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리 결과 통보 등의
													목적으로 개인정보를 처리합니다. 제2조 (개인정보의 처리 및 보유기간) ① 회사는 법령에 따른 개인정보
													보유, 이용 기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유, 이용 기간 내에서
													개인정보를 처리, 보유합니다. ② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다. 1. 홈페이지
													회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴 시까지 다만, 다음의 사유에 해당하는 경우에는 해당 사유
													종료 시까지 1) 관계 법령 위반에 따른 수사, 조사 등이 진행 중인 경우에는 해당 수사, 조사 종료
													시까지 2) 홈페이지 이용에 따른 채권 및 채무관계 잔존 시에는 해당 채권, 채무 관계 정산 시까지 제3조
													(개인정보의 제3자 제공) ① 회사는 정보주체의 개인정보를 제1조(개인정보의 처리목적)에서 명시한 범위
													내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우에만
													개인정보를 제3자에게 제공합니다. ② 회사는 다음과 같이 개인정보를 제3자에게 제공하고 있습니다. -
													개인정보를 제공받는 자 : (주) 알비트, (주)써줌 - 제공받는 자의 개인정보 이용목적 : 업무제휴 및
													이벤트 공동개최 - 제공하는 개인정보 항목 : 성명, 주소, 전화번호, 이메일주소, 기타 써지니에 제출한
													서류 - 제공받는 자의 보유, 이용기간 : 써지니 어플리케이션 가입기간동안 제4조(개인정보처리의 위탁) ①
													회사는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다. 1. 전화
													상담 센터 운영 - 위탁받는 자 (수탁자) : (주)알비트 CS센터 - 위탁하는 업무의 내용 : 전화상담
													응대, 부서 및 직원 안내 등 ② 회사는 위탁계약 체결 시 개인정보 보호법 제25조에 따라 위탁업무
													수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상
													등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고
													있습니다. ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여
													공개하도록 하겠습니다. 제5조(이용자 및 법정대리인의 권리와 그 행사 방법) ① 정보주체는 회사에 대해
													언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다. 1. 개인정보 열람 요구 2. 오류
													등이 있을 경우 정정 요구 3. 삭제요구 4. 처리정지 요구 ② 제1항에 따른 권리 행사는 회사에 대해
													서면, 전화, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체없이
													조치하겠습니다. ③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 회사는 정정
													또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다. ④ 제1항에 따른 권리 행사는
													정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법
													시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다. ⑤ 정보주체는 개인정보 보호법 등 관계
													법령을 위반하여 회사가 처리하고 있는 정보주체 본인이나 타인의 개인정보 및 사생활을 침해하여서는 아니
													됩니다. 제6조(처리하는 개인정보 항목) 회사는 다음의 개인정보 항목을 처리하고 있습니다. 1. 인터넷
													서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다. IP주소, 쿠키,
													MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등 제7조(개인정보의 파기) ① 회사는 개인정보
													보유 기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를
													파기합니다. ② 정보주체로부터 동의받은 개인정보 보유 기간이 경과하거나 처리목적이 달성되었음에도 불구하고
													다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로
													옮기거나 보관장소를 달리하여 보존합니다. ③ 개인정보 파기의 절차 및 방법은 다음과 같습니다. 1. 파기
													절차 회사는 파기 사유가 발생한 개인정보를 선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를
													파기합니다. 2. 파기 방법 회사는 전자적 파일 형태로 기록․저장된 개인정보는 기록을 재생할 수 없도록
													로우레밸포멧(Low Level Format) 등의 방법을 이용하여 파기하며, 종이 문서에 기록․저장된
													개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다. 제8조(개인정보의 안전성 확보조치) 회사는 개인정보의
													안전성 확보를 위해 다음과 같은 조치를 하고 있습니다. 1. 관리적 조치 : 내부관리계획 수립 및 시행,
													정기적 직원 교육 등 2. 기술적 조치 : 개인정보처리시스템 등의 접근 권한 관리, 접근통제시스템 설치,
													고유 식별정보 등의 암호화, 보안프로그램 설치 3. 물리적 조치 : 전산실, 자료보관실 등의 접근통제

													제9조(개인정보 자동 수집 장치의 설치∙운영 및 거부에 관한 사항) ① 회사는 이용자에게 개별적인 맞춤
													서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다. ② 쿠키는
													웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에 보내는 소량의 정보이며
													이용자들의 컴퓨터 내의 하드디스크에 저장되기도 합니다. 가. 쿠키의 사용 목적: 이용자가 방문한 각
													서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게
													최적화된 정보 제공을 위해 사용됩니다. 나. 쿠키의 설치∙운영 및 거부 : 웹브라우저 상단의 도구>인터넷
													옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다. 다. 쿠키 저장을 거부할 경우
													맞춤형 서비스 이용에 어려움이 발생할 수 있습니다. 제10조(개인정보 보호책임자) ① 회사는 개인정보
													처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만 처리 및 피해구제 등을
													위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다. ▶ 개인정보 보호책임자 성명 : 박준호 직책
													: 공동창립자 연락처 : 02)2054-3016 ※ 개인정보 보호 담당부서로 연결됩니다. ▶ 개인정보 보호
													담당부서 부서명 : oh-mate 팀 담당자 : COM 연락처 : 02)2054-3017 ② 정보주체께서는
													회사의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만 처리, 피해구제 등에
													관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 정보주체의 문의에 대해
													지체없이 답변 및 처리해드릴 것입니다. 제11조(개인정보 열람청구) 정보주체는 개인정보 보호법 제35조에
													따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. 회사는 정보주체의 개인정보 열람 청구가
													신속하게 처리되도록 노력하겠습니다. ▶ 개인정보 열람청구 접수․처리 부서 부서명 : oh-mate 팀
													담당자 : COM 연락처 : 02)2054-3017 제12조(권익침해 구제 방법) 정보주체는 아래의 기관에
													대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다. ▶ 개인정보 침해신고센터
													(한국인터넷진흥원 운영) - 소관 업무 : 개인정보 침해사실 신고, 상담 신청 - 홈페이지 :
													privacy.kisa.or.kr - 전화 : (국번없이) 118 - 주소 : (58324) 전남 나주시
													진흥길 9(빛가람동 301-2) 3층 개인정보침해신고센터 ▶ 개인정보 분쟁조정위원회 - 소관업무 :
													개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결) - 홈페이지 : www.kopico.go.kr - 전화
													: (국번없이) 1833-6972 - 주소 : (03171)서울특별시 종로구 세종대로 209 정부서울청사
													4층 ▶ 대검찰청 사이버범죄수사단 : 02-3480-3573 (www.spo.go.kr) ▶ 경찰청
													사이버안전국 : 182 (http://cyberbureau.police.go.kr) 제13조(개인정보
													처리방침 시행 및 변경) 이 개인정보 처리방침은 사이트 개설일로부터 적용됩니다.</td>
											</tr>
											<tr>
												<td>
												<input type="checkbox" class="chk"id="agree" value="1"><label for="agree">개인정보 수집 및 이용에 동의 합니다.</label>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</td>
				</table>
				<div class="next_btn">
					<button class="btn btn_100" type="submit">작성하기</button>
				</div>
			</div>
		</form>
	</div>
	<script>
		$(function() {
			// 달력 한글화 
			$('input[name="datefilter"]')
					.daterangepicker(
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
									"daysOfWeek" : [ "월", "화", "수", "목", "금",
											"토", "일" ],
									"monthNames" : [ "1월", "2월", "3월", "4월",
											"5월", "6월", "7월", "8월", "9월",
											"10월", "11월", "12월" ],
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
			//모달
			$("#modbtn").click(function() {
				$(".modal-wrap2").css("display", "flex");
				$('body').css("overflow", "hidden"); //모달시 스크롤 방지
				$(".back_dark").show();
			});
			$("#btnclose").click(function() {
				$(".modal-wrap2").css("display", "none");
				$('body').css("overflow", "auto");
				$(".back_dark").hide();
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
		});
	</script>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>