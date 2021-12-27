<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/member/bookmarkHouseList.css">
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container_mate">
		<h1 class="point_title">내가 찜한 하우스</h1>
		<br>
		<hr>
		<br>
		<div class="container_mate_filter">
			<ul class="list_container">
				<c:forEach items="${list}" var="h">
					<li>
			        	<div class="house_list_photo">
			            	<div class="like_house">			                			                     		
					        	<a idx="${h.houseNo}" class="heart">
					            	<img src="/resources/img/icon/heart_on.png">
					            </a>					     					               
			            	</div>
			                <img src="/resources/upload/house/${h.photoList[0].photoPath}">
			            </div>
						<a href="<c:url value='houseView.do?houseNo=${h.houseNo}'/>">
				        	<div class="house_list_text">
				            	<div class="list_line_01">
				                	<span class="list_house_title">${h.houseTitle}</span>
				                </div>
				            	<div class="list_line_02">
				                	<span class="list_tag">
				                    	<c:choose>
				                      		<c:when test="${h.houseGender == '1'}">
				                      			남성전용
				                      		</c:when>
				                      		<c:when test="${h.houseGender == '2'}">
				                      			여성전용
				                      		</c:when>
				                      		<c:otherwise>
				                      			남여공용
				                      		</c:otherwise>
				                      	</c:choose>
				                	</span>
				                    <span class="house_form">${h.houseForm}</span>
				                </div>
				            </div>
						</a>
			            <a href="<c:url value='houseView.do?houseNo=${h.houseNo}'/>" class="house_more_btn">입주 가능 방 ${h.houseRoom}개</a>
					</li>         
				</c:forEach>		
			</ul>		
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	$(document).on("click",".heart",function(){
		var memberNo = "${sessionScope.m.memberNo}";
		var houseNo = $(this).attr('idx');		
		var heart = $(this);
		$.ajax({
			url : "/houseListLike.do",
			data : {memberNo:memberNo, houseNo:houseNo},
			type: "POST",
			success : function(data){
				if(data.likeCheck == 0){
					heart.children().attr("src","/resources/img/icon/heart_off.png");						
				}else{
					heart.children().attr("src","/resources/img/icon/heart_on.png");						
				}
			}
		});
	});
	</script>
</body>
</html>