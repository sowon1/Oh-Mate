<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate! 신고 관리</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="container_mate">
		<h1>신고 관리</h1>
		<form action="/reportSearch.do?reqPage=1" method="post">
            <div class="searchBox">
            	<div>
	                <div class="chkBox">
	                	<table>
	                		<tr>
	                			<th>신고 상태</th>
	                			<td>
	                				<input class="form-check-input" type="checkbox" id="allChk1"
			                        <c:if test="${not empty sr.status and fn:length(sr.status) eq 3}">
			                        	checked
			                        </c:if>
			                        >
	                        		<label class="form-check-label" for="allChk1">전체</label>
	                        	</td>
	                        	<td>
			                        <input class="form-check-input" type="checkbox" value="1" id="chk1" name="status"
			                        <c:if test="${not empty sr.status}">
			                        	<c:forEach items="${sr.status }" var="s">
											<c:choose>
					                    		<c:when test="${s eq 1 }">
					                    			checked
					                    		</c:when>
					                    	</c:choose>
			                        	</c:forEach>
			                        </c:if>
			                        >
			                        <label class="form-check-label" for="chk1">미처리</label>
	                        	</td>
	                        	<td>
			                        <input class="form-check-input" type="checkbox" value="2" id="chk2" name="status"
			                        <c:if test="${not empty sr.status}">
			                        	<c:forEach items="${sr.status }" var="s">
											<c:choose>
					                    		<c:when test="${s eq 2 }">
					                    			checked
					                    		</c:when>
					                    	</c:choose>
			                        	</c:forEach>
			                        </c:if>
			                        >
			                        <label class="form-check-label" for="chk2">처리완료</label>
	                        	</td>
	                        	<td colspan="2">
			                        <input class="form-check-input" type="checkbox" value="3" id="chk3" name="status"
									<c:if test="${not empty sr.status}">
			                        	<c:forEach items="${sr.status }" var="s">
											<c:choose>
					                    		<c:when test="${s eq 3 }">
					                    			checked
					                    		</c:when>
					                    	</c:choose>
			                        	</c:forEach>
			                        </c:if>
			                        >
			                        <label class="form-check-label" for="chk3">허위신고</label>
	                        	</td>
	                		</tr>
	                		<tr>
	                			<th>신고 분류</th>
	                			<td>
			                        <input class="form-check-input" type="checkbox" id="allChk2"
									<c:if test="${not empty sr.cate and fn:length(sr.cate) eq 4}">
			                        	checked
			                        </c:if>
			                        >
			                        <label class="form-check-label" for="allChk2">전체</label>
	                        	</td>
	                        	<td>
			                        <input class="form-check-input" type="checkbox" value="1" id="chk4" name="cate"
			                        <c:if test="${not empty sr.cate}">
			                        	<c:forEach items="${sr.cate}" var="c">
											<c:choose>
					                    		<c:when test="${c eq 1 }">
					                    			checked
					                    		</c:when>
					                    	</c:choose>
			                        	</c:forEach>
			                        </c:if>
			                        >
			                        <label class="form-check-label" for="chk4">헬퍼</label>
	                        	</td>
	                        	<td>
			                        <input class="form-check-input" type="checkbox" value="2" id="chk5" name="cate"
			                        <c:if test="${not empty sr.cate}">
			                        	<c:forEach items="${sr.cate}" var="c">
											<c:choose>
					                    		<c:when test="${c eq 2 }">
					                    			checked
					                    		</c:when>
					                    	</c:choose>
			                        	</c:forEach>
			                        </c:if>
			                        >
			                        <label class="form-check-label" for="chk5">채팅</label>
	                        	</td>
	                        	<td>
			                        <input class="form-check-input" type="checkbox" value="3" id="chk6" name="cate"
			                        <c:if test="${not empty sr.cate}">
			                        	<c:forEach items="${sr.cate}" var="c">
											<c:choose>
					                    		<c:when test="${c eq 3 }">
					                    			checked
					                    		</c:when>
					                    	</c:choose>
			                        	</c:forEach>
			                        </c:if>
			                        >
			                        <label class="form-check-label" for="chk6">게시글</label>
	                        	</td>
	                        	<td>
			                        <input class="form-check-input" type="checkbox" value="4" id="chk7" name="cate"
			                        <c:if test="${not empty sr.cate}">
			                        	<c:forEach items="${sr.cate}" var="c">
											<c:choose>
					                    		<c:when test="${c eq 4 }">
					                    			checked
					                    		</c:when>
					                    	</c:choose>
			                        	</c:forEach>
			                        </c:if>
			                        >
			                        <label class="form-check-label" for="chk7">댓글</label>
	                        	</td>
	                		</tr>
	                	</table>
	                </div>
            	</div>
                <div class="keywordBox">
                    <select class="form-select" name="type">
                    	<c:choose>
                    		<c:when test="${sr.type eq 'reporterId' }">
		                        <option value="reporterId" selected>신고자 아이디</option>
		                        <option value="atackerId">회원 아이디</option>
		                        <option value="reportNum">콘텐츠 번호</option>               			
                    		</c:when>
                    		<c:when test="${sr.type eq 'atackerId' }">
		                        <option value="reporterId">신고자 아이디</option>
		                        <option value="atackerId" selected>회원 아이디</option>
		                        <option value="reportNum">콘텐츠 번호</option>               			
                    		</c:when>
                    		<c:when test="${sr.type eq 'reportNum' }">
		                        <option value="reporterId">신고자 아이디</option>
		                        <option value="atackerId">회원 아이디</option>
		                        <option value="reportNum" selected>콘텐츠 번호</option>               			
                    		</c:when>
                    	</c:choose>
                    </select>
                    <input type="text" class="input_03" name="keyword" value="${sr.keyword }">
                    <input type="submit" class="btn btn-primary" value="검색">
                </div>
            </div>
        </form>
        <div>
            <table class="table">
                <tr class="table-secondary">
                    <th style="">No</th>
                    <th style="">회원 아이디</th>
                    <th style="">신고자 아이디</th>
                    <th style="">분류</th>
                    <th style="">콘텐츠번호</th>
                    <th style="">신고일</th>
                    <th style="">상태</th>
                </tr>
                <c:choose>
                	<c:when test="${not empty list }">
		                <c:forEach items="${list }" var="rp" varStatus="i">
		                	<tr>
			                    <td>${start+i.index }</td>
			                    <td>
			                    	<a href="/adminMemberView.do?memberNo=${rp.atacker }">${rp.atackerId }</a>
			                    </td>
			                    <td>
			                    	<a href="/adminMemberView.do?memberNo=${rp.reporter }">${rp.reporterId }</a>
			                    </td>
			                    <td>
			                    	<c:choose>
			                    		<c:when test="${rp.reportCategory eq 1}">
			                    			헬퍼
			                    		</c:when>
			                    		<c:when test="${rp.reportCategory eq 2}">
			                    			채팅
			                    		</c:when>
			                    		<c:when test="${rp.reportCategory eq 3}">
			                    			게시글
			                    		</c:when>
			                    		<c:when test="${rp.reportCategory eq 4}">
			                    			댓글
			                    		</c:when>
			                    	</c:choose>
			                    </td>
			                    <td>${rp.reportNum }</td>
			                    <td>${rp.reportDate }</td>
			                    <td>
									<c:choose>
			                    		<c:when test="${rp.reportStatus eq 1}">
			                    			미처리
			                    		</c:when>
			                    		<c:when test="${rp.reportStatus eq 2}">
			                    			처리완료
			                    		</c:when>
			                    		<c:when test="${rp.reportStatus eq 3}">
			                    			허위신고
			                    		</c:when>
			                    	</c:choose>
								</td>
		                	</tr>
		                </c:forEach>
                	</c:when>
                	<c:otherwise>
                		<tr>
                			<td colspan="6"><p>조회 결과가 없습니다.</p></td>
                		</tr>
                	</c:otherwise>
                </c:choose>
                
            </table>
        </div>
        <div id="pageNavi">${pageNavi }</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<link rel="stylesheet" href="/resources/css/admin/reportMgr.css">
<script type="text/javascript" src="/resources/js/admin/reportMgr.js"></script>
</html>