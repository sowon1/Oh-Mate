<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투어신청 내역</title>
<style>
	.tourRequest{
		height: 200px;
		border: 1px #f1f1f1 solid;
	}
	.house_photo{
		float: left;
		width: 200px;
		height: 200px;
		padding-top: 0;
		overflow: hidden;
	}
	.house_photo img{
		width: 200px;
		height: 200px;
		position: absolute;
	}
	.tour_info{
		float: left;
		padding: 20px;
		margin-left: 20px;
	}
	.house_title a{
		font-size: 20px;
		text-decoration: none;
		font-weight: bold;
	}
	.tour_status span{
		font-weight: bold;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<div class="container_mate">
		<div>
			<h1 class="point_title">투어 신청 내역</h1>
			<br>
			<hr>
			<div>
				<ul>
					<c:forEach items="${list }" var="t">
						<li>
							<div class="tourRequest">
								<div class="house_photo">
									<a href="houseView.do?houseNo=${t.houseNo}">
										<img src="/resources/upload/house/${t.photoList[0].photoPath }">
									</a>
								</div>
								<div class="tour_info">
									<div class="house_title">
										<a href="houseView.do?houseNo=${t.houseNo}">
											${t.houseName }
										</a>
									</div>
									<div class="room_title">
										 ${t.roomTitle }
										 ${t.roomStatus }
										 ${t.roomPersonnel }
									</div>
									
									<div class="house_address">
										<i class="fas fa-map-marker-alt"></i>
										서울시 ${t.addressName } ${t.addressRoad } ${t.addressLegal }
									</div>
									<br>
									<div class="tour_date">
										<div class="date">
											날짜 ${t.tourVisit }
										</div>
									</div>
									<div class="tour_status">
										상태 : 
										<c:choose>
											<c:when test="${t.tourStatus eq 1 }">
												<span style="color:blue;">승인</span>
											</c:when>
											<c:when test="${t.tourStatus eq 2 }">
												<span style="color:green;">승인요청중</span>
											</c:when>
											<c:when test="${t.tourStatus eq 3 }">
												<span style="color:red;">거절</span>
											</c:when>
										</c:choose>
									</div>
								</div>
							</div>
						</li>	
					</c:forEach>
					<li id="pageNavi">${pageNavi }</li>
				</ul>
			</div>
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>

</html>