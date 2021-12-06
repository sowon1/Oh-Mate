$("[type=file]").change(function(){
	var files = $(this)[0].files;	//input type=file에서 선택한 파일을 배열로 가져옴
	if(files.length != 0){	//첨부 파일이 있는 경우
		var extention = files[0].name.substring(files[0].name.lastIndexOf('.')+1, files[0].name.length);
		if(extention == 'png' || extention == 'jpg' || extention == 'jpeg' || extention == 'gif'){
			var reader = new FileReader();		//파일에 대한 정보를 읽어오는 객체
			reader.readAsDataURL(files[0]);		//파일을 읽어옴
			//다 읽어오면 실행할 함수 설정
			reader.onload = function(e){		//읽어온 파일이 매개변수 e
				$("#img-view").attr("src", e.target.result);	//읽어온 파일 경로를 img태그의 src속성에 설정
			}
		}else{
			alert("[ png / jpg / jpeg / gif ] 확장자 파일로 업로드 가능합니다.");
		}
	}
});
$("[type=button]").click(function(){
	history.go(-1);
});