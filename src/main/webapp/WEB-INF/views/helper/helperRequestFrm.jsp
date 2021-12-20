<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<style>
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
.ac-title {
	text-align: left;
	font-size: 16px;
	color: #847E78;
	margin: 5px;
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
		<h4 class="form-title point_title" style="margin-bottom: 15px;">헬퍼 등록 요청서</h4>
		<form action="/helpRequest.do" method="post"
			enctype="multipart/form-data" id="funder_add">
			<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
			<div class="add_right border_a">
				<table class="table" style="padding: 15px;">
					<tr class="table-active_mate center_list">
						<th>1. 자신이 자신 있는 분야</th>
						<td>
							<div class="check_ent displayflex" style="text-align: left;">
								<input type="checkbox" class="chk" name="funderCategory"
									id="fun_00" value="0"><label for="fun_00"
									style="width: 140px">배달·장보기</label> <input type="checkbox"
									class="chk" name="funderCategory" id="fun_01" value="0"><label
									for="fun_01" style="width: 140px">청소·집안일</label> <input
									type="checkbox" class="chk" name="funderCategory" id="fun_02"
									value="0"><label for="fun_02" style="width: 140px">설치·조립·운반</label>
								<input type="checkbox" class="chk" name="funderCategory"
									id="fun_03" value="0"><label for="fun_03"
									style="width: 140px">동행·돌봄</label>
							</div>
							<div class="check_ent displayflex" style="text-align: left;">
								<input type="checkbox" class="chk" name="funderCategory"
									id="fun_04" value="0"><label for="fun_04"
									style="width: 140px">벌레·쥐</label> <input type="checkbox"
									class="chk" name="funderCategory" id="fun_05" value="0"><label
									for="fun_05" style="width: 140px">역할대행</label> <input
									type="checkbox" class="chk" name="funderCategory" id="fun_06"
									value="0"><label for="fun_06" style="width: 140px">과외·알바</label>
								<input type="checkbox" class="chk" name="funderCategory"
									id="fun_07" value="0"><label for="fun_07"
									style="width: 140px">기타·원격</label>
							</div> <input type="hidden" id="helperCategory" name="helperCategory">
							
						</td>
					</tr>
					<tr class="table-active_mate">
						<th>2.프로필 사진 첨부</th>
						<td>
							<p class="ac-title">가장 자신있는 프로필 사진을 넣어주세요(필수)</p>
							<div class="img-viewr">
								<img id="img-view" src="">
							</div> <label class="btn btn_sm btn_out" for="profile"
							style="line-height: 18px">사진첨부</label> <input type="file"
							id="profile" name="upfile"
							onchange="loadImg(this);" accept=".jpg,.jpeg,.png,.gif"
							style="display: none;">
						</td>
					</tr>
					<tr class="table-active_mate">
						<th>3.활동닉네임</th>
						<td><input type="text" name="helperName" class="input_03"
							placeholder="닉네임 입력" " style="width: 300px;"></td>
							<td id="idChk"></td>
						
					</tr>
					<tr class="table-active_mate">
						<th>4.선호 시작 시간 선택</th>
						<td><span class="time"> <input type="text" class="timeform"
								name="helperStartTime"
								class="input_date input_04">
						</span></td>
					</tr>
					<tr class="table-active_mate">
						<th>5.선호 마감 시간 선택</th>
						<td><span class="time"> <input class="timeform" type="text"
								name="helperEndTime"
								class="input_date input_04">
						</span></td>

					</tr>
					<tr class="table-active_mate">
						<th>6.이동수단</th>
						<td>
							<input type="radio" name="helperRide" id="ride01"
							value="1"><label for="ride01" >자동차</label> 
							<input
							type="radio" name="helperRide" id="ride02" value="2"><label
							for="ride02">오토바이</label> 
							<input type="radio" name="helperRide"
							id="ride03" value="3"><label for="ride03">전동퀵보드</label> 
							<input
							type="radio" name="helperRide" id="ride04" value="4"><label
							for="ride04">자전거</label> <input type="radio" name="helperRide"
							id="ride05" value="5" checked="checked"><label for="ride05">없음</label></td>
					</tr>
					<tr class="table-active_mate">
						<th>7.자기소개</th>
						<td><textarea name="helperIntro" class="summernote"></textarea></td>
					</tr>
					<tr class="table-active_mate">
						<th>8.활동가능한 지역)</th>
						<td>
							<p>※꼭 주소 등록후 엔터 칠것 (최대3개지점만 등록할것)</p>
							<div class="address">

							</div>
							<div class="profile_tags">
								<ul class="tag_list">

								</ul>
								<input type="text" name="searchTag" id="tag"
									onfocus="this.placeholder=''"
									onblur="this.placeholder='등록후 엔터'" read> <input
									type="hidden" name="tagadd">
							</div>
							<div class="postcode">
								<button type="button" class="btn btn_sm"
									style="line-height: 30px; width: 100%" id="addressBtn">주소검색</button>
							</div>
						</td>
					</tr>
					<tr class="table-active_mate">
						<th>9.자격증 기재</th>
						<td><textarea name="helperCredit" class="summernote"></textarea></td>
					</tr>
					<tr class="table-active_mate">
						<th>10.계좌 입력</th>
						<td>
							<select id="bank" class="control-group" name="incomeBank">
							<option value="">선택</option>
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
						</td>
					</tr>
				</table>
				<div class="next_btn">
					<button class="btn btn_100" type="submit" style="line-height: 15px" id="subbtn"onclick="return chkForm();">작성하기</button>
				</div>
			</div>
		</form>
	</div>
	<script>
	var count =0;
	//카테고리 설정(00000000);
	$(".chk").change(function () {
		if($(this).is(":checked")){
			$(this).val(1);
			$("#helperCategory").val($("#fun_00").val()+$("#fun_01").val()+$("#fun_02").val()
				+$("#fun_03").val()+$("#fun_04").val()+$("#fun_05").val()+$("#fun_06").val()+$("#fun_07").val()	);
		}else{
			$(this).val(0);
			$("#helperCategory").val($("#fun_00").val()+$("#fun_01").val()+$("#fun_02").val()
					+$("#fun_03").val()+$("#fun_04").val()+$("#fun_05").val()+$("#fun_06").val()+$("#fun_07").val()	);
		}

	});
	$("form input").keydown(function(event){
		if(event.keyCode === 13){
			event.preventDefault();
		};
	});
		$("#profile").change(function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$("#img-view").attr("src", data.target.result).width(200).height(200);
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		$(function() {
			// 시간
			$('.timeform').daterangepicker({
				timePicker : true,
				singleDatePicker : true,
				timePicker24Hour : true,
				timePickerIncrement : 30,
				locale : {
					"format" : 'HH:mm',
					"applyLabel" : "확인",
					"cancelLabel" : "취소"
				}
			}).on('show.daterangepicker', function(ev, picker) {
				picker.container.find(".calendar-table").hide();
			});
		});
		 //태그
		 $(function () {
	            var tag = {};
	            var counter = 0;
	            // 태그 추가
	            function addTag(value) {
	            tag[counter] = value; // 태그 Object 안에 추가
	            counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 
	            }
	            $("#tag").on("keyup", function (e) {
	                var self = $(this);
	                // input 에 focus 되있을 때 쉼표 및 엔터 입력시 구동
	                if (e.key === "Enter" || e.keyCode === 188) {
	                var tagValue = self.val(); // 값 가져오기
	                tagValue = tagValue.replace(",", "");
	                if (tagValue !== "") {
	                    // 같은 태그가 있는지 검사. 있다면 해당값이 array 로 return 
	                    var result = Object.values(tag)
	                    .filter(function (word) {
	                        return word === tagValue;
	                    })
	                    // 태그 중복 검사
	                    if (result.length == 0) {
	                    	
	                    $(".tag_list")
	                        .append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'><img src='/resources/img/icon/close.png'></span></li>");
	                    addTag(tagValue);
	                    self.val("");
	                    } else {
	                    	alert("중복된 주소입니다.");
	                        $(".addresswrap").last().remove();
	                        count--;
	                        console.log(count);
	                        $("#tag").val("");
	                    }
	                }
	                e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
	                }
	            });
	            // 삭제 버튼 - 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현
	            $(document).on("click", ".del-btn", function (e) {
	                var index = $(this)
	                .attr("idx");
	                tag[index] = "";
	                $(this).parent().remove();
	                $(".addresswrap").remove();
	            });
	        });
			//체크박스 1개만 선택하도록
			function checkOnlyOne(target) {
			    document.querySelectorAll('input[type=checkbox]')
			    .forEach(el => el.checked = false);			
			    target.checked = true;
			}
           //스킬
			 $(function () {
			    var skill = {};
			    var skillcounter = 0;
			    // 태그 추가
			    function addskill(value) {
			    skill[skillcounter] = value; // 태그 Object 안에 추가
			    skillcounter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 
			    }
			    $("#skill_add").on("keyup", function (e) {
			        var skillself = $(this);
			        // input 에 focus 되있을 때 쉼표 및 엔터 입력시 구동
			        if (e.key === "Enter" || e.keyCode === 188) {
			        var skillValue = skillself.val(); // 값 가져오기
			        skillValue = skillValue.replace(",", "");
			        if (skillValue !== "") {
			            // 같은 태그가 있는지 검사. 있다면 해당값이 array 로 return 
			            var result = Object.values(skill)
			            .filter(function (word) {
			                return word === skillValue;
			            })
			            // 태그 중복 검사
			            if (result.length == 0) {
			            $(".skill_list")
			                .append("<li class='skill_item'> <h2 class='skill_name'>"+ skillValue +"</h2><select name='skill_lel'><option value='셀렉트박스1'>셀렉트박스1</option><option value='셀렉트박스2'>셀렉트박스2</option></select>"+"<span class='del_skill' idx='" + skillcounter + "'><img src='/resources/img/icon/close.png'></span></li>");
			            addskill(skillValue);
			            skillself.val("");
			            } else {
			                $("#skill_add").val("이미 추가되어있는 스킬입니다.");
			            }
			            $(".profile_skill").css("display","block");
			        }
			        e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
			        }
			    });
			    // 삭제 버튼 - 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현
			    $(document).on("click", ".del_skill", function (e) {
			        var index = $(this)
			        .attr("idx");
			        skill[index] = "";
			        $(this)
			        .parent()
			        .remove();
			        $(".address").eq(index).remove();
			    });
			});
			//컨트롤러 제출할때 값 넘기는거
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
			//썸머노트(파일업로드 문제)
			$(".summernote").summernote({
				height : 250,
				maxHeight : 250, // 최대 높이
				lang : "ko-KR",
				callbacks : {
					onImageUpload : function(files) {
						for (var i = 0; i < files.length; i++) {
							helperUploadImage(files[i], this);
						}
					}
				}

			});
			//ajax이용 이미지 업로드
			function helperUploadImage(file, editor) {
				var form = new FormData();
				form.append("file", file);
				$.ajax({
					url : "/helperUploadImage.do",
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
			$("#addressBtn").click(function () {
				if($("#tag").val()==""){
				if($("input[name='addressCode']").length == 3){
					alert("선호 주소가 3개 초과입니다. ")
				}else{
					var address = $(".address")
					var addressCode = "<input type='hidden' name='addressCode'>"
					var addressName = "<input type='hidden' name='addressName'>"
					var addressRoad = "<input type='hidden' name='addressRoad'>"
					var addressLegal = "<input type='hidden' name='addressLegal'>"
					 var addressDetail = "<input type='hidden' name='addressDetail' value='헬퍼주소등록'>"
					 var addresswrap= "<div class='addresswrap'>"+addressCode+addressName+addressRoad+addressLegal+addressDetail+"</div>";
					new daum.Postcode(
							{
								oncomplete : function(data) {
									address.append(addresswrap);	
									document.querySelectorAll("input[name='addressCode']")[count].value = data.zonecode;
									document.querySelectorAll("input[name='addressName']")[count].value = data.sigungu;
									document.querySelectorAll("input[name='addressRoad']")[count].value = data.roadname;
									document.querySelectorAll("input[name='addressLegal']")[count].value = data.bname2;
									document.querySelector("#tag").value = data.address;
								count++;
								console.log(count);
								}
							}).open();
				}
				}else{
					alert("엔터를 쳐주세요!!");
				}
			});
			//아이디 중복확인
			$("input[name=helperName]").keyup(function () {
				var helperName = $(this).val();
				$.ajax({
					url : "/idCheck.do",
					data: {helperName:helperName},
					success:function(data){
						if(data ==1){
							$("#idChk").html("사용가능한 닉네임 입니다.");
							$("#idChk").css("color","blue");
							$("#subbtn").css("display","block");
						}else{
							$("#idChk").html("이미 사용중인 닉네임입니다.");
							$("#idChk").css("color","red");
							$("#subbtn").css("display","none");
						}
					}
				});
				if(helperName ==""){
					$("#idChk").html("");
				}
			})
		 	function chkForm() {
				if($("#helperCategory").val()==00000000){
					alert("분야를 하나라도 선택하셔야합니다.");
					return false;
				}else{
					if($("input[name='helperName']").val()==""){
						alert("닉네임을 적어주세요");
						return false;
					}else{
						if($("input[name='helperStartTime']").val()>=$("input[name='helperEndTime']").val()){
							alert("시작날짜와 마감날짜를 다르게 적용해주세요");
							return false;
						}else{
							if($("input[name='helperRide']").val()==0){
								alert("이동수단을 적용해주세요");
								return false;
							}else{
								if($("textarea[name='helperIntro']").val()==""){
									alert("자기소개를 적어주세요");
									return false;
								}else{
									if($(".tag-item").length==0){
										alert("활동가능한 지역에서 엔터를 쳐서 관리해주세요");
										return false;
									}else{
										if($("#bank").val()=="" && $("#number").val()=="" && $("#name").val()=="" ){
											alert("계좌입력을 확인해주세요")
											return false;
										}else{
											var chkAccount =/[0-9]/;
											var chkMin=/[-]/;
											if(chkAccount.test($("#number").val())&&chkMin.test($("#number").val())){
												return true;
											}else{
												alert("계좌번호를 입력해주세요");
												return false;
											}
										}
									}
								}
							}
						}
					}
				}
			} 
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>