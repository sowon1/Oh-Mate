<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬프</title>
<style>
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />	
	<div class="container_mate">
		<h1 class="point_title">헬프 내역</h1>
		<br>
		<hr>
		<br>
		<div class="select_tab">
			<ul>
				<li><a href="/helpList.do?reqPage=1">헬프리스트</a></li>
				<li><a href="#">헬프리뷰</a></li>
				<li><a href="#">찜한 헬프</a></li>
			</ul>
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>
</html>