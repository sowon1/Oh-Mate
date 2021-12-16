<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투어신청 내역</title>
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
						<li>${t.houseName }</li>	
					</c:forEach>
					<li>${pageNavi }</li>
				</ul>
			</div>
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>

</html>