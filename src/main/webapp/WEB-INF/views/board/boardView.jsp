<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/mateWriteFrm.css">
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="container_mate">
		<div class="container_mate">
		<h1>오늘부터 메이트</h1>
		<br><hr><br>
		<table class="table table-hover">
		<c:forEach items="${list }" var="b">
		<input type="hidden" name="pWriter" value="${sessionScope.m.memberId }">
			<tr class="table-primary">
				<th>제목</th>
				<td colspan="2" class="tdStyle" style="padding-top:11px;">${b.boardTitle }</td>
			    <td>
			    	<button type="button" class="btn btn-primary btn-sm" id="postBtn">쪽지보내기</button>
			    	<a href="/reportFrm" class="bell" ><i class="far fa-bell"></i> 신고하기</a>
			    </td>
		    </tr>
		    <tr>
			    <th>작성자</th>
			    <td class="tdStyle">
			    	${b.boardWriter }
			    	<input type="hidden" name="boardWriter" value="${sessionScope.m.memberId}">
			    </td>
			    <th>작성일</th>
			    <td>${b.regDate }</td>
		    </tr>
		    <tr>
			    <th>첨부파일</th>
			    <td class="tdStyle">
					<img src="/resources/img/icon/file.png" class="delFile" style="width:10px;">&ensp;
			    	<span class="delFile">${b.filePath }</span>
				</td>
			    <th>조회수</th>
			    <td>${b.readCount }</td>
		    </tr>
		    <tr>
		    	<th>내용</th>
		    	<td colspan="3" style="margin-top:0px; margin-bottom:0px; height:390px; vertical-align: top; text-align: left;">
					${b.boardContent}
				</td>
		    </tr>
		    <tr>
		    	<td colspan="4">
		    	<c:choose>
		    		<c:when test="${not empty sessionScope.m && sessionScope.m.memberId eq b.boardWriter}">
			    	<div class="submitBtn">
			    		<a href="/boardUpdateFrm.do?boardNo=${b.boardNo }" class="btn" id="boardUpdate">수정하기</a>
			    		<a href="/boardDelete.do?boardNo=${b.boardNo }" class="btn" id="deleteBtn">삭제하기</a>
			    	</div>
			    	</c:when>
			    	<c:otherwise>
			    	<div class="submitBtn">
			    		<button onclick="history.back()" class="btn" id="boardBack">이전화면</button>
			    	</div>
			    	</c:otherwise>
		    	</c:choose>
		    	</td>
		    </tr>
		</c:forEach>	
		</table>
		</div>
	</div>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>