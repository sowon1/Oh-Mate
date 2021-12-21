<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="container_mate">
		<h1 class="point_title">하우스 정보</h1>
		<div>
			<form action="/adminHouseAllow.do" method="post">
				<input type="hidden" name="houseNo" value="${h.houseNo }">
				<div id="tbl2">
					<table class="table">
						<tr>
							<th style="width:131px;">하우스 이름</th>
							<td colspan="3">${h.houseTitle }</td>
						</tr>
						<tr>
							<th>하우스 이미지</th>
							<td colspan="3">
								<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="false">
									<!-- Indicators -->
								    <ol class="carousel-indicators">
								  		<c:forEach items="${h.photoList }" var="p" varStatus="i">
									  		<c:choose>
									  			<c:when test="${i.index eq 0 }">
												    <li data-target="#carousel-example-generic" data-slide-to="${0+i.index }" class="active"></li>								  		
									  			</c:when>
									  			<c:otherwise>
									  				<li data-target="#carousel-example-generic" data-slide-to="${0+i.index }"></li>
									  			</c:otherwise>								  		
									  		</c:choose>
									  	</c:forEach>
								    </ol>
								    <!-- Wrapper for slides -->
								    <div class="carousel-inner" role="listbox">
									 	<c:forEach items="${h.photoList }" var="p" varStatus="i">
									  		<c:choose>
									  			<c:when test="${i.index eq 0 }">
												    <div class="item active">
												    	<img src="/resources/upload/house/${p.photoPath}">
												        <div class="carousel-caption"></div>
												    </div>
									  			</c:when>
									  			<c:otherwise>
												    <div class="item">
												        <img src="/resources/upload/house/${p.photoPath}">
												        <div class="carousel-caption"></div>
												    </div>
									  			</c:otherwise>								  		
									  		</c:choose>
									  	</c:forEach>
								    </div>
								    <!-- Controls -->
								    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
								        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								    	<span class="sr-only">Previous</span>
								    </a>
								    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
								    	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								    	<span class="sr-only">Next</span>
								    </a>
								</div>
							</td>
						</tr>
						<tr>
							<th>방 정보</th>
							<td colspan="3" id="roomInfo">
								<ul class="roomList">
									<c:forEach items="${h.houseRoomView }" var="r" varStatus="i">
										<li>
											<table class="roomTbl">
												<tr>
													<th style="width:90px;">이름</th>
													<td>${r.roomTitle }</td>
												</tr>
												<tr>
													<th>연락처</th>
													<td>${r.roomPhone }</td>
												</tr>
												<tr>
													<th>타입</th>
													<td>${r.roomPersonnel }</td>
												</tr>
												<tr>
													<th>평수</th>
													<td>${r.roomSize } 평</td>
												</tr>
												<tr>
													<th>보증금</th>
													<td><fmt:formatNumber value="${r.roomCharge }" pattern="#,###"/>원</td>
												</tr>
												<tr>
													<th>월세</th>
													<td><fmt:formatNumber value="${r.roomMonth }" pattern="#,###"/>원</td>
												</tr>
												<tr>
													<th>설명</th>
													<td>${r.roomContent }</td>
												</tr>
												<tr>
													<th>상태</th>
													<td>
														<c:choose>
															<c:when test="${r.roomStatus eq 1 }">
																입주 가능
															</c:when>
															<c:otherwise>
																입주 불가
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</table>
										</li>
									</c:forEach>
								</ul>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="padding:0;">
								<div id="tbl1">
									<table class="table">
										<tr>
											<th style="width:130px;">보증금</th>
											<td style="width:200px;"><fmt:formatNumber value="${h.houseCharge}" pattern="#,###"/>원</td>
											<th style="width:130px;">성별 타입</th>
											<td style="width:200px;">
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
											<th style="width:130px;">주거 형태</th>
											<td style="width:330px;">${h.houseForm }</td>
										</tr>
										<tr>
											<th>방 개수</th>
											<td>${h.houseRoom }개</td>
											<th>임대 만료일</th>
											<td>${h.houseownerDeadline }</td>
											<th>주소</th>
											<td>${h.addressName } ${h.addressRoad } ${h.addressDetail }</td>
										</tr>
										<tr>
											<th>하우스오너</th>
											<td>
												<a href="/adminMemberView.do?memberNo=${h.memberNo }">
													${h.memberId }
												</a>
											</td>
											<th>매매 상태</th>
											<td>
												<c:choose>
													<c:when test="${h.houseSelling eq 1 }">
														판매 중
													</c:when>
													<c:when test="${h.houseSelling eq 2 }">
														판매완료
													</c:when>
												</c:choose>
											</td>
											<th>정산 계좌</th>
											<td>${h.accountInfo }</td>
										</tr>
										<tr>
											<th>제공 시설</th>
											<td colspan="5">
												<input type="hidden" value="${h.houseConvenience }" id="houseOption">
												<table class="chkTbl table">
													<tbody></tbody>
												</table>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<th>하우스 소개</th>
							<td colspan="3">${h.houseContent }</td>
						</tr>
						<tr>
							<th>이용 규칙</th>
							<td colspan="3">${h.houseRule }</td>
						</tr>
						<tr>
							<th>승인 상태</th>
							<td style="width:260px;" colspan="3">
								<input type="hidden" value="${h.houseAllow }" id="houseAllow">
								<select class="form-select" name="houseAllow">
									<option value="1">승인 대기</option>
									<option value="2">승인</option>
									<option value="3">미승인</option>
									<option value="4">승인 재요청</option>
								</select>
							</td>
							<th style="width:131px;" class="noAllow">미승인 사유</th>
							<td id="noAllow" class="noAllow">
								<textarea rows="3" class="form-control" name="refuseReason" maxlength="50">${h.refuseReason }</textarea>
							</td>
						</tr>
					</table>
				</div>
				<div class="btnBox">
					<button type="button" class="btn btn_out">이전</button>
                    <input type="submit" class="btn" value="처리">
				</div>
			</form>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<link rel="stylesheet" href="/resources/css/admin/adminHouseView.css">
<script type="text/javascript" src="/resources/js/admin/adminHouseView.js"></script>
</html>