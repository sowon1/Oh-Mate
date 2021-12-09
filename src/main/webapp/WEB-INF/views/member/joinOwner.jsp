<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="join_wrap">
		<div class="join_container">
			<div class="logo">
		        <div class="Mate_logo" >
		            <a href="/">Oh-Mate!</a>
		        </div>
				<div class="join_cont">
					<h1>회원가입</h1>
					<p>
						(주)오나의메이트 하우스메이트 회원가입 페이지 입니다. 
						<br>
						기본정보를 입력해주세요
					</p>
				<form action="/join2.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="profileStatus" id="profileStatus" value="2">
				<div>
					<input type="radio" name="memberLevel" value="1" onclick="return(false);">메이트&nbsp;
		            <input type="radio" name="memberLevel" value="2" checked>하우스오너
				</div><br>
					<h6>프로필 사진</h6>
                   	<input type="file" name="uploadFile" id="fileItem">      
		            	<span class="img_wrapp" >
		             		<img id="img1"/>
		             	</span><br><br>  
                  	<h6 class="gender"><em>*</em>&ensp;성별 선택</h6>&emsp;
                  	<div class="select">
		                <input type="radio" id="select1" name="gender" value="1"><label for="select1" style="width:130px;">남자</label>
	                <input type="radio" id="select2" name="gender" value="2"><label for="select2" style="width:130px;">여자</label>
	           	</div><br>
                 	<h6 class="age"><em>*</em>&ensp;연령대 선택</h6>&emsp;
                 	<div class="select">
	                <input type="radio" id="select3" name="age" value="1"><label for="select3" style="width:130px;">20대</label>
	                <input type="radio" id="select4" name="age" value="2"><label for="select4" style="width:130px;">30대</label>
	                <input type="radio" id="select5" name="age" value="3"><label for="select5" style="width:130px;">40대이상</label>
	           	</div><br>
				<h6><em>*</em>&ensp;아이디</h6> <!-- 아이디 입력(대소문자 5~11글자) -->
				<div class="in-line">
					<input type="text" name="memberId" id="memberId" class="form-control" placeholder="아이디 입력(대소문자 조합 5~11글자)" maxlength="11">
					<button type="button" name="memberIdChk" id="memberIdChk" class="btn btn-primary inputBtn1">중복 확인</button><br>
				</div><span class="result1"></span><br><br>
				<h6><em>*</em>&ensp;이메일주소</h6> <!-- 이메일형식 / 인증번호 -->
				<div class="in-line">
					<input type="text" name="email" id="email" class="form-control" placeholder="이메일주소 입력" maxlength="33">
					<button type="button" name="emailChks" id="emailbutton" class="btn btn-primary inputBtn2" disabled="disabled">인증번호 전송</button><br>
				</div>	
				<span class="result2"></span><br>
				<div class="auth">
					<input type="text" id="authCode" class="form-control" placeholder="인증코드를 입력해주세요" maxlength="6" disabled="disabled">
					<button type="button" class="btn btn-primary inputBtn2" id="authBtn">인증하기</button><br>					
					<span id="authMsg"></span>
				</div>
				<br>
				<h6><em>*</em>&ensp;비밀번호</h6> <!-- 비밀번호입력(4~12자의 영문 대소문자와 숫자) -->
					<input type="password" name="memberPw" id="memberPw" class="form-control" placeholder="비밀번호 입력(4~12자의 영문 대소문자와 숫자)" maxlength="12">
					<span class="result3"></span><br>
				<h6><em>*</em>&ensp;비밀번호 확인</h6>
					<input type="password" name="memberPwre" id="memberPwre" class="form-control" placeholder="비밀번호 확인" maxlength="12">
					<span class="result4"></span><br>
				<h6><em>*</em>&ensp;이름</h6> <!-- 이름 2~6글자 -->
					<input type="text" name="memberName" id="memberName" class="form-control"placeholder="이름(2~6글자)" maxlength="6">
					<span class="result5"></span><br>
				<h6><em>*</em>&ensp;휴대폰번호</h6> <!-- 전화번호형식  000-0000-0000 -->
					<input type="text" name="phone" id="phone" class="form-control" placeholder="전화번호 형식 000-0000-0000" maxlength="13">
					<span class="result6">　</span><br>  
				
					<input type="hidden" name="sms" id="agree" value="9">
					<input type="checkbox" id="allCheck">약관 전체 동의<br> 			
					<input type="checkbox" class="priBox" id="necessary1" name="agree">
				<label for="necessary1">개인정보 수집 이용 동의(필수)</label> &ensp;
					<a data-toggle="modal" href="#modalL1">약관 보기</a> 
				<br>
					<input type="checkbox" class="priBox" id="necessary2" name="agree">
				<label for="necessary2">(주)오늘부터 메이트 이용약관(필수)</label> &ensp;
					<a data-toggle="modal" href="#modalL2">약관 보기</a> 
				<br>
					<input type="checkbox" class="priBox" id="select" name="agree">
				<label for="select">마케팅 활용 및 광고성 정보 수신 동의(선택)</label>
				<br><br>
				<div>
					<input type="submit" class="btn btn-primary joinbtn" id="joinsubmit" value="회원가입" onclick="return checkValue();">
				</div>
			</form>
			</div>
		</div>
	</div>

		<div class="modal" id="modalL1">
		  <div class="modal-dialog" role="document" style="margin-top:100px;">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">(주)오나의메이트 개인정보 수집 및 이용동의</h5>
		      </div>
		      <div class="modal-body">
		        <p class="agreem">
		        	(주)오나의메이트는 아래의 목적으로 개인정보를 수집 및 이용하며, 회원의 개인정보를 안전하게 취급하는데 최선을 다하고 있습니다.
		        	<br>
		        	<br>
					1. 수집목적
					<br>
					- 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
					- 민원사무 처리
					- 재화 또는 서비스 제공
					- 추천인 아이디 활용
					
					2. 수집항목
					<br>
					회원가입 시
					<br>
					(필수) 아이디, 비밀번호, 이메일, 이름, 성별, 생년월일, 휴대폰번호, CI/DI, 내/외국인정보, 본인인증결과
					<br>
					<br>
					본인인증 시
					<br>
					(필수) 이름, 성별, 생년월일, 휴대폰번호, CI/DI, 내/외국인정보, 본인인증결과
					<br>
					<br>
					소셜 계정(카카오)을 통한 회원가입 시
					(필수) 로그인 정보 식별값, 성별, 생년월일, 휴대폰번호, 이메일
					<br>
					간편 로그인 시(소셜 계정 연동)
					당사는 고객의 편의를 위해 간편로그인(카카오, Apple) 방식을 제공하고 있습니다. 이와 같은 로그인 시 당사가 고객의 개인정보를 추가 수집하지 않으며, 다만 로그인 정보 식별값만 비교하고 있습니다.
					<br>
					<br>
					3. 보유기간
					수집된 정보는 회원탈퇴 요청 5일 후 지체없이 파기됩니다. 다만 내부 방침에 의해 서비스 부정이용기록은 부정 가입 및 이용 방지를 위하여 회원 탈퇴 시점으로부터 최대 1년간 보관 후 파기하며, 관계법령에 의해 보관해야 하는 정보는 법령이 정한 기간 동안 보관한 후 파기합니다. 서비스 제공을 위해 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스 이용이 가능합니다.
					<br>
					더 자세한 내용에 대해서는 개인정보처리방침을 참고하시기 바랍니다.</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	
	<!-- 프로필사진 미리보기 -->
	<script type="text/javascript">
		var sel_file;
		
		$(document).ready(function(){
			$("#fileItem").on("change", ImgFileSelect);
		});
		
		function ImgFileSelect(e) {
		    var files = e.target.files;
		    var filesArr = Array.prototype.slice.call(files);

		    filesArr.forEach(function(f) {
		        if(!f.type.match("image.*")) {
		            alert("프로필 사진은 이미지 확장자만 업로드 가능합니다.");
		            $("#fileItem").val("");
		            return;
		        }

		        sel_file = f;
		        var reader = new FileReader();
		        reader.onload = function(e) {
		            $("#img1").attr("src", e.target.result);
		        }
		        reader.readAsDataURL(f);
		    });
		}
	</script>
</body>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script type="text/javascript" src="/resources/js/member/join.js"></script>
</html>
