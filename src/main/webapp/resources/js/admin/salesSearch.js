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
$(function(){
	$("[name=startDate]").val($("#startDate").val());
	$("[name=endDate]").val($("#endDate").val());
});
$('.datefilter').daterangepicker({
    singleDatePicker: true,
    locale: {
        "format": "YYYY-MM-DD", 
        "applyLabel": "확인", 
        "cancelLabel": "취소", 
        "daysOfWeek": ["토", "일", "월", "화", "수", "목", "금"],
        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    }
});
$('.datefilter').on('apply.daterangepicker', function(ev, picker) {
	$(this).val(picker.startDate.format('YYYY-MM-DD'));
});
$('.datefilter').on('cancel.daterangepicker', function(ev, picker) {
	$(this).val('');
});
$(".datefilter+img").click(function(){
	$(this).prev().click();
});
$(".searchBox [type=submit]").click(function(){
	var start = $("[name=startDate]").val();
	var end = $("[name=endDate]").val();
	if(start != '' && end != '' && start > end){
		alert("결제 기간 시작일은 종료일보다 이전 날짜로 선택하세요.");
		return false;
	}
});
$("[name=type]").change(function(){
	$(this).next().val("");
});
$(".resetSearch").click(function(){
	$(".searchBox [type=checkbox]").prop("checked",false);
	$(".datefilter").val('');
	$("[name=type]>option:first").prop("selected",true);
	$("[name=keyword]").val("");
});