<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/resources/css/member/profile.css">
<script type="text/javascript" src="/resources/js/member/profileUpFrm.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="pofile_wrap">
		<div class="pofile_container">
			<div class="logo">
		        <div class="Mate_logo" >
		            <a href="/">Oh-Mate!</a>
		        </div>
				<div class="pofile_cont">
					<h2>프로필 수정/삭제</h2>
					<p>
						나의 성향에 대해 알려주세요 
						<br>
						나와 비슷한 성향의 메이트를 구할 수 있어요
					</p><br>
					<form action="/updateProfile.do?memberId=${sessionScope.m.memberId}" method="post">	
					<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
				    <input type="hidden" name="pWriter" value="${sessionScope.m.memberId}">
				    <input type="hidden" name="pLocalVal" value="${local}">
				    <div class="centerBox">
				    	<div>
				    	<h6 class="localH">선호 지역</h6>&emsp;
				    		<span>서울특별시</span>&ensp;
				    		<select class="pLocal" id="pLocal2" name="pLocal">
				    			<option value="0" id="sel" selected disabled>지역구 선택</option>
				    		</select>
				    	</div><br>
						<h6>선호 성별</h6>
						<div class="select">
						<c:choose>
							<c:when test="${p.PGender eq 1}">
					                <input type="radio" id="pGender1" name="pGender" value="1" checked ><label for="pGender1" style="width:130px;">여성전용</label>
					                <input type="radio" id="pGender2" name="pGender" value="2"><label for="pGender2" style="width:130px;">남성전용</label>
					                <input type="radio" id="pGender3" name="pGender" value="3"><label for="pGender3" style="width:130px;">남녀공용</label>
			           		</c:when>
			           		<c:when test="${p.PGender eq 2}">
					                <input type="radio" id="pGender1" name="pGender" value="1" ><label for="pGender1" style="width:130px;">여성전용</label>
					                <input type="radio" id="pGender2" name="pGender" value="2" checked ><label for="pGender2" style="width:130px;">남성전용</label>
					                <input type="radio" id="pGender3" name="pGender" value="3"><label for="pGender3" style="width:130px;">남녀공용</label>
			           		</c:when>
			           		<c:when test="${p.PGender eq 3}">
					                <input type="radio" id="pGender1" name="pGender" value="1" checked ><label for="pGender1" style="width:130px;">여성전용</label>
					                <input type="radio" id="pGender2" name="pGender" value="2"><label for="pGender2" style="width:130px;">남성전용</label>
					                <input type="radio" id="pGender3" name="pGender" value="3" checked ><label for="pGender3" style="width:130px;">남녀공용</label>
			           		</c:when>
			           	</c:choose>
			           	</div><br>
						<h6>선호 나이</h6>
	                 	<div class="select">
	                 	<c:choose>
	                 		<c:when test="${p.PAge eq 1}">
			                	<input type="radio" id="pAge1" name="pAge" value="1" checked><label for="pAge1" style="width:130px;">20대</label>
			                	<input type="radio" id="pAge2" name="pAge" value="2"><label for="pAge2" style="width:130px;">30대</label>
			                	<input type="radio" id="pAge3" name="pAge" value="3"><label for="pAge3" style="width:130px;">40대이상</label>
			                </c:when>
			                <c:when test="${p.PAge eq 2}">
			                	<input type="radio" id="pAge1" name="pAge" value="1"><label for="pAge1" style="width:130px;">20대</label>
			                	<input type="radio" id="pAge2" name="pAge" value="2" checked><label for="pAge2" style="width:130px;">30대</label>
			                	<input type="radio" id="pAge3" name="pAge" value="3"><label for="pAge3" style="width:130px;">40대이상</label>
			                </c:when>
			                <c:when test="${p.PAge eq 3}">
			                	<input type="radio" id="pAge1" name="pAge" value="1"><label for="pAge1" style="width:130px;">20대</label>
			                	<input type="radio" id="pAge2" name="pAge" value="2"><label for="pAge2" style="width:130px;">30대</label>
			                	<input type="radio" id="pAge3" name="pAge" value="3" checked><label for="pAge3" style="width:130px;">40대이상</label>
		           			</c:when>
		           		</c:choose>
		           		</div><br>
		           		<h6>흡연 여부</h6>
	                 	<div class="select">
	                 	<c:choose>
	                 		<c:when test="${p.PSmoke eq 1}">
				                <input type="radio" id="pSmoke1" name="pSmoke" value="1" checked><label for="pSmoke1" style="width:130px;">흡연</label>
				                <input type="radio" id="pSmoke2" name="pSmoke" value="2"><label for="pSmoke2" style="width:130px;">비흡연</label>
			                </c:when>
			                <c:when test="${p.PSmoke eq 2}">
				                <input type="radio" id="pSmoke1" name="pSmoke" value="1"><label for="pSmoke1" style="width:130px;">흡연</label>
				                <input type="radio" id="pSmoke2" name="pSmoke" value="2" checked><label for="pSmoke2" style="width:130px;">비흡연</label>
		           			</c:when>
		           		</c:choose>
		           		</div><br>
		           		<h6>반려동물</h6>
	                 	<div class="select">
	                 	<c:choose>
	                 		<c:when test="${p.PPet eq 1 }">
				                <input type="radio" id="pPet1" name="pPet" value="1" checked><label for="pPet1" style="width:130px;">좋아요</label>
				                <input type="radio" id="pPet2" name="pPet" value="2"><label for="pPet2" style="width:130px;">싫어요</label>
		           			</c:when>
                 			<c:when test="${p.PPet eq 2 }">
				                <input type="radio" id="pPet1" name="pPet" value="1"><label for="pPet1" style="width:130px;">좋아요</label>
				                <input type="radio" id="pPet2" name="pPet" value="2" checked><label for="pPet2" style="width:130px;">싫어요</label>
		           			</c:when>
		           		</c:choose>
		           		</div><br>
		           		<h6>청소하는걸</h6>
	                 	<div class="select">
	                 	<c:choose>
	                 		<c:when test="${p.PCleaning eq 1 }">
				                <input type="radio" id="pCleaning1" name="pCleaning" value="1" checked><label for="pCleaning1" style="width:130px;">좋아해요</label>
				                <input type="radio" id="pCleaning2" name="pCleaning" value="2"><label for="pCleaning2" style="width:130px;">싫어해요</label>
		           			</c:when>
		           			<c:when test="${p.PCleaning eq 2 }">
				                <input type="radio" id="pCleaning1" name="pCleaning" value="1"><label for="pCleaning1" style="width:130px;">좋아해요</label>
				                <input type="radio" id="pCleaning2" name="pCleaning" value="2" checked><label for="pCleaning2" style="width:130px;">싫어해요</label>
		           			</c:when>
		           		</c:choose>
		           		</div><br>
		           		<h6>생활패턴</h6>
	                 	<div class="select">
	                 	<c:choose>
	                 		<c:when test="${p.PPattern eq 1 }">
				                <input type="radio" id="pPattern1" name="pPattern" value="1" checked><label for="pPattern1" style="width:130px;">밤</label>
				                <input type="radio" id="pPattern2" name="pPattern" value="2"><label for="pPattern2" style="width:130px;">낮</label>
		           			</c:when>
		           			<c:when test="${p.PPattern eq 2 }">
				                <input type="radio" id="pPattern1" name="pPattern" value="1"><label for="pPattern1" style="width:130px;">밤</label>
				                <input type="radio" id="pPattern2" name="pPattern" value="2" checked><label for="pPattern2" style="width:130px;">낮</label>
		           			</c:when>
		           		</c:choose>
		           		</div>
	           		</div><br><br>
	           		<div class="submitbtn">
	           			<input type="submit" class="btn btn-primary" id="profilesubmit1" value="프로필 수정">
	           			<a href="#" class="btn" id="profilesubmit2">프로필 삭제</a>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>