<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
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
	
	<div class="container_mate">
		<h1>헬퍼요청서</h1>
		<hr>
		<form action="/helpRequest.do" method="post"
			enctype="multipart/form-data" id="funder_add">
			<div class="add_right border_a">
				<table class="table">
					<tr class="table-active_mate center_list">
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
					<tr class="table-active_mate">
						<th>2.선호분야 사진첨부</th>
						<td>
							<div class="img-viewr">
								<img id="img-view" src="">
							</div> <label class="btn btn_sm btn_out" for="profile" style="line-height: 18px">사진첨부</label> <input
							type="file" name="profileFilepath" id="profile"
							name="helperFilepath" onchange="loadImg(this);"
							accept=".jpg,.jpeg,.png,.gif" style="display: none;">
						</td>
					</tr>
					<tr class="table-active_mate">
						<th>3.활동닉네임</th>
						<td><input type="text" name="helperName" class="input_03"
							placeholder="닉네임 입력"></td>
					</tr>
					<tr class="table-active_mate">
						<th>4.선호 시작 시간 선택</th>
						<td><span class="time"> <input type="text" name="datefilter"
								placeholder="선호시작시간" class="input_date input_04">
						</span></td>
					</tr>
					<tr class="table-active_mate">
						<th>5.선호 마감 시간 선택</th>
						<td><span class="time"> <input type="text" name="datefilter"
								placeholder="선호마감시간" class="input_date input_04">
						</span></td>
						
					</tr>
					<tr class="table-active_mate">
						<th>6.이동수단</th>
						<td>
							<div class="check_ent displayflex">
								<input type="radio"  name="helperRide" id="ride01"value="1" ><label for="ride01">자동차</label>
								<input type="radio" name="helperRide" id="ride02" value="2"><label for="ride02">오토바이</label>
								<input type="radio" name="helperRide" id="ride03" value="3"><label for="ride03">전동퀵보드</label> 
								<input type="radio" name="helperRide" id="ride04" value="4"><label for="ride04">자전거</label>
								<input type="radio"  name="helperRide" id="ride05" value="5"><label for="ride05">없음</label>
							</div>
						</td>
					</tr>
					<tr class="table-active_mate">
						<th>7.자기소개</th>
						<td><textarea name="helperIntro" class="textarea_pro"></textarea></td>
					</tr>
					<tr class="table-active_mate">
						<th>8.활동가능한 지역</th>
						<td>
                                <div class="profile_tags">
                                    <ul class="tag_list">

                                    </ul>
                                    <input type="text" name="searchTag"  id="tag" onfocus="this.placeholder=''" onblur="this.placeholder='태그와 태그는 쉼표 또는 엔터로 구분해주세요'">
                                	<input type="hidden" name="tagadd">
                                </div>
                            </td>
					</tr>
					<tr class="table-active_mate">
						<th>9.자격증 기재</th>
						<td><textarea name="helperIntro" class="textarea_pro"></textarea></td>
					</tr>
				</table>
				<div class="next_btn">
					<button class="btn btn_100" type="submit" style="line-height: 15px">작성하기</button>
				</div>
			</div>
		</form>
	</div>
	<script>
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		});
		$("#profile").change(function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$("#img-view").attr("src", data.target.result).width(400).height(400);
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		$(function() {
			// 시간
			$('input[name="datefilter"]').daterangepicker({
				timePicker : true,
				singleDatePicker : true,
				timePicker24Hour : true,
				timePickerIncrement : 1,
				locale : {
					"format" : 'HH:mm',
					"applyLabel" : "확인",
					"cancelLabel" : "취소"
				}
			}).on('show.daterangepicker', function(ev, picker) {
				picker.container.find(".calendar-table").hide();
			});
		$("#funder_add").submit(function(){
			//태그 부분
			var test = new Array();
			$(".tag_list > .tag-item").each(function(){
			    test.push(this.innerText);
			})
			//$("input[name='category']").val(category.join("/"));
			$("input[name='tagadd']").val(test.join("/"));
			//skill
			var skillname = new Array();
			var skilllevel = new Array();
			$(".skill_list > .skill_item").each(function(idx,item){
				var skilltext = $(item).find(".skill_name").text();
				skillname.push(skilltext);
				var leveltext = $(item).find("select[name='skill_lel']").val();
				skilllevel.push(leveltext);
			});
			$("input[name='skillName']").val(skillname.join("/"));
			$("input[name='skillLevel']").val(skilllevel.join("/"));
		});
		//폼 안에서 태그 엔터로 허용하기 위해서 나머지 엔터 막기
		$("form > input").keydown(function(event){
			if(event.keyCode === 13){
				event.preventDefault();
			};
		},true);
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>