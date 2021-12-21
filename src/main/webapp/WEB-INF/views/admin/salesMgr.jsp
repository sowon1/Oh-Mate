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
		<h1 class="point_title">매출 정산</h1>
		<form action="" method="post">
            <div class="searchBox">
                <div class="chkBox">
                    <table>
                		<tr>
                			<th>정산 구분</th>
                			<td>
		                        <input class="form-check-input" type="checkbox" id="allChk">
		                        <label class="form-check-label" for="allChk">전체</label>
                        	</td>
                        	<td>
		                        <input class="form-check-input" type="checkbox" value="1" id="waitChk" name="status">
		                        <label class="form-check-label" for="waitChk">미정산</label>
                        	</td>
                        	<td>
		                        <input class="form-check-input" type="checkbox" value="2" id="allowChk" name="status">
		                        <label class="form-check-label" for="allowChk">정산 완료</label>
                        	</td>
                		</tr>
                		<tr>
                			<th>결제 기간</th>
                			<td colspan="4">
	                			<select class="form-select" name="payDate">
	                				<option class="n">기간 선택</option>
	                			</select>
                        	</td>
                		</tr>
                	</table>
                </div>
                <div class="keywordBox">
                    <select class="form-select" name="type">
                        <option value="memberId">결제 회원 아이디</option>
                        <option value="memberId2">정산 회원 아이디</option>
                    </select>
                    <input type="text" class="input_03" name="keyword">
                    <input type="submit" class="btn btn-primary" value="검색">
                </div>
				<a class="resetSearch">※ 검색 조건 초기화</a>
                <div id="textBox">
                	<p>※ 정산 수수료 : 헬프 - 3% / 하우스 입주 - 5%</p>
                </div>
            </div>
        </form>
        <div>
            <table class="table">
                <tr class="table-secondary">
                    <th>
                    	<input class="form-check-input" type="checkbox">
                    </th>
                    <th>구분</th>
                    <th>정산 회원</th>
                    <th>결제 회원</th>
                    <th>결제 일자</th>
                    <th>결제 금액</th>
                    <th>정산 금액</th>
                    <th>정산 여부</th>
                </tr>
                <c:forEach items="${list }" var="s" varStatus="i">
                	<tr>
                		<td>
                			<input class="form-check-input" type="checkbox">
                		</td>
                		<td>
                			<c:choose>
                				<c:when test="${s.payCategory eq 1}">
                					헬프
                				</c:when>
                				<c:when test="${s.payCategory eq 2}">
                					입주
                				</c:when>
                			</c:choose>
                		</td>
                		<td>
	                    	<a href="/adminMemberView.do?memberNo=${s.sMemberNo }">
	                    		${s.sMemberId }
	                    	</a>
                		</td>
                		<td>
	                    	<a href="/adminMemberView.do?memberNo=${s.pMemberNo }">
	                    		${s.pMemberId }
	                    	</a>
                		</td>
                		<td>${s.payDate }</td>
                		<td>${s.payPrice }</td>
                		<td>
                			<c:choose>
                				<c:when test="${s. payCategory eq 1}">
                					${s.payPrice * 0.97 }
                				</c:when>
                				<c:when test="${s. payCategory eq 2}">
                					${s.payPrice * 0.95 }
                				</c:when>
                			</c:choose>
                		</td>
                		<td>
                			<c:choose>
                				<c:when test="${s.settlement eq 0}">
                					미정산
                				</c:when>
                				<c:when test="${s.settlement eq 0}">
                					정산 완료
                				</c:when>
                			</c:choose>
                		</td>
                	</tr>
                </c:forEach>
            </table>
        </div>
        <div id="pageNavi">${pageNavi }</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<link rel="stylesheet" href="/resources/css/admin/helperMgr.css">
</html>