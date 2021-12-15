<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate! 하우스 관리</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<div class="container_mate">
		<h1 class="point_title">하우스 관리</h1>
		<form action="/adminHouseSearch.do?reqPage=1" method="post">
            <div class="searchBox">
                <div>
                    <div>
                        <p>승인 분류</p>
                    </div>
                    <div>
                        <input class="form-check-input" type="checkbox" id="allChk">
                        <label class="form-check-label" for="allChk">전체</label>
                    </div>
                    <div>
                        <input class="form-check-input" type="checkbox" value="1" id="waitChk" name="status">
                        <label class="form-check-label" for="waitChk">승인 대기</label>
                    </div>
                    <div>
                        <input class="form-check-input" type="checkbox" value="2" id="allowChk" name="status">
                        <label class="form-check-label" for="allowChk">승인</label>
                    </div>
                    <div>
                        <input class="form-check-input" type="checkbox" value="3" id="noAllowChk" name="status">
                        <label class="form-check-label" for="noAllowChk">미승인</label>
                    </div>
                </div>
                <div class="keywordBox">
                    <select class="form-select" name="type">
                        <option value="memberId">오너 아이디</option>
                        <option value="houseTitle">하우스 이름</option>
                    </select>
                    <input type="text" class="input_03" name="keyword">
                    <input type="submit" class="btn btn-primary" value="검색">
                </div>
            </div>
        </form>
        <div>
            <table class="table">
                <tr class="table-secondary">
                    <th style="">No</th>
                    <th style="">하우스오너</th>
                    <th style="">하우스 이름</th>
                    <th style="">주거형태</th>
                    <th style="">임대만료일</th>
                    <th style="">매매 상태</th>
                    <th style="">승인 상태</th>
                </tr>
                <c:forEach items="${list }" var="h" varStatus="i">
                	<tr>
	                    <td>${start+i.index }</td>
	                    <td>
	                    	<a href="/adminMemberView.do?memberNo=${h.memberNo }">${h.memberId }</a>
	                    </td>
	                    <td>${h.houseTitle }</td>
	                    <td>${h.houseForm }</td>
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
            </table>
        </div>
        <div id="pageNavi">${pageNavi }</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
<script>
</script>
<link rel="stylesheet" href="/resources/css/admin/houseMgr.css">
<script type="text/javascript" src="/resources/js/admin/houseMgr.js"></script>
</html>