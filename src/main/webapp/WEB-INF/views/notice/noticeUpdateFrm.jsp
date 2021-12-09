<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- include summernote css/js-->
<script src="/resources/summernote/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<script src="/resources/summernote/summernote-lite.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<!-- include noticeWriteFrm css -->
<link rel="stylesheet" href="/resources/css/notice/noticeWriteFrm.css">
	<div class="container_mate">
		<h1>공지사항 수정</h1>
		<br>
		<hr>
		<form action="/updateNotice.do" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="noticeTitle" class="input_03" autocomplete="off" value="${n.noticeTitle }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3" style="text-align:left;">
						<textarea id="noticeContent" name="noticeContent">${n.noticeContent }</textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td style="text-align:left;">
						<input type="file" name="upfiles" multiple><br>
						<c:forEach items="${n.list }" var="f">
							<input type="hidden" name="filepath" value="${f.filepath }">
							<input type="hidden" name="fileNo" value="${f.fileNo }">
							<span>${f.filename }</span>
							<button type="button" class="btn btn_pk btn_sm delBtn">삭제</button><br>
						</c:forEach>
					</td>
					<td colspan="2" style="text-align:right;">
						<button type="submit" class="btn btn_pk" style="height: 60px;">수정</button>
						<a href="/noticeList.do?reqPage=1" class="btn" style="height: 60px;">목록</a>
					</td>
				</tr>		
			</table>
			<input type="hidden" name="noticeNo" value="${n.noticeNo }">
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
	$(".delBtn").click(function(){
		var filename = $(this).prev();
		var delBtn = $(this);
		var fileNo = $(this).prev().prev().val();
		var filepath = $(this).prev().prev().prev().val();
		$.ajax({
			url: "/delFile.do",
			type: "post",
			data: {fileNo:fileNo,filepath:filepath},
			success: function(data){
				if(data>0){
					filename.html("삭제된 파일");
					delBtn.hide();					
				}else{
					alert("삭제 실패");
				}
			}
		});
	});
	$(function(){
		$("#noticeContent").summernote({
			height : 400,
			lang: "ko-KR",
			callbacks:{
				onImageUpload : function(files){
					uploadImage(files[0],this);
				}
			}
		});
	});
	function uploadImage(file,editor){
		var form = new FormData();
		form.append("file",file);
		$.ajax({
			url : "/uploadNoticeImage.do",
			type : "post",
			data : form,
			processData : false,
			enctype : 'multipart/form-data',
			contentType: false,
			success : function(data){
				$(editor).summernote("insertImage",data.url);
			}
		});
	}
	
	
</script>
</body>
</html>