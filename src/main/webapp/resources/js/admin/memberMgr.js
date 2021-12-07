$("#allChk").click(function(){
	if($(this).is(":checked")){
		$("[name=level]").prop("checked", true);
	}else{
		$("[name=level]").prop("checked", false);
	}
});
$("[name=level]").click(function(){
	if($("[name=level]").length == $("[name=level]:checked").length){
		$("#allChk").prop("checked", true);
	}else{
		$("#allChk").prop("checked", false);
	}
});
$("[name=type]").change(function(){
	$(this).next().val("");
	$(this).next().removeAttr("placeholder");
	if($(this).val() == 'phone'){
		$(this).next().attr("placeholder", "010-0000-0000");
	}
});
$("[name=keyword]").keyup(function(){
	if($("[name=type]").val() == 'phone'){
		$(this).attr("placeholder", "010-0000-0000");
	}
});