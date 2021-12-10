function profileSelect(){
	$.ajax({
		url:"/profileSelect.do",
        data:{memberId:$("[name=memberId]").val()},
        type:"post",
	});

};