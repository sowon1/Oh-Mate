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
		$("[name=cate]").prop("checked", true);
	}else{
		$("[name=cate]").prop("checked", false);
	}
});
$("[name=cate]").click(function(){
	if($("[name=cate]").length == $("[name=cate]:checked").length){
		$("#allChk2").prop("checked", true);
	}else{
		$("#allChk2").prop("checked", false);
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