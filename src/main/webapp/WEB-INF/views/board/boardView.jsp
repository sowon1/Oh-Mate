<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 상세보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/resources/css/board/mateWriteFrm.css">
<script type="text/javascript" src="/resources/js/board/boardView.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div class="container_mate">
		<h1>오늘부터 메이트</h1>
		<br>
		<hr>
		<br>
		<table class="table table-hover">
			<tr class="table-primary">
				<th>제목</th>
				<td class="tdStyle" style="padding-top: 11px;">${b.boardTitle }</td>
				<th></th><td></td>
				<th>조회수</th>
				<td>${b.readCount }</td>
				<td>
					<a href="/reportFrm" class="bell">
					<i class="far fa-bell"></i> 신고하기</a>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td class="tdStyle">${b.boardWriter } <input type="hidden" name="boardWriter" value="${sessionScope.m.memberId}"></td>
				<th></th><td></td>
				<th>작성일</th>
				<td colspan="2">${b.regDate }</td>
			</tr>
			<tr>
				<th></th>
				<td></td>

			</tr>
			<tr>
				<th>내용</th>
				<td colspan="7" style="margin-top: 0px; margin-bottom: 0px; height: 390px; vertical-align: top; text-align: left;">
					${b.boardContent}
				</td>
			</tr>
			<tr>
				<td colspan="8">
					<c:choose>
						<c:when test="${not empty sessionScope.m && sessionScope.m.memberId eq b.boardWriter}">
							<div class="submitBtn">
								<button class="btn" onclick="history.back()" style="padding: 0px;">이전화면</button>
								<a href="/boardUpdateFrm.do?boardNo=${b.boardNo }" class="btn" id="boardUpdate">수정하기</a> 
								<a href="/boardDelete.do?boardNo=${b.boardNo }" class="btn" id="deleteBtn" >삭제하기</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="submitBtn">
								<button class="btn" id="boardBack" onclick="history.back()">이전화면</button>
							</div>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>

		<!-- 댓글 작성 -->
		<c:choose>
			<c:when
				test="${m != null && (m.memberLevel ne 3 || m.memberLevel ne 6 || m.memberLevel ne 7)}">
				<h4>댓글</h4>
				<hr>
				<div>
					<form action="/insertComment.do" method="post">
						<div class="card mb-2">
							<div class="card-header bg-light">
								<i class="fa fa-comment fa"></i> REPLY
							</div>
							<div class="card-body">
								<ul class="list-group list-group-flush">
									<li>
										<div class="form-inline mb-2" >
											<img src="resources/img/icon/profile.png" class="memberImg" id="memberImd">
											<div style="margin-left:17px;">${m.memberId }</div>
										</div> 
									<li>
										<div>
											<input type="hidden" name="CommentLevel" value="1"> 
											<input type="hidden" name="commentWriter" value="${m.memberId }">
											<input type="hidden" name="boardNo" value="${b.boardNo }">
											<input type="hidden" name="boardRef" value="0"> 
											<input type="hidden" name="status" value="1">
											<input type="hidden" name="commentSecret" value="1">
											<textarea name="commentContent" class="form-control" id="commentcont" rows="3" cols="150" placeholder="댓글을 입력해주세요."></textarea>	
										</div>
									</li>
									<li>	
								      <div class="form-check" style="float: right; margin-top: 7px; margin-top:10px;">
								        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
								        <label class="form-check-label" for="flexCheckChecked" style="padding-right:10px;">
								          	비밀댓글
								        </label>
								        <button type="submit" class="btn subBtn" id="secretBtn">등록</button>
								      </div>
									</li>
								</ul>
							</div>
						</div>
					</form>
				</div>
			</c:when>
		</c:choose>
		<br><br>

		<!-- 댓글 출력 -->
		<div style="border: 1px solid #E1E1E1;}">
			<c:forEach items="${list }" var="c">
			<c:if test="${c.commentLevel eq 1}">
				<ul class="list-group list-group-flush">
					<li>
						<div class="form-inline mb-2">
							<c:choose>
								<c:when test="${empty fileImg}">
									<img src="resources/img/icon/profile.png" class="memberIm">
								</c:when>
								<c:otherwise>
									<img src="resources/upload/member/${fileImg}" class="memberIm">
								</c:otherwise>
							</c:choose>
							<p class="cw">${c.commentWriter }</p>
							<p>${c.regDate }</p> 
						</div> 
					</li>
					<li>
						<p class="pstyle">${c.commentContentBr}</p>
						<textarea name="commentContent" class="form-control" style="display:none;" rows="3" cols="150">${c.commentContent}</textarea>	
						<p class="commentsBtn" style="float:right;">
							<c:if test="${not empty sessionScope.m }">
								<c:if test="${m.memberId eq c.commentWriter }" >
									<a href="javascript:void(0)" onclick="modifyComment(this,'${c.commentNo }','${b.boardNo }');">수정</a>
									<a href="javascript:void(0)" onclick="deleteComment(this,'${c.commentNo }','${b.boardNo }');" >삭제</a>
								</c:if>
									<a href="javascript:void(0)" class="reshow">답글달기</a>
							</c:if>
						</p>
						<c:if test="${not empty sessionScope.m }">  <!-- 댓글/답글달기 -->
						<form action="/insertComment.do" method="post" class="recomment">
							<input type="hidden" name="CommentLevel" value="2"> 
							<input type="hidden" name="commentWriter" value="${m.memberId }">
							<input type="hidden" name="boardNo" value="${b.boardNo }">
							<input type="hidden" name="boardRef" value="${c.commentNo }">
							<input type="hidden" name="status" value="1"> 
							<textarea name="commentContent" class="form-control txtarea" id="texstyle"></textarea>
								<div style="margin-right:20px;">
									<button type="submit" class="btn subbtn" style="display:none; margin-bottom:5px;">등록</button>
									<button type="reset" class="btn subbtn recancel" style="display:none; margin-bottom:5px;">취소</button>
								</div>
						</form>
						</c:if>
					</li>
				</ul>
			</c:if>
			<!-- 대댓글 출력 -->
				<c:forEach items="${list }" var="bc">
					<c:if test="${bc.commentLevel eq 2 && c.commentNo eq bc.boardRef }">
						<ul class="recomments">
							<li>
								<i style="padding-left: 50px;"></i>
								<img src="resources/img/icon/reply.gif">
								<i style="padding-left:20px;"></i>
							</li>
							<li>
								<img src="resources/img/icon/profile.png" class="memberImg">
								<p class="cwriter">${bc.commentWriter }</p>
								<p class="rd">${bc.regDate }</p>
							</li>
							<li class="commentct">
								<p>${bc.commentContentBr }</p>
								<textarea name="commentContent" class="form-control" style="display:none; width: 100%; resize:none;">${bc.commentContent }</textarea><br><br>
								<p class="commentsBtn">
									<c:if test="${not empty sessionScope.m && sessionScope.m.memberId eq bc.commentWriter}">
										<a href="javascript:void(0)" onclick="modifyComment(this,'${c.commentNo }','${b.boardNo }');">수정</a>
										<a href="javascript:void(0)" onclick="deleteComment(this,'${c.commentNo }','${b.boardNo }');" style="margin-right: 15px;">삭제</a>
									</c:if>									
								</p>
							</li>
						</ul>
					</c:if>
				</c:forEach>			
			</c:forEach>
		</div>	
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>