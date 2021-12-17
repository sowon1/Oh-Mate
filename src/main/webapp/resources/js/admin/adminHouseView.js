var houseOption = ['TV', '냉장고', '밥솥', '책상', '토스트기', '소파', '가스레인지', '전자레인지', '세탁기', '정수기', '청소기',
					'커피포트', '에어컨', '건조 시설', '침대', '서랍', '옷장', '의자', '인터넷 시설', '엘리베이터', '보안'];
$(function(){
	for(var i=0;i<houseOption.length/7;i++){
		var tr = $("<tr>");
		for(var j=0;j<houseOption.length/3;j++){
			var td = $("<td>");
			var input = $("<input class='form-check-input' type='checkbox' disabled>");
			var label = $("<label class='form-check-label'>");
			td.append(input);
			td.append(label);
			tr.append(td);
			$(".chkTbl>tbody").append(tr);
		}
	}
	for(var i=0;i<houseOption.length;i++){
		$(".chkTbl label").eq(i).html(houseOption[i]);
		if($("#houseOption").val().charAt(i) == 1){
			$(".chkTbl [type=checkbox]").eq(i).prop("checked",true);
		}
	}
	$("#tbl2 .form-select>option").eq($("#houseAllow").val()-1).prop("selected",true);
	$(".noAllow").hide();
	if($("#tbl2 .form-select").val() == 3){
		$("#tbl2 .form-select, .btnBox>input").prop("disabled",true);
		noAllow();
		$("[name=refuseReason]").prop("disabled",true);
	}
});
$(".btnBox>button").click(function(){
	history.go(-1);
});
$("#tbl2 .form-select").change(function(){
	$(".noAllow").hide();
	$(this).parent().attr("colspan",3);
	if($(this).val() == 3){
		noAllow();
		$("[name=refuseReason]").focus();
	}
});
$(".btnBox [type=submit]").click(function(){
	console.log("d");
	if($("#tbl2 option:selected").val() == 1){
		alert("승인 또는 미승인으로 처리하세요.");
		return false;
	}else if($("#tbl2 option:selected").val() == 3 && $("[name=refuseReason]").val() == ""){
		alert("미승인 사유를 입력하세요.");
		$("[name=refuseReason]").focus();
		return false;
	}
});
function noAllow(){
	$(".noAllow").show();
	$("#tbl2 .form-select").parent().removeAttr("colspan");
}