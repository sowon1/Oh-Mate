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
		<!-- <input type="hidden" name="pWriter" value="${sessionScope.m.memberId }"> -->
			<tr class="table-primary">
				<th>제목</th>
				<td colspan="2" class="tdStyle" style="padding-top:11px;">${b.boardTitle }</td>
			    <td>
			    	<a href="/reportFrm" class="bell"><i class="far fa-bell"></i> 신고하기</a>
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
			    		<button class="btn" id="boardBack" onclick="history.back()" >이전화면</button>
			    	</div>
			    	</c:otherwise>
		    	</c:choose>
		    	</td>
		    </tr>
		</table>
		</div>
		
		<!-- 댓글 작성 -->
		<c:choose>
		<c:when test="${m != null && (m.memberLevel ne 3)}">
		<div>
			<form action="/insertComment.do" method="post">
				<ul style="padding-left:100px;">
					<li>
						<div style="float:left; padding-right:15px;">
						<i class="far fa-user fa-4x"></i>
						</div>
					</li>
					<li><div style="float:left;">
						<input type="hidden" name="CommentLevel" value="1">
						<input type="hidden" name="commentWriter" value="${m.memberId }">
						<input type="hidden" name="boardNo" value="${b.boardNo }">
						<input type="hidden" name="boardRef" value="0">
						<input type="hidden" name="status" value="1">
						<textarea name="commentContent" class="form-control" style="width:800px;"></textarea>
						</div>
					</li>	
					<li>
						<button type="submit" class="btn subBtn">등록</button>
					</li>
				</ul>	
			</form>
		</div>
		</c:when>
		</c:choose>
		
		<!-- 댓글 출력 -->
		<div class="commentBox">
			<c:forEach items="${list }" var="c">
				<c:if test="${c.commentLevel eq 1}">
					<li>
						<i class="far fa-user fa-4x"></i>
						<p>${c.commentWriter }</p>
						<p>${c.regDate }</p>
					</li>
					<li>
						<p>${c.commentContent }</p>
					</li>
					<c:choose>
						<c:when test="${m.memberId eq c.commentWriter}">
							<a href="javascript:void(0)">수정</a>
							<a href="javascript:void(0)">삭제</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0)">답글달기</a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${m != null }">
							<form action="/insertComment.do">	
								<input type="hidden" name="CommentLevel" value="2">
								<input type="hidden" name="commentWriter" value="${m.memberId }">
								<input type="hidden" name="boardNo" value="${b.boardNo }">
								<input type="hidden" name="boardRef" value="${c.commentNo }">
								<input type="hidden" name="status" value="1">
								<textarea name="commentContent" class="form-control" style="width:800px;"></textarea>
								<div>
									<button type="submit" class="btn">등록</button>
									<button type="reset" class="btn Cancel">취소</button>
								</div>
							</form>
						</c:when>
					</c:choose>
				</c:if> <!-- 일반댓글 if문 -->
			</c:forEach> <!-- 일반댓글 foreach문 -->
		</div>

	</div>
	
	

<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>