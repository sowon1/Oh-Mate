var cate = ['배달·장보기', '청소·집안일', '설치·조립·운반', '동행·돌봄', '벌레·쥐', '역할 대행', '과외·알바', '기타·원격'];
var val = $("[name=helperRefuse]").val();
$(function(){
	for(var i=0;i<cate.length;i++){
		var li = $("<li>");	
		var input = $("<input class='form-check-input' type='checkbox' disabled>");
		var label = $("<label class='form-check-label'>");
		li.append(input);
		li.append(label);
		$("#cate").append(li);
		$("#cate label").eq(i).html(cate[i]);
		if($("#category").val().charAt(i) == 1){
			$("#cate [type=checkbox]").eq(i).prop("checked",true);
		}
	}
	$(".form-select>option").eq($("#status").val()-1).prop("selected",true);
	$(".noAllow").hide();
	var select = $(".form-select");
	if(select.val() == 3 || select.val() == 4){
		noAllow();
		$(".form-select, .btnBox>input").prop("disabled",true);
		if(select.val() == 4){
			$(".form-select, .btnBox>input").prop("disabled",false);
		}
	}else if(select.val() == 1 || select.val() == 2){
		$(".form-select>option").last().remove();
	}
});
$(".btnBox>button").click(function(){
	history.go(-1);
});
$(".form-select").change(function(){
	$(".noAllow").hide();
	if($(this).val() == 3){
		noAllow();
		$("[name=helperRefuse]").prop("disabled",false);
		$("[name=helperRefuse]").val("");
		$("[name=helperRefuse]").focus();
	}else if($(this).val() == 4){
		noAllow();
		$("[name=helperRefuse]").val(val);
	}
});
$(".btnBox [type=submit]").click(function(){
	console.log("d");
	if($("option:selected").val() == 1 || $("option:selected").val() == 4){
		alert("승인 또는 미승인으로 처리하세요.");
		return false;
	}else if($("option:selected").val() == 3 && $("[name=helperRefuse]").val() == ""){
		alert("미승인 사유를 입력하세요.");
		$("[name=helperRefuse]").focus();
		return false;
	}
});
function noAllow(){
	$(".noAllow").show();
	$("[name=helperRefuse]").prop("disabled",true);
}