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
				<div class="confirm_cont">
					<div class="community-wrap">
						<div class="community-tab">
							<a href="/communityConfirm.do">내가 작성한 게시물 보기</a>
						</div>
						<div class="community-tab">
							<a href="/commentConfirm.do">내가 작성한 댓글 보기</a>
						</div>
						<div class="delbutton">
							<button class="delete" name="delete" id="delete" style="display:none;"></button> 
							<label for="delete"><img src="resources/img/icon/trash.png" style="width:35px; margin-top:10px;"></label>
						</div>
						<form action="/searchId.do" method="post">
						    <table class="community-table table table-hover">
						  	<thead>
								<tr>
									<th scope="col">
										<label for="chkAllBox">모두선택</label>
										<input type="checkbox" id="chkAllBox" style="width:0px; height:0px;">
									</th>
									<th scope="col">제목</th>
									<th scope="col">작성일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="" var="c" varStatus="i">
								<tr>
									<td scope="row">
										<input type="checkbox" class="chk">
										<input type="hidden" value="" class="hiddenVal">
									</td>	
								</tr>
								</c:forEach>
							</tbody>  
						    </table>
						</form>
					</div>
				</div>
			</div>
		</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>