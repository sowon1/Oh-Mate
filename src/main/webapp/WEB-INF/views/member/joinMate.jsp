<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script type="text/javascript" src="/resources/js/member/join.js"></script>
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
						(주)오나의메이트 일반 회원가입 페이지 입니다. 
						<br>
						기본정보를 입력해주세요
					</p>
				<form action="/join1.do" method="post" enctype="multipart/form-data">	
				<input type="hidden" name="profileStatus" id="profileStatus" value="2">
					<div>
						<input type="radio" name="memberLevel" value="1" checked>메이트&nbsp;
			            <input type="radio" name="memberLevel" value="2" onclick="return(false);">하우스오너
					</div><br>
					<h6>프로필 사진</h6>
		             <span class="img_wrapp" >
		             		<img id="img1" src="/resources/img/icon/profile.png"/>
	                     <input type="file" name="uploadFile" id="fileItem">      
		             </span>  
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
					<h6 class="join_title"><em>*</em>&ensp;아이디</h6> <!-- 아이디 입력(대소문자 5~11글자) -->
					<div class="in-line">
						<input type="text" name="memberId" id="memberId" class="form-control" placeholder="아이디 입력(대소문자 조합 5~11글자)" maxlength="11">
						<button type="button" name="memberIdChk" id="memberIdChk" class="btn btn-primary inputBtn1">중복 확인</button><br>
					</div><span class="result1"></span>
					<h6 class="join_title"><em>*</em>&ensp;이메일주소</h6> <!-- 이메일형식 / 인증번호 -->
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
						<span class="result6"></span><br>
					
					<input type="hidden" id="agree" value="9">
					<input type="checkbox" id="allCheck">약관 전체 동의<br> 			
					<input type="checkbox" class="priBox" id="necessary1" name="agree">
					<label for="necessary1">개인정보 수집 이용 동의(필수)</label><br>
						<div class="agreeArea" tabindex="0">
							<div class="agreeInner">
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
								<p>더 자세한 내용에 대해서는 개인정보처리방침을 참고하시기 바랍니다.</p>
							</div>
						</div><br>
					<input type="checkbox" class="priBox" id="necessary2" name="agree">
					<label for="necessary2">(주)오늘부터 메이트 이용약관(필수)</label> 
						<div class="agreeArea" tabindex="0">
							<div class="agreeInner">
								제1조(목적)<br>
								이 약관은 주식회사 (주)오나의메이트가 운영하는 사이버 “오나의메이트”(이하 “메이트”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.
					        	<br>
					        	<br>
								제2조(정의)<br>
								① “메이트”이란 주식회사 오나의메이트가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br>
								② “이용자”란 “메이트”에 접속하여 이 약관에 따라 “메이트”가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
								③ ‘회원’이라 함은 “메이트”에 회원등록을 한 자로서, 계속적으로 “메이트”가 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br>
								④ ‘비회원’이라 함은 회원에 가입하지 않고 “메이트”가 제공하는 서비스를 이용하는 자를 말합니다.
								<br>
					        	<br>
								제3조 (약관 등의 명시와 설명 및 개정)<br>
								① “메이트”가 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>
								② “메이트"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br>
								③ “메이트”는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
								④ “메이트”는 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 메이트의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "메이트"가 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br>
								⑤ “메이트”는 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “메이트”에 송신하여 “메이트”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>
								⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.<br>
							</div>
						</div><br>
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
</html>