$("[type=file]").change(function(){
	var files = $(this)[0].files;
	if(files.length != 0){
		var extention = files[0].name.substring(files[0].name.lastIndexOf('.')+1, files[0].name.length);
		if(extention == 'png' || extention == 'jpg' || extention == 'jpeg' || extention == 'gif'){
			var reader = new FileReader();
			reader.readAsDataURL(files[0]);
			reader.onload = function(e){
				$("#img-view").attr("src", e.target.result);
			}
		}else{
			alert("[ png / jpg / jpeg / gif ] 확장자 파일로 업로드 가능합니다.");
		}
	}
});
$("[type=button]").click(function(){
	history.go(-1);
});
$("[type=submit]").click(function(){
	if($(".table-active_mate [name=memberPw]").val() == ""){
		alert("비밀번호를 입력하세요.");
		return false;
	}else if($("[name=memberName]").val() == ""){
		alert("이름을 입력하세요.");
		return false;
	}else if($("[name=phone]").val() == ""){
		alert("전화번호를 입력하세요.");
		return false;
	}else if($("[name=phone]").next().html() != ""){
		alert("전화번호를 올바르게 입력하세요.");
		return false;
	}
});
$("[name=phone]").change(function(){
	$(this).next().html("");
	var reg = /^010-\d{4}-\d{4}$/;
	if(!reg.test($(this).val())){
		$(this).next().html("010-0000-0000 형식으로 입력하세요.");
	}
});