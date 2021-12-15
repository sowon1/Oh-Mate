$("#allChk").click(function(){
	if($(this).is(":checked")){
		$("[name=status]").prop("checked", true);
	}else{
		$("[name=status]").prop("checked", false);
	}
});
$("[name=status]").click(function(){
	if($("[name=status]").length == $("[name=status]:checked").length){
		$("#allChk").prop("checked", true);
	}else{
		$("#allChk").prop("checked", false);
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
		option.attr("value", local[i]);
		option.html(local[i]);
		$(".chkBox select").append(option);
	}
});
$(".resetSearch").click(function(){
	$(".searchBox [type=checkbox]").prop("checked",false);
	$(".n").prop("selected",true);
	$("[name=type]>option:first").prop("selected",true);
	$("[name=keyword]").val("");
});