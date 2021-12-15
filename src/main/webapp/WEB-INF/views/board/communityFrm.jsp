<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="stylesheet" href="/resources/css/community/communityFrm.css">
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="container_mate">
		<fieldset><br><br>
			<legend class="Matitle">오늘부터 메이트</legend>
			<h6>나와 성향이 비슷한 메이트를 구해보세요</h6>
				<div class="lg_box">
					<ul>
						<li>
							- 게시글을 작성하시려면 <span><a style="color:red; font-style:italic;">프로필을 등록해주세요.</a></span>&nbsp;&nbsp;
							<span>나와 비슷한 성향을 가진 메이트를 구할 수 있습니다.</span>
						</li>
						<li>
							- 조건검색을 활용하면 더 쉽고 빠르게 메이트를 구할 수 있답니다.
						</li><br>
							<ul class="m_box">
								<li class="mbold">※ (주)오나의메이트는 회원이 서비스 내에 게시하거나 전달하는 모든 내용물(회원간 전달 혹은 비공개 게시물 포함)이 다음 각 호에 해당한다고 판단될 경우 사전 통보 없이 게시 중단, 삭제, 수정 등의 조치를 취할 수 있고, 필요하다고 판단되는 경우 해당 회원의 서비스 이용 자격을 제한하거나 정지, 상실시킬 수 있습니다.</li><br>
								<li class="mbold"><span>1. 회사, 다른 회원 또는 제3자에 대한 인신공격, 비방, 욕설, 명예훼손 내용이 포함된 경우<br></span></li>
								<li class="mbold"><span>2. 공공질서 및 미풍양속에 위반되는 내용을 유포하는 경우<br></span></li>
								<li class="mbold"><span>3. 위법행위, 범죄행위와 결부되는 내용인 경우<br></span></li>
								<li class="mbold"><span>4. 회사, 다른 회원 또는 제3자의 저작권이나 초상권 등 기타 권리를 침해하는 내용일 경우<br></span></li>
								<li class="mbold"><span>5. 타인에게 불쾌감을 주거나 회원간 분쟁을 야기하는 내용으로서, 이러한 분쟁으로 회사의 업무가 방해되거나 방해되리라고 판단되는 경우</span></li>
							</ul>
					</ul>
				</div><br>
				<c:choose>
					<c:when test="${sessionScope.m.profileStatus eq 1}"> <!-- 프로필 등록했을 때 -->  
						<a class="btn btn-secondary" id="profileUp" href="/profileUpFrm.do?memberId=${sessionScope.m.memberId }">프로필 수정/삭제</a>
						<a class="btn btn-secondary" id="communityWt" href="/mateWriteFrm.do">게시글 작성</a>
					</c:when>
					<c:when test="${sessionScope.m.profileStatus eq 2}"> <!-- 프로필 등록 안했을 때 --> 
						<a class="btn btn-secondary" href="/profile.do?memberId=${sessionScope.m.memberId }" style="line-height: normal;">프로필 등록</a>
					</c:when>
				</c:choose>
				<div class="MateSearch">
					<form style="position: relative;" action="/mateSearch1" method="post">
						<div class="form-check" style="padding-left:0px;">
							<img class="searchsty" src="/resources/img/icon/search1.png">
							<p class="searchfs">조건검색</p>
						</div>
						<input type="text" class="form-control me-sm-2" name="MateSearch" placeholder="지역 또는 내용을 검색해주세요" style="width: 350px; margin-top: 5px;"> 
						<input type="submit" id="Msearch" style="display: none;"></input> 
							<label for="Msearch"> 
								<img src="/resources/img/icon/search2.png" class="searchIm">
							</label>
					</form>
				</div>
		</fieldset>
		<div class="slideOpen">
			<div class="container_search">
			<fieldset>
		        <div class="Mate_logo" >
		            <a href="/">Oh-Mate!</a>
		        </div>
				<div class="pofile_cont">
					<h5>나와 비슷한 성향의 메이트를 구해보세요</h5>
					<br>
					<form action="/insertProfile.do" method="post">	
					<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
				    <input type="hidden" name="pWriter" value="${sessionScope.m.memberId}">
					
				    <div class="centerBox">
				    	<div>
				    	<h6 class="localH">선호 지역</h6>&emsp;
				    		<span>서울특별시</span>&ensp;
				    		<select id="pLocal2" name="pLocal">
				    			<option value="0" id="sel" selected disabled>지역구 선택</option>
				    		</select>
				    	</div><br>
						<h6>선호 성별</h6>
	                 	<div class="select">
			                <input type="radio" id="pGender1" name="pGender" value="1"><label for="pGender1" style="width:130px;">여성전용</label>
			                <input type="radio" id="pGender2" name="pGender" value="2"><label for="pGender2" style="width:130px;">남성전용</label>
			                <input type="radio" id="pGender3" name="pGender" value="3"><label for="pGender3" style="width:130px;">남녀공용</label>
		           		</div><br>
						<h6>선호 나이</h6>
	                 	<div class="select">
			                <input type="radio" id="pAge1" name="pAge" value="1"><label for="pAge1" style="width:130px;">20대</label>
			                <input type="radio" id="pAge2" name="pAge" value="2"><label for="pAge2" style="width:130px;">30대</label>
			                <input type="radio" id="pAge3" name="pAge" value="3"><label for="pAge3" style="width:130px;">40대이상</label>
		           		</div><br>
		           		<h6>흡연 여부</h6>
	                 	<div class="select">
			                <input type="radio" id="pSmoke1" name="pSmoke" value="1"><label for="pSmoke1" style="width:130px;">흡연</label>
			                <input type="radio" id="pSmoke2" name="pSmoke" value="2"><label for="pSmoke2" style="width:130px;">비흡연</label>
		           		</div><br>
		           		<h6>반려동물</h6>
	                 	<div class="select">
			                <input type="radio" id="pPet1" name="pPet" value="1"><label for="pPet1" style="width:130px;">좋아요</label>
			                <input type="radio" id="pPet2" name="pPet" value="2"><label for="pPet2" style="width:130px;">싫어요</label>
		           		</div><br>
		           		<h6>청소하는걸</h6>
	                 	<div class="select">
			                <input type="radio" id="pCleaning1" name="pCleaning" value="1"><label for="pCleaning1" style="width:130px;">좋아해요</label>
			                <input type="radio" id="pCleaning2" name="pCleaning" value="2"><label for="pCleaning2" style="width:130px;">싫어해요</label>
		           		</div><br>
		           		<h6>생활패턴</h6>
	                 	<div class="select">
			                <input type="radio" id="pPattern1" name="pPattern" value="1"><label for="pPattern1" style="width:130px;">밤</label>
			                <input type="radio" id="pPattern2" name="pPattern" value="2"><label for="pPattern2" style="width:130px;">낮</label>
		           		</div>
	           		</div><br><br>
	           		<div class="submitbtn">
	           			<input type="submit" class="btn btn-primary" id="profilesubmit" value="조건검색">
					</div>
					</form>
				</div>
			</fieldset>
			</div>
		</div>
		<c:choose>
			<c:when test="${empty list }">
				<div class="emptyList">
					게시글이 없습니다.
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="b" varStatus="i">
				 	<div class="cardImg" onclick="location.href='/boardView.do?boardNo=${b.boardNo}';">
					  <div class="col mb-4">
					    <div class="card">
					      <img src="/resources/upload/board/${b.filePath }" class="card-img-top">
					      <div class="card-body">
						      <h5 class="card-title">${b.boardTitle }</h5>
								<div class="profile">
									<c:choose>
										<c:when test="${empty b.filePath}">
										<div class="prof">
											<img src="resources/img/icon/profile.png" class="memberImg">
										</div>
										</c:when>
										<c:otherwise>
										<div class="prof">
											<img src="resources/upload/member/${b.filePath}" class="memberImg">
										</div>
										</c:otherwise>
									</c:choose>
								</div>	
								<div class="cardTC">
							      <p class="card-text">${b.boardWriter }</p>
							      <p class="card-content">${b.regDate }</p>&nbsp;
							      <p class="card-content">조회 ${b.readCount }</p>
						      	</div>
					      </div>
					    </div>
					  </div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
