<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="container_mate">
		<h1 class="point_title">매출 정산</h1>
		<form action="/salesSearch.do?reqPage=1" method="post">
            <div class="searchBox">
                <div class="chkBox">
                    <table>
                		<tr>
                			<th>정산 여부</th>
                			<td>
		                        <input class="form-check-input" type="checkbox" id="allChk"
			                        <c:if test="${not empty s.status and fn:length(s.status) eq 2}">
			                        	checked
			                        </c:if>
			                    >
		                        <label class="form-check-label" for="allChk">전체</label>
                        	</td>
                        	<td>
		                        <input class="form-check-input" type="checkbox" value="0" id="settleChk1" name="status"
			                        <c:if test="${not empty s.status}">
			                        	<c:forEach items="${s.status }" var="s">
											<c:choose>
					                    		<c:when test="${s eq 0 }">
					                    			checked
					                    		</c:when>
					                    	</c:choose>
			                        	</c:forEach>
			                        </c:if>
			                    >
		                        <label class="form-check-label" for="settleChk1">정산 대기</label>
                        	</td>
                        	<td>
		                        <input class="form-check-input" type="checkbox" value="1" id="settleChk2" name="status"
			                        <c:if test="${not empty s.status}">
			                        	<c:forEach items="${s.status }" var="s">
											<c:choose>
					                    		<c:when test="${s eq 1 }">
					                    			checked
					                    		</c:when>
					                    	</c:choose>
			                        	</c:forEach>
			                        </c:if>
			                    >
		                        <label class="form-check-label" for="settleChk2">정산 완료</label>
                        	</td>
                		</tr>
                		<tr>
                			<th>결제 일자</th>
                			<td colspan="4">
                				<input type="hidden" id="startDate" value="${s.startDate }">
								<input class="input_03 datefilter" type="text" readonly name="startDate" placeholder="검색 시작일">
								<img src="/resources/img/icon/admin_calendar.png">
								~
								<input type="hidden" id="endDate" value="${s.endDate }">
								<input class="input_03 datefilter" type="text" readonly name="endDate" placeholder="검색 종료일">
								<img src="/resources/img/icon/admin_calendar.png">
                        	</td>
                		</tr>
                	</table>
                </div>
                <div class="keywordBox">
                	<input type="hidden" id="type" value="${s.type }">
                    <select class="form-select" name="type">
                        <option value="memberId">결제 회원 아이디</option>
                        <option value="memberId2">정산 회원 아이디</option>
                    </select>
                    <input type="text" class="input_03" name="keyword" value="${s.keyword }">
                    <input type="submit" class="btn btn-primary" value="검색">
                </div>
				<a class="resetSearch">※ 검색 조건 초기화</a>
                <div id="textBox">
                	<p>※ 정산 수수료 : 도와줘요 - 3% / 하우스 입주 - 5%</p>
                </div>
            </div>
        </form>
        <div>
            <table class="table">
                <tr class="table-secondary">
                    <th style="width:80px;">No</th>
                    <th style="width:11%;">구분</th>
                    <th style="width:13%;">정산 회원</th>
                    <th style="width:13%;">결제 회원</th>
                    <th>결제 일자</th>
                    <th>결제 금액</th>
                    <th>정산 금액</th>
                    <th>정산</th>
                </tr>
                <c:choose>
                	<c:when test="${not empty list }">
		                <c:forEach items="${list }" var="s" varStatus="i">
		                	<tr>
		                		<td>${start+i.index }</td>
		                		<td>
		                			<c:choose>
		                				<c:when test="${s.payCategory eq 1}">
		                					도와줘요
		                				</c:when>
		                				<c:when test="${s.payCategory eq 2}">
		                					입주
		                				</c:when>
		                			</c:choose>
		                		</td>
		                		<td>
			                    	<a href="/adminMemberView.do?memberNo=${s.SMemberNo }">
			                    		${s.SMemberId }
			                    	</a>
		                		</td>
		                		<td>
			                    	<a href="/adminMemberView.do?memberNo=${s.PMemberNo }">
			                    		${s.PMemberId }
			                    	</a>
		                		</td>
		                		<td>${s.payDate }</td>
		                		<td>
		                			<fmt:formatNumber value="${s.payPrice }" pattern="#,###"/>원
		                		</td>
		                		<td>
		                			<c:choose>
		                				<c:when test="${s.payCategory eq 1}">
		                					<fmt:formatNumber value="${s.payPrice * 0.97 }" pattern="#,###"/>원
		                				</c:when>
		                				<c:when test="${s.payCategory eq 2}">
		                					<fmt:formatNumber value="${s.payPrice * 0.95 }" pattern="#,###"/>원
		                				</c:when>
		                			</c:choose>
		                		</td>
		                		<td>
		                			<input type="hidden" value="${s.payNo }">
		                			<c:choose>
		                				<c:when test="${s.settlement eq 0}">
		                					<button class="btn btn_out btn_sm">정산</button>
		                				</c:when>
		                				<c:when test="${s.settlement eq 1}">
		                					정산 완료
		                				</c:when>
		                			</c:choose>
		                		</td>
		                	</tr>
		                </c:forEach>
                	</c:when>
                	<c:otherwise>
                		<tr>
                			<td colspan="8"><p>조회 결과가 없습니다.</p></td>
                		</tr>
                	</c:otherwise>
                </c:choose>
            </table>
        </div>
        <div id="pageNavi">${pageNavi }</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="/resources/css/admin/salesMgr.css">
<script type="text/javascript" src="/resources/js/admin/salesSearch.js"></script>
</html>