<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="container_mate">
		<h1 class="point_title">대시보드</h1>
		<div>
			<div class="alarm">
				<div>
					<img src="/resources/img/icon/admin_house.png">
					<p>하우스 등록</p>
				</div>
				<div>
					<a href="#">0건</a>
				</div>
			</div>
			<div class="alarm">
				<div>
					<img src="/resources/img/icon/admin_user.png">
					<p>헬퍼 신청</p>
				</div>
				<div>
					<a href="#">0건</a>
				</div>
			</div>
			<div class="alarm">
				<div>
					<img src="/resources/img/icon/admin_warning.png">
					<p>신고</p>
				</div>
				<div>
					<a href="#">0건</a>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<link rel="stylesheet" href="/resources/css/admin/dashboard.css">
</html>