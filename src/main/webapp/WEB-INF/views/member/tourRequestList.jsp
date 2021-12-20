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
		height: 300px;
		border: 1px #f1f1f1 solid;
	}
	.house_photo{
		float: left;
		width: 500px;
		height: 300px;
		padding-top: 0;
		overflow: hidden;
	}
	.house_photo img{
		width: 500px;
		height: 300px;
		position: absolute;
	}
	.tour_info{
		float: left;
		margin-top: 50px;
		margin-left: 50px;
	
	}
	.house_title a{
		font-size: 25px;
		text-decoration: none;
		font-weight: bold;
	}
	.tour_status span{
		font-weight: bold;
	}
	.room_title{
		font-size: 15px;
		text-align: center;
	}
	.house_address{
		font-size: 15px;
	}
	.room_name{
		font-size: 20px;
		overflow: hidden;
	}
	.room_tag{
	    border: 2px solid #956bfc;
	    border-radius: 50px;
	    padding: 3px 8px;
	    float: left;
	    margin-right: 10px;
	   /*  width: 81px; */
	    font-family: 'ns_500';
	    color: #956bfc;
	}
	.in_ok{
	    border: 2px solid #956bfc;
	    border-radius: 50px;
	    padding: 3px 8px;
	    float: left;
	    margin-right: 10px;
	   /*  width: 81px; */
	    font-family: 'ns_500';
	    color: #956bfc;
	}
	.in_no{
	    border: 2px solid #ff0071;
	    border-radius: 50px;
	    padding: 3px 8px;
	    float: left;
	    margin-right: 10px;
	   /*  width: 81px; */
	    font-family: 'ns_500';
	    color: #ff0071;
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
										 <span class="room_name">${t.roomTitle }</span> 
										 <span class="room_tag">${t.roomPersonnel }</span>
										 <c:choose>
										 	<c:when test="${t.roomStatus eq 1}">
										 		<span class="in_ok">입주 가능</span>
										 	</c:when>
										 	<c:when test="${t.roomStatus eq 2}">
										 		<span class="in_no">입주 불가능</span>
										 	</c:when>
										 </c:choose>
									</div>
									<br>
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
												<span style="color:blue;">투어가능!</span>
											</c:when>
											<c:when test="${t.tourStatus eq 2 }">
												<span style="color:#956bfc;">확인 요청중</span>
											</c:when>
											<c:when test="${t.tourStatus eq 3 }">
												<span style="color:#ff0071;">거절됨</span>
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