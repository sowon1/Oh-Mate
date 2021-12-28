<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.img_viewer>img{
		height: 150px;
		width: 150px;
	}
	.report_popup_modal{
    /* 현재 화면 중앙에 모달 뜰수있게 */
	    position: fixed;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    /* 실제로 modal은 처음에 안보여야하니 none으로 */
	    display: none;
	    justify-content: center;
	    align-items: center;
	    z-index: 9993;
	}	
	.re_pop_modal{
	    width: 50vw;
	    min-width: 400px;
	    max-width: 400px;
	    height: 50vh;
	    min-height: 504px;
	    max-height: 504px;
	    text-align: left;
	    z-index: 10;
	    overflow-y: auto;
	    border-top-right-radius: 30px;
	    border-top-left-radius: 30px;
	    border-bottom-left-radius: 30px;
	    border-bottom-right-radius: 30px;
	}
	.re_modal_top{
	    display: block;
	    align-items: center;
	    width: 100%;
	    padding: 0px 20px;
	    /* justify-content: center; */
	    align-items: center;
	    background: #956bfc;
	    height: 60px;
	    text-align: center;
	    line-height: 60px;
	}
	.re_modal_text{
		font-size: 24px;
	    color: #fff;
	}
	
	.re_modal_top img{
		width:25px;
	}
	.re_modal_top span:last-child{
		float:right;	
	}
	.re_modal_content{
		background: #fff;
	    float: left;
	    width: 100%;
	    overflow: hidden;
	    height: auto;
	}
	.help_table{
		width: 100%;
	    box-sizing: border-box;
	    padding: 30px 30px 0px 30px;
	    border-collapse: inherit;
	}
	.report_helper{
		position: absolute;
	    right: 450px;
	    top: 120px;
	}
	.report_helper a{
		cursor: pointer;
	}
	.report_helper img{
		width: 50px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />	
	<div class="container_mate">
		<div class="funder_add">
			<div class="add_left border_a">
			    <div class="profileBottom">
			        <span class="profileText">
			            <p>헬퍼</p>
			            <p>${hdd.helperName }</p>
			        </span>
			        <span class="profileText">
			            <p>상태</p>
			            <p>
			            	<c:choose>
			            		<c:when test="${helpStatus eq 1 }">
			            			요청중
			            		</c:when>
			            		<c:when test="${helpStatus eq 2 }">
			            			처리중
			            		</c:when>
			            		<c:when test="${helpStatus eq 3 }">
			            			처리완료
			            		</c:when>
			            		<c:when test="${helpStatus eq 4 }">
			            			취소
			            		</c:when>
			            		<c:otherwise>
			            			확인중
			            		</c:otherwise>
			            	</c:choose>
			            </p>
			        </span>
			        <span class="profileText">
			            <p>요청일</p>
			            <p>${hdd.helpRequestDate }</p>
			        </span>
			        <span class="profileText">
			            <p>시작시간</p>
			            <p>${hdd.helpStartTime }</p>
			        </span>
			        <span class="profileText">
			            <p>마감시간</p>
			            <p>${hdd.helpEndTime }</p>
			        </span>
			         <span class="profileText">
			            <p>완료일</p>
			            <p>${hdd.helpFinishDate }</p>
			        </span>
			    </div>
			</div>			
			<div class="add_right border_a">
				<table class="table">
					<tr>
						<th>헬프</th>
						<th>${hdd.helpTitle }</th>
					</tr>
					<tr>
						<th>요청</th>
						<td>${hdd.helpContent }</td>
					</tr>
					<tr>
						<th>비용</th>
						<td>${hdd.helpCharge }원</td>
					</tr>
					<tr>
						<th>사진</th>
						<td class="img_viewer">
							<c:choose>
								<c:when test="${not empty hdd.photoList }">
									<c:forEach items="${hdd.photoList }" var="p">
										<img id="img_view" src="/resources/upload/helper/${p.photoPath }">
									</c:forEach>
								</c:when>
								<c:otherwise>
									<img id="img_view" src="/resources/img/icon/picture.png">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>완료메세지</th>
						<td>${hdd.helpComplite }</td>
					</tr>						
				</table>
			</div>
			<div class="helper_pro_btn">
	            <div class="report_helper">	            	
	            	<a id="helperReport"><img src="/resources/img/icon/report.png"></a>	            		
	            </div>	                                               
			</div>
			<div class="report_popup_modal">
                 	<div class="re_pop_modal">
	                 		<div class="re_modal_top">
		                  		<span class="re_modal_text">신고</span>
		                      	<span class="re_modal_close" style="cursor: pointer;"><img src="/resources/img/icon/close_wh.png"></span>
		                   </div>
		                   <div class="re_modal_content">
		                   		<form action="/helperReport.do" method="post" class="reform">
		                   			<table class="help_table">
	                        			<tr class="table-active_mate_help">
	                        				<th>신고 대상</th>
	                        				<td> 
	                        					<input type="text" class="input_03" value="${fn:substring(hdd.helperName,0,fn:length(hdd.helperName)-3)}**"readonly="readonly">
	                        					<input type="hidden" class="input_03" value="${hdd.memberNo}" name="hmemberNo" readonly="readonly">
	                        					<input type="hidden" class="input_03" value="${hdd.helperNo}" name="helperNo" readonly="readonly">
	                        				</td>
	                        			</tr>
	                        			<tr class="table-active_mate_help">
	                        				<th>신고자</th>
	                        				<td>
	                        					<input type="text" class="input_03" value="${sessionScope.m.memberName}" readonly="readonly">
	                        					<input type="hidden" class="input_03" value="${sessionScope.m.memberNo}" name="memberNo" readonly="readonly">
	                        				</td>
	                        			</tr>
	                        			<tr class="table-active_mate_help">
	                        				<th>신고분류</th>
	                        				<td>
	                        					<input type="text" class="input_03" value="헬퍼" readonly="readonly">
	                        				</td>
	                        			</tr>
	                        			<tr class="table-active_mate_help">
	                        				<th>신고사유</th>
	                        				<td>
	                        					<textarea name="reportContent" class="textarea_pro report_textarea"></textarea>
	                        				</td>
	                        			</tr>
                        			</table>
                        			<div class="form_btn">
	                        			<a class="btn_100" type="submit" onclick="return checkReVal();">신고하기</a>
	                        		</div>
		                   		</form>
		                   </div>
                 	</div>
                 </div>			
		</div>		
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		function reportopen(){
			$(".report_popup_modal").css("display","flex");
		    $("body").css("overflow", "hidden");
		    $(".tour_back_dark").show();			
		}
		function reportclose(){
			$(".report_popup_modal").css("display","none");
		    $("body").css("overflow", "auto");
		    $(".tour_back_dark").hide();			
		}
	//신고 팝업
		$("#helperReport").click(function(){
			reportopen();
		});
		$(".re_modal_close").click(function(){
			reportclose();
		});
		
		//신고 유효성 
		function checkReVal(){
			if($(".report_textarea").val() == ""){					
				 $(".title_name").text("사유를 입력해주세요.");
				 $("textarea[name='reportContent']").focus();
				countmsgopen(autoClose());
			}else{
				 $(".reform").submit();
			}
		}
	</script>
</body>
</html>