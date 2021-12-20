<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h1 class="point_title">헬퍼 신청 관리</h1>
		<form action="/adminHelperSearch.do?reqPage=1" method="post">
            <div class="searchBox">
            	<div>
	                <div class="chkBox">
	                	<table>
	                		<tr>
	                			<th>승인 분류</th>
	                			<td>
	                				<input class="form-check-input" type="checkbox" id="allChk1"
				                        <c:if test="${not empty s.status and fn:length(s.status) eq 3}">
				                        	checked
				                        </c:if>
			                        >
	                        		<label class="form-check-label" for="allChk1">전체</label>
	                        	</td>
	                        	<td>
			                        <input class="form-check-input" type="checkbox" value="1" id="chk1" name="status"
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
			                        <label class="form-check-label" for="chk1">승인 대기</label>
	                        	</td>
	                        	<td>
			                        <input class="form-check-input" type="checkbox" value="2" id="chk2" name="status"
				                        <c:if test="${not empty s.status}">
				                        	<c:forEach items="${s.status }" var="s">
												<c:choose>
						                    		<c:when test="${s eq 2 }">
						                    			checked
						                    		</c:when>
						                    	</c:choose>
				                        	</c:forEach>
				                        </c:if>
			                        >
			                        <label class="form-check-label" for="chk2">승인</label>
	                        	</td>
	                        	<td>
			                        <input class="form-check-input" type="checkbox" value="3" id="chk3" name="status"
				                        <c:if test="${not empty s.status}">
				                        	<c:forEach items="${s.status }" var="s">
												<c:choose>
						                    		<c:when test="${s eq 3 }">
						                    			checked
						                    		</c:when>
						                    	</c:choose>
				                        	</c:forEach>
				                        </c:if>
			                        >
			                        <label class="form-check-label" for="chk3">미승인</label>
	                        	</td>
	                		</tr>
	                		<tr>
	                			<th>지역구</th>
	                			<td colspan="4">
	                				<input type="hidden" id="addr" value="${s.addrName }">
		                			<select class="form-select" name="addrName">
		                				<option class="n">지역구 선택</option>
		                			</select>
	                        	</td>
	                		</tr>
	                	</table>
	                </div>
            	</div>
                <div class="keywordBox">
                   	<input type="hidden" id="type" value="${s.type }">
                    <select class="form-select" name="type">
                        <option value="helperName">헬퍼 닉네임</option>
                        <option value="memberId">아이디</option>
                        <option value="memberName">이름</option>
                    </select>
                    <input type="text" class="input_03" name="keyword" value="${s.keyword }">
                    <input type="submit" class="btn btn-primary" value="검색">
                </div>
                <a class="resetSearch">※ 검색 조건 초기화</a>
                <div id="textBox">
                	<p>※ 활동 불가 : 헬퍼 활동 중 신고 1회 이상 자격 박탈 / 계정 정지 - 신고 3회 이상 누적</p>
                </div>
            </div>
        </form>
        <div>
            <table class="table">
                <tr class="table-secondary">
                    <th style="width:9%;">No</th>
                    <th style="width:12%;">아이디</th>
                    <th style="width:13%;">이름</th>
                    <th style="width:17%;">헬퍼 닉네임</th>
                    <th style="width:20%;">활동 지역</th>
                    <th style="width:12%;">등급</th>
                    <th style="width:17%;">승인 상태</th>
                </tr>
                <c:choose>
                	<c:when test="${not empty list }">
		                <c:forEach items="${list }" var="hp" varStatus="i">
		                	<tr>
		                		<td>${start+i.index }</td>
		                		<td>
		                			<a href="/adminMemberView.do?memberNo=${hp.memberNo }">
			                    		${hp.memberId }
			                    	</a>
		                		</td>
		                		<td>${hp.memberName }</td>
		                		<td>
		                			<a href="/adminHelperView.do?helperNo=${hp.helperNo}">
		                				${hp.helperName }
			                    	</a>
		                		</td>
		                		<td>${hp.addressName }</td>
		                		<td>
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
		                		<td>
		                			<c:choose>
		                				<c:when test="${hp.helperStatus eq 1 }">
		                					승인 대기
		                				</c:when>
		                				<c:when test="${hp.helperStatus eq 2 }">
		                					승인
		                				</c:when>
		                				<c:when test="${hp.helperStatus eq 3 }">
		                					미승인
		                				</c:when>
		                				<c:when test="${hp.helperStatus eq 4 }">
		                					승인 재요청
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
<link rel="stylesheet" href="/resources/css/admin/helperMgr.css">
<script type="text/javascript" src="/resources/js/admin/helperMgr.js"></script>
</html>