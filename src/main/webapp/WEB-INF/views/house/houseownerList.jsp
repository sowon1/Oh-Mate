<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.main {
	padding-top: 30px;
	margin: 0 auto;
	width: 1200px;
}

.house-status {
	text-align: center;
	background-color: #F3ECEC;
	border: 1px solid #E0E0E0;
	border-top: 1px solid black;
}

.house-status>ul {
	overflow: hidden;
	margin: 0 auto;
	width: 500px;
	height: 100px;
}

.house-status li {
	float: left;
	line-height: 100px;
	width: calc(100%/ 3);
}

.house-status span {
	font-size: 20px;
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main">
		<div class="container-mate">
			<h4 class="form-title point_title">내 하우스 리스트</h4>
			<div class="house-status">
				<ul>
					<li><span class="img-space"></span> <span class="name-space">하우스:</span>
						<span class="result-space"> ${totalCount }</span></li>
					<li><span class="img-space"></span> <span class="name-space">입주자신청건</span>
						<span class="result-space"></span></li>
					<li><span class="img-space"></span> <span class="name-space">투어신청건</span>
						<span class="result-space"></span></li>
				</ul>
			</div>
			<div class="house-table">
				<ul>
					<c:forEach items="${list }" var="h" varStatus="i">
						<li><a href="/houseOwnerRoom.do?houseNo=${h.houseNo }">
								<div>
									<img src="">
								</div>
						</a>
							<div class="sumary">
								<p class="sumary-name">${h.houseTitle }</p>
								<c:choose>
									<c:when test="${h.houseAllow eq 1}">
										<span class="allow-waiting">승인대기</span>
									</c:when>
									<c:when test="${h.houseAllow eq 2 }">
										<span class="allow-agree">승인</span>
									</c:when>
									<c:when test="${h.houseAllow eq 3 }">
										<span class="allow-refuse">승인 거절</span>
										<span>${h.refuseReason }</span>
									</c:when>
								</c:choose>
									<div class="sumary-add">
										<!-- 추후논의 -->
									</div>
									<div class="sumary-status">
										<span>입주현황<strong>${h.refuseReason }/${h.houseRoom }</strong></span>
										<span>투어 신청건<strong></strong></span>
									</div>
									<a href="/houseOwnerRoom.do?houseNo=${h.houseNo }">계약내역
										상세보기</a>
							</div>
							<div class="btn-group">
								<a href="houseUpdate.do">수정하기</a>
								<a href="houseDelete.do">삭제하기</a>
								<a href="housePerson.do">입주자 내역</a>
							</div>
							<div class="move-list">
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="house-navi"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>