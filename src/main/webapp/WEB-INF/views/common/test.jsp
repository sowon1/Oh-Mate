<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach items="${data}" var="c">			
				<a href="/">
					<li>
						<div class="talk_profile">
							<c:choose>
					    		<c:when test="${not empty c.filepath}">
					    			<img src="/resources/upload/member/${c.filepath}">
					    		</c:when>
					    		<c:otherwise>		    		
							        <img src="/resources/img/icon/profile.png">
					    		</c:otherwise>
					    	</c:choose>
						</div>
						<div class="talk_list_text">
							<div class="talk_list_02">
								<span class="mate_talk_msg_name">${r.senderName}</span>
								<span class="mate_talk_list_view">
									${r.chatContent}
								</span>
							</div>
							<div class="talk_list_time">
								<span class="mate_talk_time">${r.chatDate}</span>
								<span class="mate_talk_read_count">${r.readCount}</span>
							</div>
						</div>
					</li>
				</a>
			</c:forEach>




</body>
</html>