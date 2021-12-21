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
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="container_mate">
		<h1 class="point_title">헬퍼 정보</h1>
		<div>
			<form action="/adminHelperStatus.do" method="post">
				<input type="hidden" name="helperNo" value="${hp.helperNo }">
				<table class="table">
					<tr>
						<th style="width:130px;">헬퍼 닉네임</th>
						<td style="width:320px;">${hp.helperName }</td>
						<th style="width:130px;">헬퍼 프로필</th>
						<td colspan="3">
							<img src="/resources/upload/helper/${hp.helperFilepath }">
						</td>
					</tr>
					<tr>
						<th>활동 지역</th>
						<td>
							<ol>
								<c:forEach items="${hp.addr }" var="a">
									<li>
										${a.addressName } ${a.addressRoad }
									</li>
								</c:forEach>
							</ol>
						</td>
						<th>활동 분야</th>
						<td colspan="3">
							<input type="hidden" value="${hp.helperCategory }" id="category">
							<ul id="cate"></ul>
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
                			<a href="/adminMemberView.do?memberNo=${hp.memberNo }">
	                    		${hp.memberId }
	                    	</a>
	                    </td>
						<th>이름</th>
						<td style="width:208px;">${hp.memberName }</td>
						<th style="width:130px;">등급</th>
						<td style="width:208px;">
                			<c:choose>
                				<c:when test="${hp.memberLevel eq 1 }">
                					메이트
                				</c:when>
                				<c:when test="${hp.memberLevel eq 4 }">
                					헬퍼
                				</c:when>
                				<c:when test="${hp.memberLevel eq 5 }">
                					헬퍼 활동 불가
                				</c:when>
                				<c:when test="${hp.memberLevel eq 3 or hp.memberLevel eq 6 or hp.memberLevel eq 7 }">
                					계정 정지
                				</c:when>
                			</c:choose>
						</td>
					</tr>
					<tr>
						<th>정산 계좌</th>
						<td>${hp.accountInfo }</td>
						<th>이동 수단</th>
						<td>
							<c:choose>
								<c:when test="${hp.helperRide eq 1 }">
									자동차
								</c:when>
								<c:when test="${hp.helperRide eq 2 }">
									오토바이
								</c:when>
								<c:when test="${hp.helperRide eq 3 }">
									전동 킥보드
								</c:when>
								<c:when test="${hp.helperRide eq 4 }">
									자전거
								</c:when>
								<c:when test="${hp.helperRide eq 5 }">
									도보
								</c:when>
							</c:choose>
						</td>
						<th>활동 시간</th>
						<td>${hp.helperStartTime } ~ ${hp.helperEndTime }</td>
					</tr>
					<tr>
						<th>자기소개</th>
						<td colspan="5">${hp.helperIntro }</td>
					</tr>
					<tr>
						<th>자격증</th>
						<td colspan="5">${hp.helperCredit }</td>
					</tr>
					<tr>
						<th>승인 상태</th>
						<td>
							<input type="hidden" id="status" value="${hp.helperStatus }" >
							<select class="form-select" name="helperStatus">
								<option value="1">승인 대기</option>
								<option value="2">승인</option>
								<option value="3">미승인</option>
								<option value="4">승인 재요청</option>
							</select>
						</td>
						<th class="noAllow">미승인 사유</th>
						<td colspan="3" id="noAllow" class="noAllow">
							<textarea class="form-control" rows="3" name="helperRefuse" maxlength="50">${hp.helperRefuse }</textarea>
						</td>
					</tr>
				</table>
				<div class="btnBox">
					<button type="button" class="btn btn_out">이전</button>
		            <input type="submit" class="btn" value="처리">
				</div>
			</form>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<link rel="stylesheet" href="/resources/css/admin/adminHelperView.css">
<script type="text/javascript" src="/resources/js/admin/adminHelperView.js"></script>
</html>