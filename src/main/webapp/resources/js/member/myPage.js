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
				}
			}else if(fileVal == ""){
				$("#uploadFile").val("");
				return;
			}else{
				alert("이미지 파일만 가능합니다.");
				$("#uploadFile").val("");
				return;
			}
			loadImg(this);
	});
	
	function loadImg(obj){
		var files = obj.files;	//input type="file"
		console.log(files);
		if(files.length != 0){	//첨부파일 있는 경우
			var reader = new FileReader(); //파일에 대한 정보를 읽어오는 객체
			reader.readAsDataURL(files[0]);	//파일경로를 읽어옴
			//경로를 다 읽어오면 실행할 함수 설정
			reader.onload = function(e){  //e 에 읽어온 파일 정보가 들어있음
				$("#profImg").attr("src", e.target.result); //읽어온 경로를 img태그의 src속성에 설정
			}
		} 
	}
	
	//유효성검사
	var pwChk = true;
	var pwReChk = true;
	var phoneChk = true;
	var emailChk = true;
	
	$("#myPageBtn1").click(function(){
		var pw = $("#memberPw").val();
		var pwre = $("#memberPwre").val();
		var phone = $("#phone").val();
		var email = $("#email").val();
		
		if(pw == ""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}else if(pwre == ""){
			alert("비밀번호 확인을 입력해주세요.");
			return false;
		}else if(phone == ""){
			alert("전화번호를 입력해주세요.");
			return false;
		}else if(email == ""){
			alert("이메일을 입력해주세요.");
			return false;
		}else if(pw != pwre){
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
	});
	
	//비밀번호 
	$("#memberPw").keyup(function(){
		var password = $("#memberPw").val();
		var result = /^[a-zA-Z0-9]{4,12}$/;
		if(result.test(password)){
			$(".pwResult").html("사용 가능한 비밀번호 입니다.");
			$(".pwResult").css("color","blue");
			pwChk=true;
		}else{
			$(".pwResult").html("비밀번호는 영문 대소문자와 숫자로만 입력해주세요.");
			$(".pwResult").css("color","red");
			pwChk=false;
		}
	});
	
	//비밀번호 확인
	$("#memberPwre").keyup(function(){
		var password = $("#memberPw").val();
		var passwordRe = $("#memberPwre").val();
		if(password == passwordRe){
			$(".pwReResult").html("비밀번호가 일치합니다.");
			$(".pwReResult").css("color","blue");
			pwReChk=true;
		}else if(password != passwordRe){
			$(".pwReResult").html("비밀번호가  일치하지 않습니다.");
			$(".pwReResult").css("color","red")
			pwReChk=false;
		}
	});
	
	//휴대폰번호
	$("#phone").keyup(function(){
		var phone = $("#phone").val();
		var result = /^010-([0-9]{4})-([0-9]{4})$/;
		if(result.test(phone)){
			$(".phoneResult").html("휴대폰 번호가 올바르게 입력됐습니다.");
			$(".phoneResult").css("color","blue");
			phoneChk=true;
		}else{
			$(".phoneResult").html("010-0000-0000 형식대로 입력해주세요.");
			$(".phoneResult").css("color","red");
			phoneChk=false;
		}
	});
	
	//이메일주소
	$("#email").keyup(function(){
		var email = $("#email").val();
		var result = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(result.test(email)){
			$(".emailResult").html("사용 가능한 이메일 입니다.");
			$(".emailResult").css("color","blue");
			emailChk=true;
		}else{
			$(".emailResult").html("이메일 형식으로 다시 입력해주세요.");
			$(".emailResult").css("color","red");
			emailChk=false;
		}
	});
	
	$("#myPageBtn2").click(function(){
		var memberNo=$("#memberNo").val();
		var confirmAl = confirm("정말로 탈퇴하시겠습니까?");
		if(confirmAl == true){
			location.href="/deleteMember.do?memberNo="+memberNo;
		}else{
			alert("회원탈퇴를 취소합니다");
		}
	});
	
	
});	