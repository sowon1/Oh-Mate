<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container_mate">
		<h1 class="point_title">공지사항</h1>
		<br>
		<br>
		<div class=notice-view>
			<table class="table">
				<tr class="table-light">
					<th colspan="4" style="text-align: center; font-size: 25px;">${n.noticeTitle }</th>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${n.noticeDate }</td>
					<th>조회수</th>
					<td>${n.noticeReadCount }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
						<c:forEach items="${n.list }" var="f">
							<a href="/downFile.do?filepath=${f.filepath }&filename=${f.filename }">${f.filename }</a><br>
						</c:forEach>
					</td>

				</tr>
				<tr>
					<td colspan="4">
						<div style="min-height: 300px;">
							${n.noticeContent }						
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="4" style="text-align:center;">
						<button class="btn btn_sm btn_out" onclick="history.go(-1);">이전화면</button>
						<c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 0 }">
							<a href="/noticeUpdateFrm.do?noticeNo=${n.noticeNo }" class="btn btn_sm">수정</a>
							<a href="/noticeDelete.do?noticeNo=${n.noticeNo }" class="btn btn_pk btn_sm">삭제</a>
						</c:if>
					</th>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<link rel="stylesheet" href="/resources/css/notice/noticeView.css">
</html>