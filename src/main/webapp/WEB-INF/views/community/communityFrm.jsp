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
	<div class="container">
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
						<a class="btn btn-secondary" href="/insertProfile.do" style="line-height: normal;">프로필 등록</a>
					</c:when>
				</c:choose>
				<div class="MateSearch">
					<form style="position: relative;" action="/mateSearch1" method="post">
						<div class="form-check" style="padding-left:0px;">
							<img class="searchsty" src="/resources/img/icon/search1.png" onclick="location.href='' ">
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
		<c:choose>
			<c:when test="${empty list }">
				<div class="emptyList">
					게시글이 없습니다.
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="b" varStatus="i">
			 	<div class="row row-cols-1 row-cols-md-3" onclick="location.href='/boardView?boardNo=${b.getBoardNo()}';">
				  <div class="col mb-4">
				    <div class="card">
				      <img src="/resources/upload/member/${b.getfilepath() }" class="card-img-top">
				      <div class="card-body">
				        <h5 class="card-title">{b.getboardTitle}</h5><br>
				        <p class="card-text" style="color: #956BFC">{b.getboardWriter}</p>
				        <p>{b.getregDate}</p>
				        <p>{b.getreadCount}</p>
				      </div>
				    </div>
				  </div>
				</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<style>
	p{
		margin:0px;
	}
</style>
</html>


























