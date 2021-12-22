<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   	<link rel="stylesheet" href="/resources/css/member/communityConfirm.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
		<div class="container_mate">
			<h1>커뮤니티_메이트 게시판</h1><br>
			<hr><br>
			<div class="logo">
			<table class="community-table table table-hover">
			  	<thead>
					<tr class="table-secondary" style="border:1px solid #8C8C8C;">
						<th scope="col">No</th>
						<th scope="col">댓글분류</th>
						<th scope="col">내용</th>
						<th scope="col">댓글작성일</th>
						<th scope="col">신고상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="mc" varStatus="i">
					<c:if test="${not empty list}">
						<tr class="trstyle">
							<td>
								${start+i.index }
							</td>
							<td>
								<c:choose>
									<c:when test="${mc.commentLevel eq 1}">
										댓글
									</c:when>
									<c:otherwise>
										대댓글
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<a href="/boardView.do?boardNo=${mc.commentNo }">
								${mc.commentContent }
								</a>
							</td>
							<td>
								${mc.readCount }
							</td>
							<td>
								<c:choose>
									<c:when test="${mc.status eq 1}">
										신고없음
									</c:when>
									<c:otherwise>
										신고없음
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					 </c:if>
					 </c:forEach>
				</tbody>  
			    </table>
					<div class="page-navi">${pageNavi }</div>
					</div>
				</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<style>

	.trstyle{
		text-align:center; 
		border-left:1px solid #EAEAEA; 
		border-right:1px solid #EAEAEA;
		height:100px;
		vertical-align:middle;
	}
	.tdstyle{
		border-bottom:1px solid #8C8C8C;
	}
	.page-navi{
		text-align: center;
		margin-left: 45%;
	}
</style>
</html>