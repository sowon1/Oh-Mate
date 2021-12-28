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
	
	.helper_view_review{
		background: #fff;
		padding:30px 30px 50px 30px;
		margin-top:20px;
		float:left;
		clear:both;
		width:100%;
		overflow: hidden;
	}
	.helper_review_photo{
		width:100%;
	}
	.helper_review_photo li{
		width:133px;
		float:left;
		margin-right:10px;
		padding:20px;
	}
	.helper_review_photo li:last-child{
		background: #66666663;
	}
	.helper_review_photo li:last-child:hover{
		background: #66666680;
	}
	.helper_review_photo li:hover{
		background: #66666663;	
	}
	
	.helper_review_photo li:last-child{
		margin-right:0;
	}
	.helper_review_photo li img{
		width:100%;
	}
	
	/* 리뷰 - 리스트 */
	.helper_review_list{
		float:left;
		clear:both;
		margin-top:30px;
		border-top:2px solid #eee;
		border-bottom:2px solid #eee;
		width:100%;
		padding: 30px 0px;
	}
	.helper_review_list li{
		float:left;
		clear:both;
		border-bottom: 1px solid #eee;
		width:100%;
		margin-bottom:30px;
		padding-bottom:30px;
	}
	.helper_review_list li:last-child{
		border-bottom:none;
		margin-bottom:0;
		padding-bottom:0;
	}
	.review_text{
		display: flex;
	    align-items: flex-start;
	    justify-content: space-between;
	    width: 100%;
	}
	.review_pro_img{
	    width: 150px;
	    height: 150px;
	    border-radius: 50%;
	    overflow: hidden;
	    margin: 0 auto;
	    object-fit: cover;
	    margin-left:100px;
	}
	.review_text_box{
		flex-grow: 1;
		margin-left: 20px;
	}
	.review_writer{
		float:left;
		clear:both;
		display: flex;
		align-items: flex-end;
		margin-top:4px;
	}
	.review_date{
		color:#666;
		font-size:13px;
		margin-left:8px;
	}
	.review_date:before {
	    content: "";
	    height: 11px;
	    border-left: 2px solid #eee;
	    display: inline-block;
	    color: #956bfc;
	    margin-right: 8px;
	}
	.review_title{
		float:left;
		color: #666;
		clear:both;
		margin-top:4px;
	}
	.review_content{
		float:left;
		clear:both;
		margin-top:20px;
	}
	.review_btn{
		align-self: center;
		 margin-right:100px;
	}
	.review_btn button{
		padding:0;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />	
	<div class="container_mate">
		<h1 class="point_title">내가 쓴 리뷰</h1>
		<br>
		<hr>
		<br>
		<div class="select_tab">
			<ul>
				<li class="notSel"><a href="/helpList.do?reqPage=1">헬프 신청 내역</a></li>
				<li class="sel"><a href="helpReviewList.do?reqPage=1">헬프리뷰</a></li>
				<li class="notSel"><a href="bookmarkHelper.do">찜한 헬퍼</a></li>
			</ul>
		</div>
		<br>
		<hr>
		<br>
		<div class="helper_view_review">
			<div class="helper_review_list">
				<ul>
					<c:forEach items="${list }" var="r">
						<li>
							<div class="review_text">
								<img src="/resources/upload/helperReview/${r.photoPath }" class="review_pro_img">
								<div class="review_text_box">
									<div class="star-ratings review_star">
										<div class="star-ratings-fill space-x-2 text-lg" style="{ width: ratingToPercent + '%' }">
											<c:choose>
												<c:when test="${r.asterion == 5}">
													<img class="star" src="/resources/img/icon/star-on.png">
													<img class="star" src="/resources/img/icon/star-on.png">
													<img class="star" src="/resources/img/icon/star-on.png">
													<img class="star" src="/resources/img/icon/star-on.png">
													<img class="star" src="/resources/img/icon/star-on.png">													
												</c:when>
												<c:when test="${r.asterion == 4}">
													<img class="star" src="/resources/img/icon/star-on.png">
													<img class="star" src="/resources/img/icon/star-on.png">
													<img class="star" src="/resources/img/icon/star-on.png">
													<img class="star" src="/resources/img/icon/star-on.png">												
												</c:when>
												<c:when test="${r.asterion == 3}">
													<img class="star" src="/resources/img/icon/star-on.png">
													<img class="star" src="/resources/img/icon/star-on.png">
													<img class="star" src="/resources/img/icon/star-on.png">											
												</c:when>
												<c:when test="${r.asterion == 2}">
													<img class="star" src="/resources/img/icon/star-on.png">							
												</c:when>
												<c:otherwise>
													<img class="star" src="/resources/img/icon/star-on.png">																						
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="review_writer">
										<span class="review_id">
											${r.helperName }											
										</span>
										<span class="review_date">${r.reviewDate}</span>
									</div>
									<div class="review_title">
										${r.reviewTitle}
									</div>
									<div class="review_content">
										${r.reviewContent}
									</div>				
								</div>
								<div class="review_btn">								
									<form action="/deleteReview.do" method="post">
										<input type="hidden" name="reviewNo" value="${r.reviewNo }">
										<button class="btn btn_pk">삭제</button>
									</form>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="pageNavi">${pageNavi }</div>
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>
</html>