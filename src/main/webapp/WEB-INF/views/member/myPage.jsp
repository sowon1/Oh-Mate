<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/member/myPage.css">
<script type="text/javascript" src="/resources/js/member/myPage.js"></script>
<title>마이페이지</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
		<div class="container"><br>
			<h2>${m.memberName}님, 반갑습니다.</h2><br><br>
			<form action="/myPage.do" method="post" enctype="multipart/form-data">
			<table class="myPageTbl">
				<tr class="protr">
					<th class="mainImg">프로필 이미지</th>
					<td class="protd">
						<c:choose>
							<c:when test="${m.filepath eq null }">
								<img src="/resources/img/icon/profile.png" class="profImg">
							</c:when>
							<c:otherwise>
								<img src="/resources/upload/member/${m.filepath }" class="profImg">
							</c:otherwise>
						</c:choose> 
							<input type="hidden" class="fileChange" name="fileChange" id="fileChange" value='${SessionScope.m.filePath }'>
							<input type="file" name="uploadFile" id="uploadFile" accept=".gif, .jpg, .jpeg, .png"><br>
							<label for="uploadFile" class="btn btn_sm profBtn" id="selectPr">프로필선택</label>
					</td>
				</tr>
				<tr class="protr">
					<th>회원등급</th>
					<td class="protd">
						<c:choose>
							<c:when test="${m.memberLevel eq 0}">
								<input type="text" value="관리자" readonly>
							</c:when>
							<c:when test="${m.memberLevel eq 1 || m.memberLevel eq 5}">
								<input type="text" value="메이트" readonly>
							</c:when>
							<c:when test="${m.memberLevel eq 2}">
								<input type="text" value="하우스오너" readonly>
							</c:when>
							<c:when test="${m.memberLevel eq 3 || m.memberLevel eq 6 || m.memberLevel eq 7}">
								<input type="text" value="계정정지" readonly>
							</c:when>
							<c:when test="${m.memberLevel eq 4}">
								<input type="text" value="헬퍼" readonly>
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr class="protr">
					<th>아이디</th>
					<td class="protd">
						<input type="text" name="memberId" value="${m.memberId }" readonly>
					</td>
				</tr>
				<tr class="protr">
					<th>비밀번호&ensp;<em>*</em></th>
					<td class="protd">
						<input type="password" name="memberPw" value="${m.memberPw } ">
						<div class="col-sm-5">
							<h6 class="pwResult"></h6>
						</div>
					</td>
				</tr>
				<tr class="protr">
					<th>비밀번호 확인&ensp;<em>*</em></th>
					<td class="protd">
						<input type="password" name="memberPwRe" value="${m.memberPw } ">
						<div class="col-sm-5">
							<h6 class="pwReResult"></h6>
						</div>
					</td>
				</tr>
				<tr class="protr">
					<th>이름</th>
					<td class="protd">
						<input type="text" name="memberName" value="${m.memberName }" readonly>
					</td>
				</tr>
				<tr class="protr">
					<th>전화번호&ensp;<em>*</em></th>
					<td class="protd">
						<input type="text" name="phone" value="${m.phone }">
						<div class="col-sm-5">
							<h6 class="phoneResult"></h6>
						</div>
					</td>
				</tr>
				<tr class="protr">
					<th>이메일&ensp;<em>*</em></th>
					<td class="protd">
						<input type="text" name="email" value="${m.email }">
						<div class="col-sm-5">
							<h6 class="emailResult"></h6>
						</div>
					</td>
				</tr>
				<tr class="protr">
					<th>가입일</th>
					<td class="protd">
						${m.enrollDate }
					</td>
				</tr>
				<tr class="protr">
					<th>성별</th>
					<td class="protd" >
						<div class="select">
						<c:choose>
							<c:when test="${m.gender eq 1 }">
								<input type="radio" id="select1" name="gender" value="1" checked onclick="return(false);"><label for="select1" style="width:130px;">남자</label>
		                		<input type="radio" id="select2" name="gender" value="2" onclick="return(false);"><label for="select2" style="width:130px;">여자</label>
							</c:when>
							<c:when test="${m.gender eq 2 }">
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
							<c:when test="${m.age eq 1}">
								<input type="radio" id="select3" name="age" value="1" checked onclick="return(false);"><label for="select3" style="width:130px;">20대</label>
				                <input type="radio" id="select4" name="age" value="2" onclick="return(false);"><label for="select4" style="width:130px;">30대</label>
				                <input type="radio" id="select5" name="age" value="3" onclick="return(false);"><label for="select5" style="width:130px;">40대이상</label>
							</c:when>
							<c:when test="${m.age eq 2}">
								<input type="radio" id="select3" name="age" value="1" onclick="return(false);"><label for="select3" style="width:130px;">20대</label>
				                <input type="radio" id="select4" name="age" value="2" checked onclick="return(false);"><label for="select4" style="width:130px;">30대</label>
				                <input type="radio" id="select5" name="age" value="3" onclick="return(false);"><label for="select5" style="width:130px;">40대이상</label>
							</c:when>
							<c:when test="${m.age eq 3}">
								<input type="radio" id="select3" name="age" value="1" onclick="return(false);"><label for="select3" style="width:130px;">20대</label>
				                <input type="radio" id="select4" name="age" value="2" onclick="return(false);"><label for="select4" style="width:130px;">30대</label>
				                <input type="radio" id="select5" name="age" value="3" checked onclick="return(false);"><label for="select5" style="width:130px;">40대이상</label>
							</c:when>
						</c:choose> 
	           			</div><br><br>
					</td>
				</tr>
			</table>
			<div class="myPageBtn">
                <button type="submit" class="btn" id="myPageBtn1">정보수정</button>
                <button type="submit" class="btn" id="myPageBtn2">회원탈퇴</button>
            </div>
			</form><br><br>
		</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>