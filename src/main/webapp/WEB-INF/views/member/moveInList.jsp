<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
</head>
<style>
	table *{
	    text-align: center;
	}
	table a{
		color: #333;
	}
	table a:hover{
		text-decoration: underline;	
	}
	.title{
		width: 250px;
		min-width: 250px;
		max-width: 250px;
		overflow: hidden;
	}
	.pay_date{
		width: 150px;
		min-width: 150px;
		max-width: 150px;
	}
	.move_date{
		width: 120px;
		min-width: 120px;
		max-width: 120px;
	}
	.pay_price{
		width: 150px;
		min-width: 150px;
		max-width: 150px;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />	
	<div class="container_mate">
		<h1 class="point_title">하우스 입주내역</h1>
		<br>
		<hr>
		<br>
		<div class="move_list">
			<table class="table">
				<tr class="table-secondary">
                    <th>No</th>
                    <th>하우스</th>
                    <th>방이름</th>
                    <th>계약일</th>
                    <th>입주일</th>
                    <th>퇴거일</th>
                    <th>결제금액</th>
                </tr>
               <c:forEach items="${list }" var="m" varStatus="i">
               		<tr>
	               		<td>${i.count }</td>
               			<td class="title">
               				<a href="/houseView.do?houseNo=${m.houseNo }">${m.houseTitle }</a>
               			</td>
               			<td class="title">
               				<a href="/roomMoveFrm.do?roomNo=${m.roomNo }&houseNo=${m.houseNo }">${m.roomTitle }</a>
               			</td>
               			<td class="pay_date">${m.payDate }</td>
               			<td class="move_date">${m.moveStart }</td>
               			<td class="move_date">${m.moveEnd }</td>
               			<td class="pay_price">${m.payPrice }</td>
               		</tr>
               </c:forEach>                
			</table>
		</div>
		<div id="pageNavi">${pageNavi }</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>
</html>