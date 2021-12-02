<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.m.memberLevel eq 0 }">
		<a href="/noticeWriteFrm.do" class="btn btn_sm">작성</a>
	</c:if>
	<a href="/noticeWriteFrm.do" class="btn btn_sm">공지사항 작성</a>
</body>
</html>