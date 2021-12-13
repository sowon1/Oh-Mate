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
});
//모달 외부 영역 클릭 시 모달 닫기
$("#modal_report").click(function(e){
    var eTarget = e.target
    if(eTarget.classList[0] == ("modal_report")) {
    	modalClose();
    }
});
function modalShow(){
	$("#modal_report").css("display","flex");
}
function modalClose(){
	$("#modal_report").hide();
}
$(".modal_report_close").click(function(){
	modalClose();
});
$(".reportModal").click(function(){
	$.ajax({
		url: "/selectOneReport.do",
		data: {reportNo:$(this).prev().val()},
		success:function(data){
			console.log(data);
			$("#reportDate").val(data.reportDate);
			$("#reporterId").val(data.reporterId);
			$("#atackerId").val(data.atackerId);
			switch(data.reportCategory){
				case 1:
					$("#cate").val("헬퍼");
					break;
				case 2:
					$("#cate").val("채팅");
					break;
				case 3:
					$("#cate").val("게시글");
					break;
				case 4:
					$("#cate").val("댓글");
					break;
			}
			$("#reportNum").val(data.reportNum);
			$("#reportContent").html(data.reportContent);
			$("[name=reportStatus").eq(data.reportStatus-1).prop("checked",true);
			$(".modal_report_content .btnBox input").prop("disabled",false);
			if(data.reportStatus != 1){
				$(".modal_report_content .btnBox input").prop("disabled",true);
				$("#notice").remove();
				$(".btnBox").css("margin","28px auto 0");
			}
			modalShow();
		}
	});
});