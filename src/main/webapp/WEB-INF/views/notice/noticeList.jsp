<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" href="/resources/css/notice/noticeList.css">
	<div class="container_mate">
		<h1 class="point_title">공지사항</h1>
		<br>
		<hr>
		<br>
		<div class="notice-list">
			<table class="table">
				<tr class="table-secondary">
                    <th style="width: 120px;">No</th>
                    <th style="width: 650px;">제목</th>
                    <th style="width: 120px;">작성자</th>
                    <th style="width: 150px;">작성일</th>
                    <th style="width: 120px;">조회수</th>
                </tr>
               <c:forEach items="${list }" var="n">
               		<tr>
	               		<td>${n.noticeNo }</td>
               			<td><a href="/noticeView.do?noticeNo=${n.noticeNo }">${n.noticeTitle }</a></td>
               			<td>관리자</td>
               			<td>${n.noticeDate }</td>
               			<td>${n.noticeReadCount }</td>
               		</tr>
               </c:forEach>                
			</table>
		</div>
		<div id="pageNavi">${pageNavi }</div>
		<div class="notice-button">
			<c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 0 }">
				<a href="/noticeWriteFrm.do" class="btn btn_sm btn-right" style="height: 45px;">작성</a>
			</c:if>	
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>