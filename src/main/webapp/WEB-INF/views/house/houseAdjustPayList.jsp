<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="container_mate">
	<div style="margin-bottom: 30px;">
	<h1 class="point_title">정산내역</h1>
	<table class="table">
		<tr>
			<th>No</th>
			<th>하우스제목</th>
			<th>룸 제목</th>
			<th>보증금</th>
			<th>첫달월세</th>
			<th>결제자ID</th>
			<th>결제자이름</th>
			<th>결제방법</th>
			<th>결제일자</th>
			<th>결제 상태</th>
			<th>정산상태</th>
		</tr>		
			<c:forEach items="${list }" var="p" varStatus="i">
		<tr>
			<td>${start+i.index }</td>
			<td>${p.houseTitle }</td>
			<td>${p.roomTitle }</td>
			<td>${p.roomCharge }</td>
			<td>${p.roomMonth }</td>
			<td>${p.payId }</td>
			<td>${p.payName }</td>
			<td>${p.moveStart }</td>
			<td>${p.moveEnd }</td>
			<td>${p.movePhone }</td>
			<td>${p.payStatus }</td>
		</tr>
			</c:forEach>	
	</table>
	</div>
	<div style="width: 350px; margin: 0 auto; text-align: center;">${pageNavi }</div>
	<div style="margin: 10px; padding-top:30px; text-align: center;">
	<a href="/main.do" class="btn btn_b_line btn_rx" style="width: 80%; line-height: 30px;	">메인으로 돌아가기</a>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>