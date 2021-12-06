<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate! 회원 관리</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<div class="container_mate">
		<h1>회원 관리</h1>
		<form action="/adminMemberSearch.do?reqPage=1" method="post">
            <div class="searchBox">
                <div>
                    <div>
                        <p>검색 분류</p>
                    </div>
                    <div>
                        <input class="form-check-input" type="checkbox" value="1" id="mateChk" name="level">
                        <label class="form-check-label" for="mateChk">메이트</label>
                    </div>
                    <div>
                        <input class="form-check-input" type="checkbox" value="2" id="houseownerChk" name="level">
                        <label class="form-check-label" for="houseownerChk">하우스오너</label>
                    </div>
                    <div>
                        <input class="form-check-input" type="checkbox" value="4" id="helperChk" name="level">
                        <label class="form-check-label" for="helperChk">헬퍼</label>
                    </div>
                    <div>
                        <input class="form-check-input" type="checkbox" value="3" id="blockChk" name="level">
                        <label class="form-check-label" for="blockChk">계정정지</label>
                    </div>
                </div>
                <div class="keywordBox">
                    <select class="form-select" name="type">
                        <option value="memberId">아이디</option>
                        <option value="memberName">이름</option>
                        <option value="phone">전화번호</option>
                    </select>
                    <input type="text" class="input_03" name="keyword">
                    <input type="submit" class="btn btn-primary" value="검색">
                </div>
            </div>
        </form>
        <div>
            <table class="table">
                <tr class="table-secondary">
                    <th style="width:10%;">No</th>
                    <th style="width:15%;">등급</th>
                    <th style="width:20%;">아이디</th>
                    <th style="width:20%;">이름</th>
                    <th style="width:20%;">전화번호</th>
                    <th style="width:15%;">가입일</th>
                </tr>
                <c:forEach items="${list }" var="m" varStatus="i">
                	<tr>
	                    <td>${start+i.index }</td>
	                    <td>
	                    	<c:choose>
	                    		<c:when test="${m.memberLevel eq 0}">
	                    			관리자
	                    		</c:when>
	                    		<c:when test="${m.memberLevel eq 1 or m.memberLevel eq 5}">
	                    			메이트
	                    		</c:when>
	                    		<c:when test="${m.memberLevel eq 2}">
	                    			하우스오너
	                    		</c:when>
	                    		<c:when test="${m.memberLevel eq 4}">
	                    			헬퍼
	                    		</c:when>
	                    		<c:when test="${m.memberLevel eq 3 or m.memberLevel eq 6 or m.memberLevel eq 7}">
	                    			계정정지
	                    		</c:when>
	                    	</c:choose>
	                    </td>
	                    <td>
	                    	<a href="/adminMemberView.do?memberNo=${m.memberNo }">${m.memberId }</a>
	                    </td>
	                    <td>${m.memberName }</td>
	                    <td>${m.phone }</td>
	                    <td>${m.enrollDate }</td>
                	</tr>
                </c:forEach>
            </table>
        </div>
        <div id="pageNavi">${pageNavi }</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
<link rel="stylesheet" href="/resources/css/admin/memberMgr.css">
</html>