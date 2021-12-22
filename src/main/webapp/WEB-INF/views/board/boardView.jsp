<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 상세보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/resources/js/board/boardView.js"></script>
<link rel="stylesheet" href="/resources/css/board/mateWriteFrm.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div class="container_mate">
		<h1>오늘부터 메이트</h1>
		<br>
		<hr>
		<br>
		<form action="boardUpdateFrm.do?boardNo=${b.boardNo }" method="post" enctype="multipart/form-data">
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
				<td colspan="8" id="profileOption" value="${ProfileOption }" style="padding-left:76px;">	
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="7" id="contentTd">
					${b.boardContent}
				</td>
			</tr>
			<tr>
				<td colspan="8">
					<c:choose>
						<c:when test="${not empty sessionScope.m && sessionScope.m.memberId eq b.boardWriter}">
							<div class="submitBtn">
								<button type="button" class="btn" onclick="history.back()" style="padding: 0px;">이전화면</button>
								<button type="submit" class="btn" id="boardUpdate">수정하기</button> 
								<a href="/boardDelete.do?boardNo=${b.boardNo }" class="btn" id="deleteBtn" >삭제하기</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="submitBtn">
								<button type="button" class="btn" id="boardBack" onclick="history.back()">이전화면</button>
							</div>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		</form>

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
										<c:choose>
											<c:when test="${m.filepath eq null}">
											<div class="form-inline mb-2" >
												<img src="resources/img/icon/profile.png" class="memberImg">
												<div style="margin-left:17px;">${m.memberId }</div>
											</div> 
											</c:when>
											<c:otherwise>
											<div class="form-inline mb-2" >
												<img src="resources/upload/member/${m.filepath}" class="memberImg">
												<div style="margin-left:17px;">${m.memberId }</div>
											</div> 
											</c:otherwise>
										</c:choose>
									<li>
										<div>
											<input type="hidden" name="CommentLevel" value="1"> 
											<input type="hidden" name="commentWriter" value="${m.memberId }">
											<input type="hidden" name="boardNo" value="${b.boardNo }">
											<input type="hidden" name="boardRef" value="0">
											<textarea name="commentContent" class="form-control" id="commentcont" rows="3" cols="150" placeholder="댓글을 입력해주세요."></textarea>	
										</div>
									</li>
									<li>	
								      <div class="form-check" style="float: right; margin-top: 7px; margin-top:10px;">
								        <input type="checkbox" id="secretChecked" name="commentSecret" value="2" class="form-check-input">
								        <label for="secretChecked" class="form-check-label" style="padding-right:10px;">
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
								<c:when test="${m.memberId ne c.commentWriter}">
									<img src="resources/img/icon/profile.png" class="memberIm">
								</c:when>
								<c:otherwise>
									<img src="resources/upload/member/${m.filepath}" class="memberIm">
								</c:otherwise>
							</c:choose>
							<p class="cw">${c.commentWriter }</p>
							<p>${c.regDate }</p> 
						</div> 
					</li>
					<li>
					
						
							<c:if test="${c.commentSecret eq 2 }"> <!-- 비밀 -->
								<c:choose>
									<c:when test="${m.memberId eq c.commentWriter }">&emsp;
									<img src="/resources/img/icon/lock.png" width="15px" alt="비밀글">&nbsp;비밀글 입니다.
										<p class="pstyle">${c.commentContentBr}</p>
									</c:when>
									<c:otherwise>
										<c:if test="${m.memberId eq null && (m.memberId ne c.commentWriter)}">
										<img src="/resources/img/icon/lock.png" width="15px" alt="비밀글">
						               	비밀글은 작성자와 관리자만 볼 수 있습니다.
						               	</c:if>
									</c:otherwise>
								</c:choose>
							</c:if>
							<c:if test="${c.commentSecret eq 1 }"> <!-- 일반 -->
								<p class="pstyle">${c.commentContentBr}</p>
							</c:if>
						 
					
						
						<textarea name="commentContent" class="form-control" style="display:none;" rows="3" cols="150">${c.commentContent}</textarea>	
						<p class="commentsBtn commentbt">
							<c:if test="${not empty sessionScope.m }">
								<c:if test="${m.memberId eq c.commentWriter }" >
									<a href="javascript:void(0)" class="boardviews" onclick="modifyComment(this,'${c.commentNo }','${b.boardNo }');">수정</a>
									<a href="javascript:void(0)" class="boardviews" onclick="deleteComment(this,'${c.commentNo }','${b.boardNo }');">삭제</a>
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
							<textarea name="commentContent" class="form-control txtarea"></textarea>
								<div style="margin-right:20px;" class="btnsty">
									<button type="submit" class="btn subbtn subbtnSty">등록</button>
									<button type="reset" class="btn subbtn recancel">취소</button>
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
								<textarea name="commentContent" class="form-control" style="display:none; width: 100%; resize:none;">${bc.commentContent }</textarea>
								<p class="commentsBtn">
									<c:if test="${not empty sessionScope.m && sessionScope.m.memberId eq bc.commentWriter}">
										<a href="javascript:void(0)" onclick="modifyComment(this,'${bc.commentNo }','${b.boardNo }');">수정</a>
										<a href="javascript:void(0)" onclick="deleteComment(this,'${bc.commentNo }','${b.boardNo }');" style="margin-right: 15px;">삭제</a>
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