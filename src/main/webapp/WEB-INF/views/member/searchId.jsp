<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="/resources/css/member/searchId.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="search_wrap">
		<div class="search_container">
			<div class="logo">
		        <div class="mateLogo" >
		            <a href="/">Oh-Mate!</a>
		        </div>
				<div class="search_cont">
					<h4 class="searchIdMiddle">아이디 찾기</h4>
					<div class="searchId-wrap">
						<div class="searchId-tab">
							<a href="/searchId.do">아이디 찾기</a>
						</div>
						<div class="searchId-tab">
							<a href="/searchPw.do">비밀번호 찾기</a>
						</div>
						<form action="/findId" method="post">
						    <table class="searchId-table">
						    	<tr style="border-bottom: 35px solid #fff;">
						        	<td colspan="2">
						        	</td>
			        			</tr>
						        <tr>
									<td id="searchName">
										<h5>이름</h5>
						            	<input type="text" name="memberName" id="memberName" placeholder="이름을 입력해주세요" class="searchId-input">
						            </td>
						        </tr>
						        <tr>
									<td id="searchEmail">
										<h5>이메일 주소</h5>
						            	<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요" class="searchId-input">
						            </td>
						        </tr>
						        <tr>
						            <th colspan="2" class="searchId-button">
										<input type="submit" value="아이디 찾기" id="searchId" > 
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