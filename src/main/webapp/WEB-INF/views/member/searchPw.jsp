<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/resources/css/member/searchPw.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="search_wrap">
		<div class="search_container">
			<div class="logo">
		        <div class="mate_logo" >
		            <a href="/">Oh-Mate!</a>
		        </div>
				<div class="search_cont">
					<h4 class="searchIdMiddle">비밀번호 찾기</h4>
					<div class="searchId-wrap">
						<div class="searchId-tab">
							<a href="/searchIdFrm.do">아이디 찾기</a>
						</div>
						<div class="searchId-tab">
							<a href="/searchPwFrm.do">비밀번호 찾기</a>
						</div>
						<form action="/searchPw.do" method="post">
						    <table class="searchId-table">
						    	<tr style="border-bottom: 35px solid #fff;">
						        	<td colspan="2">
						        	</td>
			        			</tr>
						        <tr>
									<td id="searchName">
										<h5>아이디</h5>
						            	<input type="text" name="memberId" id="memberId" placeholder="아이디를 입력해주세요" class="searchId-input">
						            </td>
						        </tr>
						        <tr>
									<td id="searchEmail">
										<h5>이메일 주소</h5>
						            	<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요" class="searchId-input">
						            </td>
						        </tr>
						        <tr>
						            <th colspan="2" class="searchId-button">
										<input type="submit" value="비밀번호 찾기" id="searchId" > 
									</th>
						        </tr>
						    </table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>