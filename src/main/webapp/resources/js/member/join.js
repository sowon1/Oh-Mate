$(function(){
	var idChk = false;
	var emailChk = false;
	var emailCodeChk = false;
	var pwChk = false;
	var pwreChk = false;
	var nameChk = false;
	var phoneChk = false;
	var code = "";  //이메일 전송 인증번호 저장을 위한 코드 
	
	 //입력값 변수
	 function checkJoin(){  
	 	var pf = $("[name=uploadFile]").val();
    	var id = $("[name=memberId]").val();
    	var email = $("#email").val();
    	var emailCode = $("#authMsg").html();
    	var pw = $("[name=memberPw]").val();
		var pwre = $("#memberPwre").val();
		var name = $("#memberName").val();
		var phone = $("#phone").val();
		var priBox = $("#agree").val();
	
		if(pf == ""){
			alert("프로필 사진을 넣어주세요.");
			return false;
    	}else if($(':radio[name="gender"]:checked').length < 1){
	    	alert('성별을 선택해주세요.');     
	    	return false;                   
		}else if($(':radio[name="age"]:checked').length < 1){
	    	alert('연령대를 선택해주세요.');     
	    	return false;                   
		}else if(id == "" || idChk == false){
    		alert("아이디를 올바르게 입력해주세요.");
			return false;
    	}else if(email == "" || emailChk== false){
    		alert("이메일을 올바르게 입력해주세요.");
			return false;
    	}else if(emailCode != "인증번호가 일치합니다." || emailCodeChk == false){
			alert("인증번호를 입력해주세요.")
			return false;
		}else if(pw == "" || pwChk== false){
			alert("비밀번호를 올바르게 입력해주세요.");
			return false;
		}else if(pwre == "" || pwreChk== false){
			alert("비밀번호를 다시 한 번 입력해주세요.");
			return false;
		}else if(name == "" || nameChk== false){
			alert("이름을 올바르게 입력해주세요.");
			return false;
		}else if(phone == "" || phoneChk== false){
			alert("전화번호를 올바르게 입력해주세요.");
			return false;
		}else if(priBox == "9"){
			alert("필수 항목에 체크해주세요.");
			return false;
		}else{
			return true;
		}

	  }

    $("#joinsubmit").on("click", function(){
		return checkJoin();
	});

    //아이디 유효성검사
    $("[name=memberId]").keyup(function(){
        var memberId = $(this).val();
        var value = /^[a-zA-Z0-9]{5,11}$/;  
        if(value.test(memberId)){   
            $(".result1").html("중복체크를 해주세요.");
            $(".result1").css("color","red");
            idChk = false;
            return false;
        }else{  
            $(".result1").html("아이디는 대소문자 5~11글자로 입력해주세요");
            $(".result1").css("color","red");
            idChk = false;
            return false;
        }
    });

    //아이디 중복체크
    $("[name=memberIdChk]").click(function(){
        var memberId = $("[name=memberId]").val();
        var value = /^[a-zA-Z0-9]{5,11}$/;
        if(memberId == "" || !(value.test(memberId))){
            $(".result1").html("아이디를 올바르게 입력해주세요.");
            $(".result1").css("color","red");
            return;
        }

        $.ajax({  
            url:"/IdCheck.do",
            data:{memberId:memberId},
            type:"post",
            success:function(data){
                if(data == 1){
                    $(".result1").html("사용 가능한 아이디 입니다.");
					$(".result1").css("color","blue");
                    idChk=true;
                }else{
                    $(".result1").html("이미 사용중인 아이디 입니다.");
					$(".result1").css("color","red");
                    idChk=false;
                }
            }
        });
    });

    //이메일 
    $("[name=email]").keyup(function(){
        var email = $(this).val();
        var value = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if(email == "" || !(value.test(email))){
            $(".result2").html("이메일을 올바르게 입력해주세요.");
            $(".result2").css("color","red");
            return false;
        }else{
        	$.ajax({
            url:"/emailCheck.do",
            data:{email:email},
            type:"post",
            success:function(data){
                if(data == 2){
                   $(".result2").html("사용 가능한 이메일 입니다.");
                   $(".result2").css("color","blue");
                   emailChk=true;
                   $("#emailbutton").attr("disabled", false);
                }else{
                   $(".result2").html("이미 사용중인 이메일 입니다.");
                   $(".result2").css("color","red");
                   emailChk=false;
                   $("#emailbutton").attr("disabled", true);
                }
            }
        });
        }
    });

	//인증번호 이메일 전송
	$("[name=emailChks]").click(function(){
		var email = $("[name=email]").val();
		var cehckBox = $("#authCode");
		var boxWrap = $(".auth");
		
		$.ajax({        
	        type:"GET",
	        url:"/mailCheck.do?email=" + email,
	        success:function(data){
	            console.log("data : " + data);
	            cehckBox.attr("disabled",false);
	           	code = data;   // Controller부터 전달받은 인증번호를 code에 저장
	        }    
    	}); 
	});
	
	//전송완료 눌렀을때 alert창
	$("#emailbutton").click(function(){
        var email = $("[name=email]").val();
		var value = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(value.test(email)){
			alert('입력하신 메일 주소로 인증번호가 전송되었습니다.');
		}else{
			alert('이메일을 올바르게 입력해주세요.');
		}
	});
	
	//인증번호 비교
	$("#authCode").blur(function(){
		var inputCode = $(this).val();    // 입력코드  
		
		if(inputCode == code){    // 일치할 경우                        
            $("#authMsg").html("인증번호가 일치합니다.");
            $("#authMsg").css("color","blue"); 
            emailCodeChk = true;     
    	} else {   // 일치하지 않을 경우                                          
	        $("#authMsg").html("인증번호를 다시 확인해주세요.");
	        $("#authMsg").css("color", "red");
	        emailCodeChk = false;
    	}    
	});
	
    
    //비밀번호
    $("[name=memberPw]").keyup(function(){
        var password = $(this).val();
        var value = /^[a-zA-Z0-9]{4,12}$/;
        if(value.test(password)){
            $(".result3").html("사용 가능한 비밀번호 입니다.");
            $(".result3").css("color","blue");
            pwChk=true;
			return true;
        }else{
            $(".result3").html("비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.");
            $(".result3").css("color","red");
            return false;
        }
    });

    //비밀번호 확인
    $("[name=memberPwre]").keyup(function(){
        var password = $("[name=memberPw]").val();
        var passwordChk = $(this).val();
        if(password == passwordChk){
            $(".result4").html("비밀번호가 일치합니다.");
            $(".result4").css("color","blue");
            pwreChk=true;
			return true;
        }else{
            $(".result4").html("비밀번호가 일치하지 않습니다.");
            $(".result4").css("color","red");
            return false;
        }
    });

    //이름
    $("[name=memberName]").keyup(function(){
        var name = $(this).val();
        var value = /^[가-힣]{2,6}$/;
        if(value.test(name)){
            $(".result5").html("이름이 올바르게 입력됐습니다.");
            $(".result5").css("color","blue");
            nameChk=true;
			return true;;
        }else{
            $(".result5").html("이름은 한글 2~6글자로 입력해주세요.");
            $(".result5").css("color","red");
            return false;
        }
    });

    //휴대폰번호
    $("[name=phone]").keyup(function(){
        var phone = $(this).val();
        var value = /^010-([0-9]{4})-([0-9]{4})$/;
        if(value.test(phone)){
            $(".result6").html("휴대폰 번호가 올바르게 입력됐습니다.");
            $(".result6").css("color","blue");
            phoneChk=true;
			return true;
        }else{
            $(".result6").html("010-0000-0000 형식대로 입력해주세요.");
            $(".result6").css("color","red");
            return false;
        }
    });

    //체크박스 전체 선택
    $('#allCheck').on('click',function(){
        if($('#allCheck').is(':checked')){
            $('.priBox').prop('checked',true);
            $('#agree').val(1);
        }else{
            $('.priBox').prop('checked',false);
            $('#agree').val(9);
        }
    });

    //체크박스 값 변경 0:필수동의 1:전체체크 9:아무것도안함
    $(".priBox").on("click", function(){
	if($(".priBox").eq(0).is(":checked") && $(".priBox").eq(1).is(":checked") && $(".priBox").eq(2).is(":checked")){
		$('#agree').val(1);  // 전체체크 
	}else if($(".priBox").eq(0).is(":checked") && $(".priBox").eq(1).is(":checked")){
		$('#agree').val(0);  // 필수체크
	}else if($(".priBox").eq(0).is(":checked") && $(".priBox").eq(2).is(":checked")){
		$('#agree').val(9);  // 아무것도안함
	}else if($(".priBox").eq(1).is(":checked") && $(".priBox").eq(2).is(":checked")){
		$('#agree').val(9);  // 아무것도안함
	}
  	});
 });   