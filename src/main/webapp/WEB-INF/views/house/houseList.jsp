<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/house/house.css">
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<div class="container_mate">
		<div class="list_filter">
			<div class="filter_icon">
				<img src="/resources/img/icon/filter.png">
				<span class="filter_name">조건검색</span>
			</div>
			<div class="search_line">
				<input class="search_input" placeholder="지역, 지하철역, 대학 주변 검색">
				<a href="" class="search_icon">
					<img src="/resources/img/icon/search_on.png">
				</a>
			</div>
		</div>
	</div>
	<div class="house_list">
	
	</div>
	<div class="house_right">
	
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>