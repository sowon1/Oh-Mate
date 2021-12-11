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
.house-status{
	text-align: center;
	background-color: #ffffff
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
}

.house-status>li>div {
	float: left;
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
					<li><span class="img-space"></span> <span class="name-space">하우스</span>
						<span class="result-space">${totalCount }</span></li>
					<li><span class="img-space"></span> <span class="name-space">입주자신청건</span>
						<span class="result-space"></span></li>
					<li><span class="img-space"></span> <span class="name-space">투어신청건</span>
						<span class="result-space"></span></li>
				</ul>
			</div>
			<div class="house-table"></div>
			<div class="house-navi"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>