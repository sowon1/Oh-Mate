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
					<a href="/adminHouseSearch.do?reqPage=1&type=houseTitle&keyword=&addrName=지역구 선택&status=1"><span>${d.house }</span> 건</a>
				</div>
			</div>
			<div class="alarm">
				<div>
					<img src="/resources/img/icon/admin_user.png">
					<p>헬퍼 신청</p>
				</div>
				<div>
					<a href="/adminHelperSearch.do?reqPage=1&type=helperName&keyword=&addrName=지역구 선택&status=1"><span>${d.helper }</span> 건</a>
				</div>
			</div>
			<div class="alarm">
				<div>
					<img src="/resources/img/icon/admin_warning.png">
					<p>신고</p>
				</div>
				<div>
					<a href="/reportSearch.do?reqPage=1&type=reporterId&keyword=&status=1"><span>${d.report }</span> 건</a>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<link rel="stylesheet" href="/resources/css/admin/dashboard.css">
</html>