$("[type=file]").change(function(){
	var files = $(this)[0].files;
	if(files.length != 0){
		var extention = files[0].name.substring(files[0].name.lastIndexOf('.')+1, files[0].name.length);
		if(extention == 'png' || extention == 'jpg' || extention == 'jpeg' || extention == 'gif'){
			var reader = new FileReader();
			reader.readAsDataURL(files[0]);
			reader.onload = function(e){
				$("#img-view").attr("src", e.target.result);
			}
		}else{
			alert("[ png / jpg / jpeg / gif ] 확장자 파일로 업로드 가능합니다.");
		}
	}
});
$("[type=button]").click(function(){
	history.go(-1);
});
$(".container_mate [type=submit]").click(function(){
	if($(".table-active_mate [name=memberPw]").val() == ""){
		alert("비밀번호를 입력하세요.");
		return false;
	}else if($("[name=memberName]").val() == ""){
		alert("이름을 입력하세요.");
		return false;
	}else if($("[name=phone]").val() == ""){
		alert("전화번호를 입력하세요.");
		return false;
	}else if($("[name=phone]").next().html() != ""){
		alert("전화번호를 올바르게 입력하세요.");
		return false;
	}
});
$("[name=phone]").change(function(){
	$(this).next().html("");
	var reg = /^010-\d{4}-\d{4}$/;
	if(!reg.test($(this).val())){
		$(this).next().html("010-0000-0000 형식으로 입력하세요.");
	}
});
//프로필 지역구 선택 option 배열
var local = [
	'강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구',
	'마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구'
];
$(function(){
	//페이지 로드 후 지역구 선택 option의 value, html 설정
	for(var i=0;i<local.length;i++){
		var option = $("<option>");
		option.attr("value",i+1);
		option.html(local[i]);
		$("select").append(option);
	}
});
//프로필 모달 외 영역 클릭 시 모달 닫기
$("#modal_profile").click(function(e){
    var eTarget = e.target
    if(eTarget.classList[0] == ("modal_profile")) {
    	modalClose();
    }
});
function modalShow(){
	$("#modal_profile").css("display","flex");
}
function modalClose(){
	$("#modal_profile").hide();
	$(".modal_profile_content .select [type=radio]").prop("checked",false);
	$("option").prop("selected",false);
}
$(".modal_profile_close").click(function(){
	modalClose();
});
//해당 회원의 프로필이 등록된 상태인 경우 동작, 프로필 조회 후 모달 내부 요소들 변경해서 띄우기
function profileMgrModal(){
	$.ajax({
		url: "/adminSelectProfile.do",
		data: {memberId:$(".container_mate [name=memberId]").val()},
		success:function(data){
			$(".modal_profile_title>h3").html("프로필 관리");
			$("[name=pGender]").eq([data.pGender-1]).prop("checked",true);
			$("[name=pAge]").eq([data.pAge-1]).prop("checked",true);
			$("[name=pSmoke]").eq([data.pSmoke-1]).prop("checked",true);
			$("[name=pPet]").eq([data.pPet-1]).prop("checked",true);
			$("[name=pCleaning]").eq([data.pCleaning-1]).prop("checked",true);
			$("[name=pPattern]").eq([data.pPattern-1]).prop("checked",true);
			$(".n").remove();
			$("option").each(function(index, item){
				if($(item).val() == data.pLocal){
					$(item).prop("selected",true);
				} 
			});
			$(".modal_profile_content .btnBox").empty();
			$(".modal_profile_content .btnBox").append('<button type="button" class="btn btn_out" id="updateBtn">수정</button');
			$(".modal_profile_content .btnBox").append('<button type="button" class="btn btn_out" id="deleteBtn">삭제</button');
			modalShow();
		}
	});
}
$(document).on("click","#updateBtn",function(){
	var form = $("[name=profileFrm]");
	form.attr("action","/adminUpdateProfile.do");
	form.submit();
});
$(document).on("click","#deleteBtn",function(){
	if(confirm("프로필을 삭제하시겠습니까?")){
		var form = $("[name=profileFrm]");
		form.attr("action","/adminDeleteProfile.do");
		form.submit();		
	}
});
//프로필 등록 시 모든 항목 선택 여부 체크
$(".modal_profile_content [type=submit]").click(function(){
	if(!$("option").not(".n").is(":selected") || !$("[name=pGender]").is(":checked") || !$("[name=pAge]").is(":checked") ||
			!$("[name=pSmoke]").is(":checked") || !$("[name=pPet]").is(":checked") || !$("[name=pCleaning]").is(":checked") ||
			!$("[name=pPattern]").is(":checked")){
		alert("모든 정보를 선택해야 등록 가능합니다.");
		return false;			
	}
});