<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/resources/css/member/myPage.css">
<script type="text/javascript" src="/resources/js/member/myPage.js"></script>
<title>Oh-Mate!</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
		<div class="container_mate">
			<h2>${sessionScope.m.memberName}님, 반갑습니다.</h2>
			<p class="myPageinfo">고객님께서 가입하신 <strong>(주)오나의메이트</strong> 회원 정보입니다.</p><hr><br>
			<form action="/myPageUpdate.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
			<input type="hidden" name="enrollDate" id="enrollDate" value=${sessionScope.m.enrollDate }>
			<input type="hidden" name="profileStatus" id="profileStatus" value="2">
			<table class="myPageTbl">
				<c:choose>
					<c:when test="${sessionScope.m.memberLevel eq 1}">	
						<tr class="protr pro">
						<th>회원유형</th>
						<td class="protd pro">
						<div>					
							<input type="radio" name="memberLevel" value="1" checked>메이트&emsp;
				            <input type="radio" name="memberLevel" value="2" onclick="return(false);">하우스오너
						</div>
						</td> 
						</tr>
					</c:when>
					<c:when test="${sessionScope.m.memberLevel eq 2}">
						<tr class="protr pro">
						<th>회원유형</th>
						<td class="protd pro">	
						<div>					
							<input type="radio" name="memberLevel" value="1" onclick="return(false);">메이트&emsp;
				            <input type="radio" name="memberLevel" value="2" checked>하우스오너
						</div>
						</td> 
						</tr>
					</c:when>
				</c:choose>
				<tr class="protr pro">
					<th>프로필 이미지</th>
					<td class="protd pro">
						<c:choose>
							<c:when test="${sessionScope.m.filepath eq null }">
								<img src="/resources/img/icon/profile.png" id="profImg" class="profImg" name="profImg">
							</c:when>
							<c:otherwise>
								<img src="/resources/upload/member/${m.filepath }" id="profImg" class="profImg" name="profImg">
							</c:otherwise>
						</c:choose> 
							<input type="hidden" class="fileChange" name="fileChange" id="fileChange" value='${SessionScope.m.filepath }'>
							<input type="file" name="uploadFile" id="uploadFile" accept=".gif, .jpg, .jpeg, .png"><br>
							<label for="uploadFile" class="btn btn_sm profBtn" id="selectPr">프로필선택</label>
					</td>
				</tr>
				<tr class="protr"> 
					<th>회원등급</th>
					<td class="protd">
						<c:choose>
							<c:when test="${sessionScope.m.memberLevel eq 0}">
								<input type="text" value="관리자" readonly>
							</c:when>
							<c:when test="${sessionScope.m.memberLevel eq 1 || sessionScope.m.memberLevel eq 5}">
								<input type="text" value="메이트" readonly>
							</c:when>
							<c:when test="${sessionScope.m.memberLevel eq 2}">
								<input type="text" value="하우스오너" readonly>
							</c:when>
							<c:when test="${sessionScope.m.memberLevel eq 3 || sessionScope.m.memberLevel eq 6 || sessionScope.m.memberLevel eq 7}">
								<input type="text" value="계정정지" readonly>
							</c:when>
							<c:when test="${sessionScope.m.memberLevel eq 4}">
								<input type="text" value="헬퍼" readonly>
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr class="protr">
					<th>아이디</th>
					<td class="protd">
						<input type="text" name="memberId" value="${sessionScope.m.memberId}" readonly>
						<input type="hidden" id="memberNo" name="memberNo" value="${sessionScope.m.memberNo}">
					</td>
				</tr>
				<tr class="protr">
					<th>비밀번호&ensp;<em>*</em></th>
					<td class="protd">
						<input type="password" name="memberPw" id="memberPw" value="${sessionScope.m.memberPw}" maxlength="12">
						<input type="hidden" id="originalPw" value="${sessionScope.m.memberPw}" maxlength="12">
						<div class="col-sm-5">
							<h6 class="pwResult"></h6>
						</div>
					</td>
				</tr>
				<tr class="protr">
					<th>비밀번호 확인&ensp;<em>*</em></th>
					<td class="protd">
						<input type="password" name="memberPwre" id="memberPwre" maxlength="12">
						<div class="col-sm-5">
							<h6 class="pwReResult"></h6>
						</div>
					</td>
				</tr>
				<tr class="protr">
					<th>이름</th>
					<td class="protd">
						<input type="text" name="memberName" value="${sessionScope.m.memberName }" readonly>
					</td>
				</tr>
				<tr class="protr">
					<th>전화번호&ensp;<em>*</em></th>
					<td class="protd">
						<input type="text" name="phone" id="phone" value="${sessionScope.m.phone }" maxlength="13">
						<div class="col-sm-5">
							<h6 class="phoneResult"></h6>
						</div>
					</td>
				</tr>
				<tr class="protr">
					<th>이메일&ensp;<em>*</em></th>
					<td class="protd">
						<input type="text" name="email" id="email" value="${sessionScope.m.email }" maxlength="33">
						<div class="col-sm-5">
							<h6 class="emailResult"></h6>
						</div>
					</td>
				</tr>
				<tr class="protr">
					<th>가입일</th>
					<td class="protd">
						${sessionScope.m.enrollDate}
					</td>
				</tr>
				<tr class="protr">
					<th>성별</th>
					<td class="protd" >
						<div class="select">
						<c:choose>
							<c:when test="${sessionScope.m.gender eq 1}">
								<input type="radio" id="select1" name="gender" value="1" checked onclick="return(false);"><label for="select1" style="width:130px;">남자</label>
		                		<input type="radio" id="select2" name="gender" value="2" onclick="return(false);"><label for="select2" style="width:130px;">여자</label>
							</c:when>
							<c:when test="${sessionScope.m.gender eq 2}">
								<input type="radio" id="select1" name="gender" value="1" onclick="return(false);"><label for="select1" style="width:130px;">남자</label>
		                		<input type="radio" id="select2" name="gender" value="2" checked onclick="return(false);"><label for="select2" style="width:130px;">여자</label>
							</c:when>
						</c:choose>
	           			</div>
	           		</td>
				</tr>
				<tr class="protr">
					<th>나이</th>
					<td class="protd">
						<div class="select">
						<c:choose>
							<c:when test="${sessionScope.m.age eq 1}">
								<input type="radio" id="select3" name="age" value="1" checked onclick="return(false);"><label for="select3" style="width:130px;">20대</label>
				                <input type="radio" id="select4" name="age" value="2" onclick="return(false);"><label for="select4" style="width:130px;">30대</label>
				                <input type="radio" id="select5" name="age" value="3" onclick="return(false);"><label for="select5" style="width:130px;">40대이상</label>
							</c:when>
							<c:when test="${sessionScope.m.age eq 2}">
								<input type="radio" id="select3" name="age" value="1" onclick="return(false);"><label for="select3" style="width:130px;">20대</label>
				                <input type="radio" id="select4" name="age" value="2" checked onclick="return(false);"><label for="select4" style="width:130px;">30대</label>
				                <input type="radio" id="select5" name="age" value="3" onclick="return(false);"><label for="select5" style="width:130px;">40대이상</label>
							</c:when>
							<c:when test="${sessionScope.m.age eq 3}">
								<input type="radio" id="select3" name="age" value="1" onclick="return(false);"><label for="select3" style="width:130px;">20대</label>
				                <input type="radio" id="select4" name="age" value="2" onclick="return(false);"><label for="select4" style="width:130px;">30대</label>
				                <input type="radio" id="select5" name="age" value="3" checked onclick="return(false);"><label for="select5" style="width:130px;">40대이상</label>
							</c:when>
						</c:choose> 
	           			</div>
					</td>
				</tr>
				<!-- 하우스 오너가 아닐때만 -->
				<c:if test="${sessionScope.m.memberLevel ne 2}">
					<tr class="protr">
						<th>프로필 상태</th>
						<td class="protd">
							<c:choose>
								<c:when test="${sessionScope.m.profileStatus eq 1}">
									<a href="/profileUpFrm.do?memberId=${sessionScope.m.memberId }">등록</a> <!-- 수정/삭제페이지 -->
								</c:when>
								<c:when test="${sessionScope.m.profileStatus eq 2}">
									<a href="/profile.do?memberId=${sessionScope.m.memberId }">미등록</a>  <!-- 등록페이지 -->
								</c:when>
							</c:choose>
						</td>
					</tr>
				</c:if>
			</table><br>
			<div class="myPageBtn">
                <button type="submit" class="btn" id="myPageBtn1">정보수정</button>
                <a href="#" class="btn" id="myPageBtn2">회원탈퇴</a>
            </div>
			</form><br><br>
		</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>