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

.house{
	height: 250px;
	margin-bottom: 10px;
	border: 1px #f1f1f1 solid;
}
.house-status {
	text-align: center;
	background-color: #F3ECEC;
	border: 1px solid #E0E0E0;
	border-top: 1px solid black;
	margin-top: 20px;
	margin-bottom: 20px;
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
.house>a{
	float: left;
}
.house-img{
	position: relative;
	width: 300px;
	height: 230px;
	padding-top: 0;
	overflow: hidden;
}
.house-img img{
	width: 100%;
	height: 100%;
	position: absolute;
}
.summary{
	float: left;
	padding: 20px;
	margin-left: 20px;
}
.summary-name{
	margin:0;
	font-size:20px;
	font-weight: bold;
}
.summary-name span{
	margin-left: 10px;
	padding: 1px 5px;
	font-weight: 300px;
	font-size: 11px;
	vertical-align: 3px;
	border-radius: 2px;
}
.summary-add{
	color: #777;
	margin-bottom: 15px;
}
.summary-status{
	min-width: 250px;
	margin-bottom: 5px;
	height: 40px;
	line-height: 36px;
	font-size: 14px;
	color: #4d4d4d;
	text-align: center;
	background-color: #f8f8f9;
	border-radius: 6px;
	
}
.summary-status strong{
	font-weight: 400;
	color: #956bfc;
}
.summary-datail{
	display: block;
	height: 40px;
	line-height: 36px;
	font-size: 14px;
	color: #4d4d4d;
	text-align: center;
	background-color: #f8f8f9;
	border-radius: 6px;
}
.btn-group{
	float: right;
	width: 800px;
	height:50px;
	line-height: 50px;
	overflow: hidden;
	text-align: center;
	font-size: 0;
	border-top: 1px #f1f1f1 solid;
}
.btn-group a{
	display: inline-block;
	width: 50%;
	font-size: 14px;
	color: #333;
	border-right: 1px #f1f1f1 solid;
}
.house-navi{
margin-left: 500px;
}
.move-list{
	margin:10px;
}
.tour-list{
	margin: 10px;
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
					<li><span class="img-space"></span> <span class="name-space">입주자신청건:</span>
						<span class="result-space"></span></li>
					<li><span class="img-space"></span> <span class="name-space">투어신청건:</span>
						<span class="result-space"></span></li>
				</ul>
			</div>
			<div class="house-table">
				<ul>
					<c:forEach items="${list }" var="h" varStatus="i">
						<li>
							<div class="house">
								<a 
									href="/houseOwnerRoom.do?houseNo=${h.houseNo }">
									<div class="house-img">
										<img src="/resources/upload/house/${h.photoList[0].photoPath }">
									</div>
								</a>	
								<div class="summary">
									<p class="summary-name">${h.houseTitle }
									<c:choose>
										<c:when test="${h.houseAllow eq 1}">
											<span class="allow-waiting" style="color: orange; border: 1px solid orange; ">승인대기</span>
											
										</c:when>
										<c:when test="${h.houseAllow eq 2 }">
											<span class="allow-agree" style="color: green; border: 1px solid green;">승인</span>
											<c:choose>
												<c:when test="${h.houseSelling eq 1 }">
													<span class="allow-agree" style="color: green; border: 1px solid green;">판매중</span>
												</c:when>
												<c:when test="${h.houseSelling eq 2 }">
													<span class="allow-refuse" style="color: blue; border: 1px solid blue;">판매완료</span>												
												</c:when>
											</c:choose>
										</c:when>
										<c:when test="${h.houseAllow eq 3 }">
											<span class="allow-refuse" style="color: red; border: 1px solid red;">승인 거절</span>
											<c:if test="${not empty h.refuseReason }">
												<span style="color: red; border: 1px solid red; margin: 0"><i class="fas fa-exclamation" style="color: red;"></i></span>
											</c:if>
										</c:when>
									</c:choose>
									</p>
									<div class="summary-add">
										<i class="fas fa-map-marker-alt"></i>
										<c:forEach items="${h.houseAddressView }" var="hs">
											${hs.addressName } ${hs.addressLegal } ${hs.addressRoad } ${hs.addressDetail }
										</c:forEach>
									</div>
									<div class="summary-status">
										<span>입주현황: <strong>${h.roomCount }/${h.houseRoom }</strong></span>·
										<span>소개종료일:<strong> ${h.houseownerDeadline }</strong></span>
									</div>
									<a class="summary-datail" href="/houseOwnerRoom.do?houseNo=${h.houseNo }&memberNo=${h.memberNo}">하우스
										상세보기</a>
								</div>
								<div class="btn-group">
									<a href="/houseUpdateFrm.do?houseNo=${h.houseNo}&memberNo=${h.memberNo}">수정하기</a> <a href="/houseDelete.do?houseNo=${h.houseNo} &memberNo=${h.memberNo}">삭제하기</a>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="house-navi">${pageNavi }</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>