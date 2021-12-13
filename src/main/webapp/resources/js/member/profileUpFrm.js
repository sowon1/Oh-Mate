	
	//지역구 선택 옵션
	var PLocal = ['강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구',
	'동작구', '마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구'];
	
$(function(){
	for(var i=0; i<PLocal.length; i++){
		var option = $("<option>");
		option.attr("value",i+1);
		option.html(PLocal[i]);
		$("#pLocal2").append(option);
	}
	var local = $("[name=pLocalVal]").val();
	$('select.pLocal option[value=' + local + ']').attr('selected', 'selected');
			
	//프로필 삭제
	$("#profilesubmit2").click(function(){
		var memberId = $("[name=pWriter]").val();
		var confirmAl = confirm("프로필 삭제하시겠습니까?");
		if(confirmAl == true){
			location.href="/deleteProfile.do?memberId="+memberId;
		}else{
			alert("프로필 삭제 취소");
		}
	});	
	
	//프로필 등록 모두선택
	$("#profilesubmit").click(function(){
		if(!$("option").not("#sel").is(":selected")){
			alert('선호 지역을 선택해주세요.');
			return false;
		}else if(!$("[name=pGender]").is(":checked")){
			alert('선호 성별을 선택해주세요.');
			return false;
		}else if(!$("[name=pAge]").is(":checked")){
			alert('선호 나이를 선택해주세요.');
			return false;
		}else if(!$("[name=pSmoke]").is(":checked")){
			alert('흡연 여부를 선택해주세요.');
			return false;
		}else if(!$("[name=pPet]").is(":checked")){
			alert('반려동물 여부를 선택해주세요.');
			return false;
		}else if(!$("[name=pCleaning]").is(":checked")){
			alert('청소 여부를 선택해주세요.');
			return false;
		}else if(!$("[name=pPattern]").is(":checked")){
			alert('생활패턴을 선택해주세요.');
			return false;
		}else{
			return true;
		}
	});
	
	//프로필 수정 모두선택
	$("#profilesubmit1").click(function(){
		if(!$("option").not("#sel").is(":selected")){
			alert('선호 지역을 선택해주세요.');
			return false;
		}else if(!$("[name=pGender]").is(":checked")){
			alert('선호 성별을 선택해주세요.');
			return false;
		}else if(!$("[name=pAge]").is(":checked")){
			alert('선호 나이를 선택해주세요.');
			return false;
		}else if(!$("[name=pSmoke]").is(":checked")){
			alert('흡연 여부를 선택해주세요.');
			return false;
		}else if(!$("[name=pPet]").is(":checked")){
			alert('반려동물 여부를 선택해주세요.');
			return false;
		}else if(!$("[name=pCleaning]").is(":checked")){
			alert('청소 여부를 선택해주세요.');
			return false;
		}else if(!$("[name=pPattern]").is(":checked")){
			alert('생활패턴을 선택해주세요.');
			return false;
		}else{
			return true;
		}
	});
	
});
	
	
	
	
	