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
		<h1>오늘부터 메이트</h1>
		<br><hr><br>
		<form action="/boardWrite.do" method="post" enctype="multipart/form-data">

		<table class="table table-hover">
  			<thead>
				<tr class="table-primary">
					<th>제목</th>
					<td class="tdStyle"><input type="text" name="boardTitle"></td>
				    <td><button type="button" class="btn btn-primary btn-sm" id="postBtn">쪽지보내기</button></td>
				    <td></td>
			    </tr>
			    <tr>
				    <th>작성자</th>
				    <td colspan="3" class="tdStyle">
				    	${sessionScope.m.memberId}
				    	<input type="hidden" name="boardWriter" value="${sessionScope.m.memberId}">
				    </td>
			    </tr>
			    <tr>
				    <th>첨부파일</th>
				    <td colspan="3" class="tdStyle">
						<input type="file" name="uploadFile" accept=".jpg,.jpeg,.png,.gif">
					</td>
			    </tr>
			    <tr>
			    	<th>내용</th>
			    	<td colspan="3">
			    	<textarea style="height:390px;" class="form-control" name="boardContent"></textarea>
			    	</td>
			    </tr>
			    <tr>
			    	<td colspan="4">
			    	<div class="submitBtn">
			    		<button type="submit" class="btn" id="boardInsert">등록하기</button>
			    	</div>
			    	</td>
			    </tr>
		    </thead>
		</table>
		</form>
		</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
<script>
	$(function(){
		$("#boardInsert").click(function(){
	        if($('[name=boardTitle]').val() == ""){
	          alert('제목을 입력하세요.');
	          return false;
	        }else if($('[name=uploadFile]').val() == ""){
	          alert('파일을 첨부해주세요.');
	          return false;
	        }else if($('[name=boardContent]').val() == ""){
	          alert('내용을 입력해주세요.');
	          return false;
	        }else{
	          return true;
	        }
		});
	});
</script>
</body>
</html>