<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
<style>
	.select_tab>ul{
	    overflow: hidden;
	    padding: 0;
	    margin: 0;
	    list-style-type: none;
	}
	.select_tab>ul>li{
    	float: left;
	}
	.sel>a{
		width: 400px;
	    height: 50px;
	    display:block;
	    text-align: center;
	    line-height: 50px;
	    text-decoration: none;
	    color: #fff;
	    background-color: #956bfc;
	    font-weight: 600;
	    border: 2px solid #956bfc;
	    border-right: none;
	    box-sizing: border-box;
	}
	.notSel>a{
	    width: 400px;
	    height: 50px;
	    display:block;
	    text-align: center;
	    line-height: 50px;
	    text-decoration: none;
	    color: #956bfc;
	    background-color: #fff;
	    border: 2px solid #956bfc;
	    border-right: none;
	    box-sizing: border-box;
	}
	.notSel:hover>a{
	    background-color: #eee9f6;
	    font-weight: 600;
	}
	.select_tab>ul>li:first-child>a{
	    border-top-left-radius: 10px;
	    border-bottom-left-radius: 10px;
	}
	.select_tab>ul>li:last-child>a{
	    border-top-right-radius: 10px;
	    border-bottom-right-radius: 10px;
	    border-right: 2px solid #956bfc;
	}
	
	.main_helper_list{
    width: 100%;
    height: auto;
    overflow: hidden;
	}
	.main_helper_list li{
	    width: 292px;
	    border: 1px solid #eee;
	    overflow: hidden;
	    float: left;
	    border-radius: 20px;
	    margin-right: 10px;
	    box-sizing: border-box;
	    padding: 20px;
	    text-align: center;
	}
	.main_helper_list li:last-child{
		margin-right:0;
	}
	.helper_list_profile{
		width:100%;
	}
	.helper_list_profile img{
		display: block;
	}
	.helper_list_photo{
		width: 100%;
	    overflow: hidden;
	    position: relative;
	}
	.like_helper{
	    position: absolute;
	    right: 3px;
	    top: 3px;   
	}
	.like_helper img {
		width: 30px;
	}
	.helper_list_text_name{
		display: flex;
	    justify-content: center;
	    align-items: flex-end;
	    margin-top:30px;
	}
	.helper_list_nickname{
		font-size: 18px;
	    font-family: "ns_700";
		text-align: center;
		float:left;
		margin-right:5px;
	}
	.helper_list_age, .helper_list_gender{
		float:left;
		color:#666;
		font-size:14px;
	}
	.helper_Category{
		margin-top:15px;
		float:left;
		clear:both;
		width:100%;
		height: 52px;
		white-space: normal;
		display: -webkit-box;
		-webkit-line-clamp:2;
		-webkit-box-orient:vertical;
		overflow: hidden;
		position: relative;
	}
	.helper_list_text_info{
		margin-top:15px;
		margin-left: 20px;
		float:left;
		clear:both;
	}
	.helper_Category_title{
	    margin-right: 5px;
	    font-size: 14px;
	    color: #9c9ba1;
	    display: inline-block;
	}
	
	.helper_list_text_code{
		background: #f9f9f9;
	    border: 1px solid #eee;
	    padding: 2px 12px;
	    border-radius: 50px;
	    margin-right: 5px;
	    font-size: 14px;
	    color: #666;
	    margin-bottom:5px;
	    display: inline-block;
	    float:left;
	}
	.helper_Category:before {
	  content: "";
	  display: block;
	  width: 20px;
	  border-top: 2px solid #956bfc;
	  margin:0 auto;
	  margin-bottom:5px;
	}
	.helper_list_intro{
		width: 100%;
	    height: 70px;
	    white-space: normal;
	    display: -webkit-box;
	    -webkit-line-clamp: 3;
	    -webkit-box-orient: vertical;
	    overflow: hidden;
	    margin-top: 8px;
	    float: left;
	    clear: both;
	}
	.helper_list_intro p{
		margin-bottom:0;
	}
	.heart{
		cursor: pointer;
	    outline:none;
	    border:none;
	    background:none;
	    width:35px;
	}
	.heart img{
		-webkit-animation: scaleUpCenter .4s ease-out both;
		animation: scaleUpCenter .4s ease-out both;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />	
	<div class="container_mate">
		<h1 class="point_title">찜한 헬퍼</h1>
		<br>
		<hr>
		<br>
		<div class="select_tab">
			<ul>
				<li class="notSel"><a href="/helpList.do?reqPage=1">헬프 신청 내역</a></li>
				<li class="notSel"><a href="/helpReviewList.do?reqPage=1">헬프리뷰</a></li>
				<li class="sel"><a href="/bookmarkHelper.do">찜한 헬퍼</a></li>
			</ul>
		</div>
		<br>
		<br>
		<div class="helper_list">
			<ul class="main_helper_list">
				<c:forEach items="${list}" var="hp">
					<li>
						<div class="helper_list_photo">
	                        <div class="like_helper">
	                     		<a idx="${hp.helperNo}" class="heart">	                     		
				                	<img src="/resources/img/icon/heart_on.png">
				                </a>				                	                
	                        </div>
							<div class="helper_list_profile">
			                    <img src="/resources/upload/helper/${hp.helperFilepath}" class="profile_view">
			        		</div>
	                    </div>
		        	<a href="<c:url value='/helperView.do?helperNo=${hp.helperNo}'/>">
	                    <div class="helper_list_text_name">
			        		<span class="helper_list_nickname">${hp.helperName}</span>
			        		<c:choose>
			        			<c:when test="${hp.age == 1}">			        				
					        		<span class="helper_list_age">20대 · </span>
			        			</c:when>
			        			<c:when test="${hp.age == 2}">			        				
					        		<span class="helper_list_age">30대 · </span>
			        			</c:when>
			        			<c:otherwise>
					        		<span class="helper_list_age">40대 · </span>			        			
			        			</c:otherwise>
			        		</c:choose>
			        		<c:choose>
			        			<c:when test="${hp.gender == 1}">
					        		<span class="helper_list_gender">남</span>
			        			</c:when>
			        			<c:otherwise>
					        		<span class="helper_list_gender">여</span>			        			
			        			</c:otherwise>
			        		</c:choose>
			        	</div>
			        	<div class="helper_Category" value="${hp.helperCategory}">
			        		<span class="helper_Category_title">#배달·장보기</span>
			        		<span class="helper_Category_title">#청소·집안일</span>
			        		<span class="helper_Category_title">#설치·조립·운반</span>
			        		<span class="helper_Category_title">#동행·돌봄</span>
			        		<span class="helper_Category_title">#벌레·쥐</span>
			        		<span class="helper_Category_title">#역할대행</span>
			        		<span class="helper_Category_title">#과외·알바</span>
			        		<span class="helper_Category_title">#기타·원격</span>
			        	</div>
			        	<div class="helper_list_text_info">
			        		<span class="helper_list_text_code">${hp.helperStartTime}~${hp.helperEndTime }</span>
			        		<span class="helper_list_text_code"> 
			        			이동
			        			<c:choose>
			        				<c:when test="${hp.helperRide == 1}">
			        					자동차
			        				</c:when>
			        				<c:when test="${hp.helperRide == 2}">
			        					오토바이
			        				</c:when>
			        				<c:when test="${hp.helperRide == 3}">
			        					퀵보드
			        				</c:when>
			        				<c:when test="${hp.helperRide == 4}">
			        					자전거
			        				</c:when>
			        				<c:otherwise>
			        					도보
			        				</c:otherwise>
			        			</c:choose>			        		
			        		</span>
			        	</div>
		        	</a>
					</li>
				</c:forEach>
			</ul>			
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
	<script>
	$(document).on("click",".heart",function(){
		var memberNo = "${sessionScope.m.memberNo}";
		var helperNo = $(this).attr('idx');		
		var heart = $(this);
		$.ajax({
			url : "/HelperMainLike.do",
			data : {memberNo:memberNo, helperNo:helperNo},
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
	$(function(){
		var options = $(".helper_Category");
		for(var i=0;i<options.length;i++){
			var optionValue = options.eq(i).attr("value");
			//console.log(optionValue);
			for(var j=0;j<optionValue.length;j++){					
				if(optionValue.charAt(j) == 0){
					$(".helper_Category").eq(i).children("span").eq(j).hide();
				}
			}
		}
	});	
	</script>
</body>
</html>