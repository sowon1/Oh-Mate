<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬프</title>
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
	.help_request{
		display: flex;
	    align-items: flex-start;
	    justify-content: space-between;
	    flex-wrap: nowrap;
	    flex-direction: row;
	    border: 1px #f1f1f1 solid;
	}
	.helper_img {
	    width: 200px;
	    height: 200px;
	    border-radius: 50%;
	    overflow: hidden;
	    margin: 0 auto;
	    object-fit: cover;
	}
	.help_info{
		flex-grow: 1;
		margin-top:20px;
		margin-left:40px;
		float:left;
	}
	.help_title{
		font-size: 25px;
		margin-right:8px;
		font-family: "ns_700";
	}
	.help_status{
		font-size:18px;
		color:#666;
	}
	.helpContent{
		font-size:20px;
	}
	.request_time{
		float:left;
		margin-top:15px;
		margin-right:30px;
	}
	.help_date_title{
		float:left;
		margin-bottom:12px;
		margin-left:12px;
		font-size:16px;
	}
	.help_time_title{
		float:left;
		margin-bottom:12px;
		font-size:16px;
	}
	.help_time_code{
		float:left;
		background: #f9f9f9;
		border: 1px solid #eee;
		padding: 3px 12px;
		border-radius: 50px;
		margin-right:5px;
		font-size:12px;
		clear:both;
	}
	.help_btn{
		margin-top: 25px;
		margin-right: 15px;
	}
	.btn{
		margin-top: 5px;		
	}
	.form_popup_modal{
	    /* 현재 화면 중앙에 모달 뜰수있게 */
	    position: fixed;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    /* 실제로 modal은 처음에 안보여야하니 none으로 */
	    display: none;
	    justify-content: center;
	    align-items: center;
	    z-index: 10005;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />	
	<div class="container_mate">
		<h1 class="point_title">헬프 내역</h1>
		<br>
		<hr>
		<br>
		<div class="select_tab">
			<ul>
				<li class="sel"><a href="/helpList.do?reqPage=1">헬프 신청 내역</a></li>
				<li class="notSel"><a href="helpReview.do?reqPage=1">헬프리뷰</a></li>
				<li class="notSel"><a href="bookmarkHelper.do">찜한 헬퍼</a></li>
			</ul>
		</div>
		<br>
		<hr>
		<br>
		<div>
			<ul>
				<c:forEach items="${list }" var="h" varStatus="i">
					<li>
						<div class="help_request">
							<img src="/resources/upload/helper/${h.helperFilepath}" class="helper_img">
							<div class="help_info">
								<span class="help_title">
									${h.helpTitle}						
								</span>
								<span class="help_status">
									<a href="/helperView.do?helperNo=${h.helperNo}">${h.helperName}</a>
									 · 
									<c:choose>
					        			<c:when test="${h.helpStatus eq 1}">			        				
							        		요청중
					        			</c:when>
					        			<c:when test="${h.helpStatus eq 2}">			        				
							        		처리중 
					        			</c:when>
					        			<c:when test="${h.helpStatus eq 3}">			        				
							        		처리완료 
					        			</c:when>
					        			<c:when test="${h.helpStatus eq 4}">			        				
							        		취소 
					        			</c:when>
					        			<c:otherwise>
							        		???
					        			</c:otherwise>
					        		</c:choose>
								</span>
								<div class="helpContent">
									${h.helpContent }
								</div>
								<div class="request_time">
									<span class="help_date_title">요청일자</span>
									<span class="help_time_code">${h.helpRequestDate}</span>
								</div>
								<div class="request_time">
									<span class="help_time_title">시작시간</span>
									<span class="help_time_code">${h.helpStartTime}</span>
								</div>	
								<div class="request_time">
									<span class="help_time_title">마감시간</span>
									<span class="help_time_code">${h.helpEndTime}</span>
								</div>
								<c:choose>
									<c:when test="${not empty h.helpFinishDate }">
										<div class="request_time">
											<span class="help_date_title">완료일자</span>
											<span class="help_time_code">${h.helpFinishDate}</span>
										</div>		
									</c:when>
								</c:choose>			
							</div>
							<div class="help_btn">
								<div>
									<form action="/reviewWriteFrm.do" method="post" class="review_btn">
										<input type="hidden" name="memberNo" value="${h.memberNo }">
										<input type="hidden" name="helperNo" value="${h.helperNo }">
										<input type="hidden" name="helpNo" value="${h.helpNo }">
										<button type="submit" class="btn">상세내용</button>													
									</form>		
									<c:choose>
										<c:when test="${h.helpStatus eq 3 and h.reviewCheck eq 0 }">
											<form action="/helpReviewWriteFrm.do" method="post" class="review_btn">
												<input type="hidden" name="memberNo" value="${h.memberNo }">
												<input type="hidden" name="helperNo" value="${h.helperNo }">
												<input type="hidden" name="helpNo" value="${h.helpNo }">
												<input type="hidden" name="helperName" value="${h.helperName }">
												<input type="hidden" name="helpTitle" value="${h.helpTitle }">
												<input type="hidden" name="helpFinishDate" value="${h.helpFinishDate}">
												<input type="hidden" name="helpRequestDate" value="${h.helpRequestDate}">										
												<button type="submit" class="btn btn_out">리뷰작성</button>													
											</form>										
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${h.helpStatus eq 1}">
											<form action="cancelHelp.do">
												<input type="hidden" name="helpNo" value="${h.helpNo }">
												<button class="btn btn_pk">헬프취소</button>																						
											</form>																							
										</c:when>
									</c:choose>
								</div>		
							</div>
						</div>						
					</li>
				</c:forEach>
				<li id="pageNavi">${pageNavi }</li>
			</ul>
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>
</html>