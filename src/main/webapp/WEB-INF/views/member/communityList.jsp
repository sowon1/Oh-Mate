<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
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
						<tr class="table-secondary " style="border:1px solid #8C8C8C;">
							<th scope="col">댓글번호</th>
							<th scope="col">댓글분류</th>
							<th scope="col">내용</th>
							<th scope="col">댓글작성일</th>
							<th scope="col">신고상태</th>
						</tr>
					</thead>
					<tbody></tbody>
					</table>
					<div class="page-navi">${pageNavi }</div>
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
			var memberId = $(".memberId").val();
			var reqPage = 1;
			var commentTab = $(".communityTbl").eq(1).find("tbody");
			
			$.ajax({
				url: "/myCommunity.do",
				data: {reqPage:reqPage,memberId:memberId},
				type: "GET",
				success:function(data){
					//console.log(data);
					var list = data.list;
					//console.log(list);
					var pageNavi = data.pageNavi;
					commentTab.empty();

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
						
						var html="<tr><td><p>"+list[i].commentNo+"</p></td><td><p>"+commentLevel+"</p></td><td><p>"+list[i].commentContent+"</p></td><td><p>"+list[i].regDate+"</p></td><td><p>"+status+"</p></td></tr>";
						commentTab.append(html);
						console.log(html);
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