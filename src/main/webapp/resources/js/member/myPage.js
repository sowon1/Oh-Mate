$(function(){   
	$("#uploadFile").change(function(){
		var fileVal = $(this).val();
		var fileType = fileVal.substring(fileVal.lastIndexOf(".")+1);
		var fileSize = 10 * 1024 * 1024; //10메가
		if(fileType == 'jpg' || fileType == 'png' || fileType == 'jpeg' || fileType == 'gif'){
			var uploadFileSize = this.files[0].size;
			if(uploadFileSize > fileSize){
				alert("이미지 업로드 용량은 10MB 이하로 가능합니다.");
				$("#uploadFile").val("");
				return;
			}else if(fileVal == ""){
				$("#uploadFile").val("");
				return;
			}else{
				alert("이미지 파일만 가능합니다.");
				$("#uploadFile").val("");
				return;
			}
		}
	});
});