<script>
$(function(){
	//조건검색 슬라이드
	$(".form-check").click(function(){
		$(".slideOpen").slideToggle();
	});
	
	//선호지역
	var PLocal = ['강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구',
		'동작구', '마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구'];
	for(var i=0; i<PLocal.length; i++){
		var option = $("<option>");
		option.attr("value",i+1);
		option.html(PLocal[i]);
		$("#pLocal2").append(option);
	}
	
	//필수선택
	$(input[type=submit]).click(function(){
		if(!$("option").not("#sel").is(":selected")){
			alert('선호 지역을 선택해주세요.');
			return false;
		}else if(!$("[name=pGender]").is(":checked")){
			alert('선호 성별을 선택해주세요.');
			return false;
		}else if(!$("[name=pAge]").is(":checked")){
			alert('선호 나이를 선택해주세요.');
			return false;
		}else if(!$("[name=pSmoke]").is(":checked")){
			alert('흡연 여부를 선택해주세요.');
			return false;
		}else if(!$("[name=pPet]").is(":checked")){
			alert('반려동물 여부를 선택해주세요.');
			return false;
		}else if(!$("[name=pCleaning]").is(":checked")){
			alert('청소 여부를 선택해주세요.');
			return false;
		}else if(!$("[name=pPattern]").is(":checked")){
			alert('생활패턴을 선택해주세요.');
			return false;
		}else{
			return true;
		}
	});
	
});
</script>

</body>
</html>