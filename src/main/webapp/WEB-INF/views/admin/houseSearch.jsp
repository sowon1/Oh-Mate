<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate! 하우스 관리</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="container_mate">
		<h1 class="point_title">하우스 관리</h1>
		<form action="/adminHouseSearch.do?reqPage=1" method="post">
            <div class="searchBox">
                <div class="chkBox">
                    <table>
                		<tr>
                			<th>승인 분류</th>
                			<td>
		                        <input class="form-check-input" type="checkbox" id="allChk"
		                        <c:if test="${not empty sh.status and fn:length(sh.status) eq 3}">
		                        	checked
		                        </c:if>
		                        >
		                        <label class="form-check-label" for="allChk">전체</label>
                        	</td>
                        	<td>
		                        <input class="form-check-input" type="checkbox" value="1" id="waitChk" name="status"
		                        <c:if test="${not empty sh.status}">
		                        	<c:forEach items="${sh.status }" var="s">
										<c:choose>
				                    		<c:when test="${s eq 1 }">
				                    			checked
				                    		</c:when>
				                    	</c:choose>
		                        	</c:forEach>
		                        </c:if>
		                        >
		                        <label class="form-check-label" for="waitChk">승인 대기</label>
                        	</td>
                        	<td>
		                        <input class="form-check-input" type="checkbox" value="2" id="allowChk" name="status"
		                        <c:if test="${not empty sh.status}">
		                        	<c:forEach items="${sh.status }" var="s">
										<c:choose>
				                    		<c:when test="${s eq 2 }">
				                    			checked
				                    		</c:when>
				                    	</c:choose>
		                        	</c:forEach>
		                        </c:if>
		                        >
		                        <label class="form-check-label" for="allowChk">승인</label>
                        	</td>
                        	<td colspan="2">
		                        <input class="form-check-input" type="checkbox" value="3" id="noAllowChk" name="status"
		                        <c:if test="${not empty sh.status}">
		                        	<c:forEach items="${sh.status }" var="s">
										<c:choose>
				                    		<c:when test="${s eq 3 }">
				                    			checked
				                    		</c:when>
				                    	</c:choose>
		                        	</c:forEach>
		                        </c:if>
		                        >
		                        <label class="form-check-label" for="noAllowChk">미승인</label>
                        	</td>
                		</tr>
                		<tr>
                			<th>지역구</th>
                			<td colspan="4">
                			<input type="hidden" id="addr" value="${sh.addrName }">
	                			<select class="form-select" name="addrName">
	                				<option class="n">지역구 선택</option>
	                			</select>
                        	</td>
                		</tr>
                	</table>
                </div>
                <div class="keywordBox">
                    <select class="form-select" name="type">
                    	<c:choose>
                    		<c:when test="${sh.type eq 'houseTitle' }">
		                        <option value="houseTitle" selected>하우스 이름</option>
		                        <option value="memberId">오너 아이디</option>
                    		</c:when>
                    		<c:when test="${sh.type eq 'memberId' }">
		                        <option value="houseTitle">하우스 이름</option>
		                        <option value="memberId" selected>오너 아이디</option>
                    		</c:when>
                    	</c:choose>
                    </select>
                    <input type="text" class="input_03" name="keyword" value="${sh.keyword }">
                    <input type="submit" class="btn btn-primary" value="검색">
                </div>
				<a class="resetSearch">※ 검색 조건 초기화</a>
            </div>
        </form>
        <div>
            <table class="table">
                <tr class="table-secondary">
                    <th style="width:10%;">No</th>
                    <th style="width:10%;">하우스오너</th>
                    <th style="width:260px;">하우스 이름</th>
                    <th style="width:340px;">주소</th>
                    <th style="width:10%;">임대 만료일</th>
                    <th style="width:10%;">매매 상태</th>
                    <th style="width:10%;">승인 상태</th>
                </tr>
                <c:choose>
                	<c:when test="${not empty list }">
		                <c:forEach items="${list }" var="h" varStatus="i">
		                	<tr>
			                    <td>${start+i.index }</td>
			                    <td>
			                    	<a href="/adminMemberView.do?memberNo=${h.memberNo }">${h.memberId }</a>
			                    </td>
			                    <td class="titleTd">
			                    	<a href="/adminHouseView.do?houseNo=${h.houseNo }" class="houseModal">${h.houseTitle }</a>
			                    </td>
			                    <td class="addrTd">${h.addressName } ${h.addressRoad } ${h.addressDetail }</td>
			                    <td>${h.houseownerDeadline }</td>
			                    <td>
			                    	<c:choose>
			                    		<c:when test="${h.houseSelling eq 1}">
			                    			판매중
			                    		</c:when>
			                    		<c:when test="${h.houseSelling eq 2}">
			                    			판매완료
			                    		</c:when>
			                    	</c:choose>
			                    </td>
			                    <td>
			                    	<c:choose>
			                    		<c:when test="${h.houseAllow eq 1}">
			                    			승인 대기
			                    		</c:when>
			                    		<c:when test="${h.houseAllow eq 2}">
			                    			승인
			                    		</c:when>
			                    		<c:when test="${h.houseAllow eq 3}">
			                    			미승인
			                    		</c:when>
			                    	</c:choose>
			                    </td>
		                	</tr>
		                </c:forEach>
                	</c:when>
                	<c:otherwise>
                		<tr>
                			<td colspan="7"><p>조회 결과가 없습니다.</p></td>
                		</tr>
                	</c:otherwise>
                </c:choose>
            </table>
        </div>
        <div id="pageNavi">${pageNavi }</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<link rel="stylesheet" href="/resources/css/admin/houseMgr.css">
<script type="text/javascript" src="/resources/js/admin/houseMgr.js"></script>
</html>