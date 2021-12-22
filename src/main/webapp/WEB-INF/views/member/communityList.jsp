<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지_게시판/댓글</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
   	<link rel="stylesheet" href="/resources/css/member/communityConfirm.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
		<div class="container_mate">
			<h1>MyPage_커뮤니티/댓글</h1><br>
			<hr><br>
			<h4><span class="communityTab">커뮤니티</span> / <span class="communityTab">댓글</span></h4>
			<!-- 게시판 -->
			<div class=communityTbl>
			<table class="community-table table table-hover">
			  	<thead>
					<tr class="table-secondary" style="border:1px solid #8C8C8C;">
						<th scope="col">No</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
						<th scope="col">신고상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="c" varStatus="i">
					<c:if test="${not empty list}">
						<tr class="trstyle">
							<td>
								${start+i.index }
							</td>
							<td>
								<a href="/boardView.do?boardNo=${c.boardNo }">
								${c.boardTitle }
								</a>
							</td>
							<td>
								${c.regDate }
							</td>
							<td>
								${c.readCount }
							</td>
							<td>
								<c:choose>
									<c:when test="${c.status eq 1}">
										미신고
									</c:when>
									<c:otherwise>
										신고
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
				
				<!-- 댓글 -->
				<div class="communityTbl" style="display:none;">
				<input type="hidden" name="memberId" class="memberId" value="${m.memberId }">
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
					</table>
				</div>
			</div>
			<c:import url="/WEB-INF/views/common/footer.jsp"/>
<script>
	//탭전환
	$(function(){
        $(".communityTab").click(function(){
       	$(".communityTbl").hide();
       	if($(this).index() == 0){
       		$(".communityTbl").eq(0).show();
       	} else {
       		$(".communityTbl").eq(1).show();
       	}
        });
		
        //마이페이지_댓글
		$(".communityTab").eq(1).click(function(){
			var memberId = $(".memberId");
			var reqPage = 1;
			var commentTab = $(".communityTbl").eq(1).find("tbody");
			
			$.ajax({
				url: "/myCommunity.do",
				data: {memberId:memberId, reqPage:reqPage},
				type: "post",
				success:function(data){
					console.log(data);
					var list = data.list;
					var pageNavi = data.pageNavi;
					
					for(var i=0; i<list.length; i++){
						var commentLevel = "";
						if(list[i].commentLevel == 1){
							commentLevel = "댓글"
						}else{
							commentLevel = "대댓글"
						}
						
						var status="";
						if(list[i].status == 1){
							status = "미신고"
						}else{
							status = "신고"
						}
						
						var html="<tr><td><h5>"+list[i].index+"</h5></td><td><h5>"+commentLevel+"</h5></td><td><h5>"+list[i].commentContent+"</h5></td><td><h5>"+list[i].regDate+"</h5></td><td><h5>"+status+"</h5></td></tr>";
						commentTab.append(html);
					}	
					
						$(".page-navi").last().empty();
						$(".page-navi").last().html(pageNavi);
				}
			});
		});
	});
</script>
</body>
</html>