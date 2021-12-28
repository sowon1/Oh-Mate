<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<style>
	.img_viewer>img{
		height: 130px;
		width: 130px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />	
	<div class="container_mate">
		<h1 class="point_title">헬프 리뷰 작성</h1>
		<br>
		<hr>
		<br>
		<div class="funder_add">
			<div class="add_left border_a">
			    <div class="profileBottom">
			        <span class="profileText">
			            <p>헬프 제목</p>
			            <p style="overflow: hidden;">${helpTitle }</p>
			        </span>
			        <span class="profileText">
			            <p>담당 헬퍼</p>
			            <p>${helperName }</p>
			        </span>
			        <span class="profileText">
			            <p>요청일</p>
			            <p>${helpRequestDate }</p>
			        </span>
			         <span class="profileText">
			            <p>완료일</p>
			            <p>${helpFinishDate }</p>
			        </span>
			    </div>
			</div>
			<form action="/helpReviewWrite.do" method="post" enctype="multipart/form-data" id="funder_add">
				<div class="add_right border_a">
					<table class="table">
						<tr>
							<th>제목</th>
						    <td><input type="text" name="reviewTitle" class="input_03"></td>
						</tr>
						<tr>
							<th>별점</th>
							<td>
								<div class="star-wrap">
									<img class="star" src="/resources/img/icon/star-off.png">
									<img class="star" src="/resources/img/icon/star-off.png">
									<img class="star" src="/resources/img/icon/star-off.png">
									<img class="star" src="/resources/img/icon/star-off.png">
									<img class="star" src="/resources/img/icon/star-off.png">
									<input type="hidden" name="asterion" id="result">						
								</div>
							</td>
						</tr>						
						<tr>
						    <th>내용</th>
						    <td>
						        <textarea id="reviewContent" name="reviewContent" class="textarea_pro"></textarea>					 
							</td>
						</tr>
						<tr>
							<th rowspan="2">사진</th>
							<td>
								<input type="file" id="image" accept="image/*" name="reviewImg" onchange="loadImg(this);"/>
							</td>
						</tr>
						<tr>
							<td>
								<div class="img_viewer">
									<img id="img_view" src="/resources/img/icon/picture.png">
								</div>
							</td>
						</tr>
					</table>
					<div class="next_btn">
						<input type="hidden" name="memberNo" value="${memberNo }">
						<input type="hidden" name="helperNo" value="${helperNo }">
						<input type="hidden" name="helpNo" value="${helpNo }">
					    <button class="btn btn_100" type="submit">작성완료</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>
<script>
    $(function(){   
        $(".star-wrap>img").mouseover(function(){
            var star = $("#result");
            var idx = $(".star-wrap>img").index(this);       
            $(".star-wrap>img").each(function(index,item){
                if(index<=idx){
                    $(item).attr("src","/resources/img/icon/star-on.png");
                }else{
                    $(item).attr("src","/resources/img/icon/star-off.png");
                }
            });
            star.val(idx+1);
        });
    });
    
    function loadImg(obj){
		var files = obj.files; 
		console.log(files);
		if(files.length !=0){
			var reader = new FileReader(); 
			reader.readAsDataURL(files[0]);
			reader.onload = function(e){
				$("#img_view").attr("src",e.target.result);
			}
		}else{
			$("#img_view").attr("src","");			
		}
	}
   /*  function onTestChange() {
        var key = window.event.keyCode;

        // If the user has pressed enter
        if (key === 13) {
        	var html = $("#reviewText").val().replace(/(?:\r\n|\r|\n)/g, '<br />');
        	$("#reviewContent").html(html);
        	console.log($("#reviewContent").val());
        }
        
    } */
</script>
</html>