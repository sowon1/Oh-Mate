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
				<li class="notSel"><a href="helpReview.do">헬프리뷰</a></li>
				<li class="notSel"><a href="bookmarkHelper.do">찜한 헬퍼</a></li>
			</ul>
		</div>
		
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>
</html>