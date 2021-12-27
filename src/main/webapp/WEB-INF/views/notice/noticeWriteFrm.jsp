<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate!</title>
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
		<h1>공지사항 작성</h1>
		<br>
		<hr>
		<form action="/insertNotice.do" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="noticeTitle" class="input_03" autocomplete="off"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3" style="text-align:left;">
						<textarea id="noticeContent" name="noticeContent"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td style="text-align:left;">
						<input type="file" name="upfiles" multiple>
					</td>
					<td colspan="2" style="text-align:right;">
						<button type="submit" class="btn btn_pk" style="height: 60px;">등록</button>
						<a href="/noticeList.do?reqPage=1" class="btn" style="height: 60px;">목록</a>
					</td>
				</tr>		
			</table>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
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