$("#allChk1").click(function(){
	if($(this).is(":checked")){
		$("[name=status]").prop("checked", true);
	}else{
		$("[name=status]").prop("checked", false);
	}
});
$("[name=status]").click(function(){
	if($("[name=status]").length == $("[name=status]:checked").length){
		$("#allChk1").prop("checked", true);
	}else{
		$("#allChk1").prop("checked", false);
	}
});
$("#allChk2").click(function(){
	if($(this).is(":checked")){
		$("[name=level]").prop("checked", true);
	}else{
		$("[name=level]").prop("checked", false);
	}
});
$("[name=level]").click(function(){
	if($("[name=level]").length == $("[name=level]:checked").length){
		$("#allChk2").prop("checked", true);
	}else{
		$("#allChk2").prop("checked", false);
	}
});
$("[name=type]").change(function(){
	$(this).next().val("");
});
$(".resetSearch").click(function(){
	$(".searchBox [type=checkbox]").prop("checked",false);
	$("[name=type]>option:first").prop("selected",true);
	$("[name=keyword]").val("");
});