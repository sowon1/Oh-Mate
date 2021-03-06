<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
<link rel="stylesheet" href="/resources/css/member/joinFrm.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="join_wrap">
		<div class="join_container">
			<div class="logo">
		        <div class="Mate_logo">
		            <a href="/">Oh-Mate!</a>
		        </div>
				<div class="join_cont">
					<h1>JOIN US</h1>
					<p>
						회원 종류에 따라 회원가입 절차가 다릅니다.
						<br>
						고객님께서 해당하는 유형을 선택하여 회원가입을 진행해 주시기 바랍니다.
					</p>
					<div class="btn_wrap">
						<a href="/joinMate.do">메이트 회원가입</a>
					</div>
					<div class="btn_wrap">
						<a href="/joinOwner.do">하우스오너 회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>