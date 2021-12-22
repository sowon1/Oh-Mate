<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/mateWriteFrm.css">
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="container_mate">
		<div class="container_mate">
		<h1>오늘부터 메이트_글수정</h1>
		<br><hr><br>
		<form action="/boardUpdate.do?boardNo=${b.boardNo }" method="post" enctype="multipart/form-data">
		<table class="table table-hover">
			<tr class="table-primary">
				<th>제목</th>
				<td colspan="3" class="tdStyle">
					<input type="text" id="boardTitle" name="boardTitle" value="${b.boardTitle }" style="padding-left:10px;"></td>
		    </tr>
		    <tr>
			    <th>작성자</th>
			    <td class="tdStyle">
			    	${b.boardWriter }
			    	<input type="hidden" name="boardWriter" value="${sessionScope.m.memberId}">
			    </td>
			    <th>작성일</th>
			    <td>${b.regDate }</td>
		    </tr>
		    <tr>
			    <th>첨부파일</th>		    
			    <td class="tdStyle">
			    	<img src="/resources/img/icon/file.png" width="16px" class="delFile">
					<span class="delFile" >${b.filePath }</span>
					<button type="button" id="delBtn" class="btn btn-primary btn-sm delFile">삭제</button>
					<input type="file" name="uploadFile" class="upfile" style="display: none;">
			    </td>			    
			    <th>조회수</th>
			    <td>${b.readCount }</td>
		    </tr>
		    <tr>
		    	<th>내용</th>
		    	<td colspan="3" style="margin-top:0px; margin-bottom:0px; height:390px; vertical-align: top; text-align: left;">
					<textarea rows="20px;" cols="120px;" name="boardContent" style="padding-left:10px; padding-top:10px;">${b.boardContent}</textarea> 
				</td>
		    </tr>
		    <tr>
		    	<td colspan="4">
		    	<c:choose>
		    		<c:when test="${not empty sessionScope.m && sessionScope.m.memberId eq b.boardWriter}">
			    	<div class="submitBtn">
			    		<button type="submit" class="btn" id="boardUpdate">수정하기</button>
			    		<a href="/boardDelete.do?boardNo=${b.boardNo }" class="btn" id="deleteBtn">삭제하기</a>
			    	</div>
			    	</c:when>
			    	<c:otherwise>
			    	<div class="submitBtn">
			    		<button type="button" onclick="history.back()" class="btn" id="boardBack">이전화면</button>
			    	</div>
			    	</c:otherwise>
		    	</c:choose>
		    	</td>
		    </tr>
		</table>
		</form>
		</div>
	</div>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
<script>
	$(function(){
		$("#delBtn").click(function() {
			$(".delFile").hide();
			$(this).next().show();
		});
		
		$("#boardUpdate").click(function(){
			var uploadFile = $(".upfile").val();
			if(uploadFile == ""){
				alert('파일을 첨부해주세요.');
				return false;
			}
		});
	});
</script>
</body>
<style>
	#delBtn{
		width:80px; 
		height:30px; 
		line-height:0px;
	}
</style>
</html>