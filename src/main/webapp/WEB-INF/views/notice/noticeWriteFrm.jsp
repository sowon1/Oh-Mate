<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<form action="/noticeWrite.do">
		<input type="text" class="input_01" name="noticeTitle">
		<input type="text" class="input_01" name="noticeContent">
	</form>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>