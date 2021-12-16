<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate! 하우스 정보</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="container_mate">
		<h1 class="point_title">하우스 정보</h1>
		<div>
			<form action="#">
				<table class="table">
					<tr class="table-active_mate">
						<th>보증금</th>
						<td>${h.houseCharge }원</td>
						<th>성별 타입</th>
						<td>
							<c:choose>
								<c:when test="${h.houseGender eq 1 }">
									남성전용
								</c:when>
								<c:when test="${h.houseGender eq 2 }">
									여성전용
								</c:when>
								<c:when test="${h.houseGender eq 3 }">
									남녀공용
								</c:when>
							</c:choose>
						</td>
						<th>주거 형태</th>
						<td>${h.houseForm }</td>
					</tr>
					<tr class="table-active_mate">
						<th>방 개수</th>
						<td>${h.houseRoom }개</td>
						<th>임대 만료일</th>
						<td>${h.houseownerDeadline }</td>
						<th>주소</th>
						<td>${h.addressName } ${h.addressRoad } ${h.addressDetail }</td>
					</tr>
					<tr class="table-active_mate">
						<th>하우스오너</th>
						<td>${h.memberId }</td>
						<th>매매 상태</th>
						<td>
							<c:choose>
								<c:when test="${h.houseSelling eq 1 }">
									판매중
								</c:when>
								<c:when test="${h.houseSelling eq 2 }">
									판매완료
								</c:when>
							</c:choose>
						</td>
						<th>정산 계좌</th>
						<td>${h.accountInfo }</td>
					</tr>
					<tr class="table-active_mate">
						<th>하우스 이름</th>
						<td colspan="5">${h.houseTitle }</td>
					</tr>
					<tr class="table-active_mate">
						<th>방 정보</th>
						<td colspan="5"></td>
					</tr>
					<tr class="table-active_mate">
						<th>제공 시설</th>
						<td colspan="5">${h.houseConvenience }</td>
					</tr>
					<tr class="table-active_mate">
						<th>하우스 이미지</th>
						<td colspan="5"></td>
					</tr>
					<tr class="table-active_mate">
						<th>하우스 소개</th>
						<td colspan="5">${h.houseContent }</td>
					</tr>
					<tr class="table-active_mate">
						<th>이용 규칙</th>
						<td colspan="5">${h.houseRule }</td>
					</tr>
					<tr class="table-active_mate">
						<th>승인 상태</th>
						<td colspan="5">
							<c:choose>
								<c:when test="${h.houseAllow eq 1 }">
									승인 대기
								</c:when>
								<c:when test="${h.houseAllow eq 2 }">
									승인
								</c:when>
								<c:when test="${h.houseAllow eq 3 }">
									미승인
								</c:when>
							</c:choose>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<link rel="stylesheet" href="/resources/css/admin/adminHouseView.css">
</html>