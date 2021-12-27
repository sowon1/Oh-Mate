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
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="container_mate" style="padding-top: 80px;">
	<div style="margin-bottom: 30px;">
	<h1 class="point_title">하우스 정산내역</h1>
	<table class="table">
		<tr>
			<th>No</th>
			<th>하우스제목</th>
			<th>룸 제목</th>
			<th>보증금</th>
			<th>첫달월세</th>
			<th>결제자ID</th>
			<th>결제자이름</th>
			<th>퇴거일</th>
			<th>결제날짜</th>
			<th>연락처</th>
			<th>정산상태</th>
		</tr>		
			<c:forEach items="${list }" var="p" varStatus="i">
		<tr>
			<td>${start+i.index }</td>
			<td>${p.houseTitle }</td>
			<td>${p.roomTitle }</td>
			<td>${p.roomCharge }원</td>
			<td>${p.roomMonth }원</td>
			<td>${p.payId }</td>
			<td>${p.payName }</td>
			<td>${p.moveEnd }</td>
			<td>${p.payDate }</td>
			<td>${p.movePhone }</td>
			<td>${p.payStatus }</td>
		</tr>
			</c:forEach>	
	</table>
	</div>
	<div id="paveNavi" style="width: 400px; margin: 0 auto; text-align: center;">${pageNavi }</div>
	<div style="margin: 10px; padding-top:30px; text-align: center;">
	<a href="/main.do" class="btn btn_b_line btn_rx" style="width: 80%; line-height: 30px;">메인으로 돌아가기</a>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>