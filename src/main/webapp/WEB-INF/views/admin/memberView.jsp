<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate! 회원정보</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="container_mate">
        <h1 class="point_title">회원 정보</h1>
        <div>
            <form action="/adminMemberUpdate.do" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="memberNo" value="${m.memberNo }">
                   <input type="hidden" name="memberLevel" value="${m.memberLevel }">
                <table class="table">
                    <tr class="table-active_mate center_list">
                        <th>프로필 이미지</th>
                        <td class="displayflex" colspan="3">
                            <div class="img-viewr">
                            	<c:choose>
                            		<c:when test="${not empty m.filepath }">
		                                <img id="img-view" class="profile_view" src="/resources/upload/member/${m.filepath }">	                            		
                            		</c:when>
                            		<c:otherwise>
                            			<img id="img-view" class="profile_view" src="/resources/img/icon/profile.png">
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                            <label class="btn btn_sm btn_out" for="profile">프로필 선택</label>
                            <input type="file" name="file" id="profile" accept=".jpg,.jpeg,.png,.gif" style="display: none;">
                        </td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>등급</th>
                        <td colspan="3">
                        	<c:choose>
                        		<c:when test="${m.memberLevel eq 0 }">
		                        	<input type="text" class="input_03" value="관리자" readonly>	                        			
                        		</c:when>
                        		<c:when test="${m.memberLevel eq 1 or m.memberLevel eq 5 }">
		                        	<input type="text" class="input_03" value="메이트" readonly>	                        			
                        		</c:when>
                        		<c:when test="${m.memberLevel eq 2 }">
                        			<input type="text" class="input_03" value="하우스오너" readonly>
                        		</c:when>
                        		<c:when test="${m.memberLevel eq 4 }">
                        			<input type="text" class="input_03" value="헬퍼" readonly>
                        		</c:when>
                        		<c:when test="${m.memberLevel eq 3 or m.memberLevel eq 6 or m.memberLevel eq 7 }">
                        			<input type="text" class="input_03" value="계정정지" readonly>
                        		</c:when>
                        	</c:choose>
                        </td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>아이디</th>
                        <td colspan="3"><input type="text" name="memberId" class="input_03" value="${m.memberId }" readonly></td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>비밀번호</th>
                        <td colspan="3"><input type="password" name="memberPw" class="input_03" value="${m.memberPw }" maxlength="12"></td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>이름</th>
                        <td colspan="3"><input type="text" name="memberName" class="input_03" value="${m.memberName }" maxlength="6"></td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>전화번호</th>
                        <td colspan="3"><input type="text" name="phone" class="input_03" value="${m.phone }" placeholder="010-0000-0000"><span></span></td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>이메일</th>
                        <td colspan="3"><input type="text" name="email" class="input_03" value="${m.email }" readonly></td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>가입일</th>
                        <td colspan="3"><input type="text" name="enrollDate" class="input_03" value="${m.enrollDate }" readonly></td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>성별</th>
                        <td colspan="3">
                            <div class="select">
                            	<c:choose>
                            		<c:when test="${m.gender eq 1 }">
		                                <input type="radio" id="select" name="gender" value="1" checked><label for="select" style="width:130px;">남자</label>
		                                <input type="radio" id="select2" name="gender" value="2"><label for="select2" style="width:130px;">여자</label>
                            		</c:when>
                            		<c:when test="${m.gender eq 2 }">
		                                <input type="radio" id="select" name="gender" value="1"><label for="select" style="width:130px;">남자</label>
		                                <input type="radio" id="select2" name="gender" value="2" checked><label for="select2" style="width:130px;">여자</label>
                            		</c:when>
                            	</c:choose>
                            </div>
                        </td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>나이</th>
                        <td colspan="3">
                            <div class="select">
                            	<c:choose>
                            		<c:when test="${m.age eq 1 }">
		                                <input type="radio" id="select3" name="age" value="1" checked><label for="select3" style="width:130px;">20대</label>
		                                <input type="radio" id="select4" name="age" value="2"><label for="select4" style="width:130px;">30대</label>
		                                <input type="radio" id="select5" name="age" value="3"><label for="select5" style="width:130px;">40대 이상</label>	                            			
                            		</c:when>
                            		<c:when test="${m.age eq 2 }">
		                                <input type="radio" id="select3" name="age" value="1"><label for="select3" style="width:130px;">20대</label>
		                                <input type="radio" id="select4" name="age" value="2" checked><label for="select4" style="width:130px;">30대</label>
		                                <input type="radio" id="select5" name="age" value="3"><label for="select5" style="width:130px;">40대 이상</label>	                            			
                            		</c:when>
                            		<c:when test="${m.age eq 3 }">
		                                <input type="radio" id="select3" name="age" value="1"><label for="select3" style="width:130px;">20대</label>
		                                <input type="radio" id="select4" name="age" value="2"><label for="select4" style="width:130px;">30대</label>
		                                <input type="radio" id="select5" name="age" value="3" checked><label for="select5" style="width:130px;">40대 이상</label>	                            			
                            		</c:when>
                            	</c:choose>
                            </div>
                        </td>
                    </tr>
                    <!-- 메이트 또는 헬퍼, 헬퍼 박탈 회원 및 계정 정지인 경우 -->
                   	<c:if test="${m.memberLevel ne 2 }">
	                    <tr class="table-active_mate">
	                        <th>메이트 프로필 상태</th>
	                        <td>
	                        	<c:choose>
	                        		<c:when test="${m.profileStatus eq 1 }">
			                        	<a href="javascript:profileMgrModal()">등록</a>
	                        		</c:when>
	                        		<c:when test="${m.profileStatus eq 2 }">
			                        	<a href="javascript:modalShow()">미등록</a>
	                        		</c:when>
	                        	</c:choose>
	                        </td>
	                        <c:if test="${m.memberLevel eq 4 or m.memberLevel eq 5 or m.memberLevel eq 6 or m.memberLevel eq 7 }">
		                        <th>헬퍼 박탈<span>※ 헬퍼 활동 및 신청 불가</span></th>
		                        <td>
		                            <div class="form-check form-switch">
		                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"
		                                	<c:choose>
		                                		<c:when test="${m.memberLevel eq 5 or m.memberLevel eq 7}">
			                                		checked
		                                		</c:when>
		                                	</c:choose>
		                                name="helperStatus">
		                                <label class="form-check-label" for="flexSwitchCheckDefault"></label>
		                            </div>
		                        </td>
	                        </c:if>
	                    </tr>
                   	</c:if>
                </table>
                <div class="btnBox">
                    <button type="button" class="btn btn_out">목록</button>
                    <input type="submit" class="btn" value="수정">
                </div>
            </form>
        </div>
	</div>
	<!-- 프로필 모달 -->
	<div id="modal_profile" class="modal_profile">
		<div class="modal_profile_win">
			<div class="modal_profile_title">
				<h3>프로필 등록</h3>
				<span class="modal_profile_close">
					<img src="/resources/img/icon/close_wh.png">
				</span>
			</div>
			<div class="modal_profile_content">
				<form action="/adminInsertProfile.do" method="post" name="profileFrm">
	            	<input type="hidden" name="pWriter" value="${m.memberId }">
	            	<input type="hidden" name="memberNo" value="${m.memberNo }">
	                <table class="table">
	                	<tr class="table-active_mate">
	                		<th>선호 지역</th>
	                		<td>
	                			<select class="form-select" name="pLocal">
	                				<option value="0" class="n">지역구 선택</option>
	                			</select>
	                		</td>
	                	</tr>
	                    <tr class="table-active_mate">
	                        <th>성별 타입</th>
	                        <td>
	                            <div class="select">
	                                <input type="radio" id="pGender" name="pGender" value="1"><label for="pGender">남성전용</label>
	                                <input type="radio" id="pGender2" name="pGender" value="2"><label for="pGender2">여성전용</label>
	                                <input type="radio" id="pGender3" name="pGender" value="3"><label for="pGender3">남녀공용</label>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>선호 나이</th>
	                        <td>
	                            <div class="select">
	                                <input type="radio" id="pAge" name="pAge" value="1"><label for="pAge">20대</label>
	                                <input type="radio" id="pAge2" name="pAge" value="2"><label for="pAge2">30대</label>
	                                <input type="radio" id="pAge3" name="pAge" value="3"><label for="pAge3">40대 이상</label>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>흡연 여부</th>
	                        <td>
	                            <div class="select">
	                                <input type="radio" id="pSmoke" name="pSmoke" value="1"><label for="pSmoke">비흡연</label>
	                                <input type="radio" id="pSmoke2" name="pSmoke" value="2"><label for="pSmoke2">흡연</label>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>반려동물</th>
	                        <td>
	                            <div class="select">
	                                <input type="radio" id="pPet" name="pPet" value="1"><label for="pPet">없음</label>
	                                <input type="radio" id="pPet2" name="pPet" value="2"><label for="pPet2">있음</label>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>청소</th>
	                        <td>
	                            <div class="select">
	                                <input type="radio" id="pCleaning" name="pCleaning" value="1"><label for="pCleaning">좋아함</label>
	                                <input type="radio" id="pCleaning2" name="pCleaning" value="2"><label for="pCleaning2">싫어함</label>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>생활 패턴</th>
	                        <td>
	                            <div class="select">
	                                <input type="radio" id="pPattern" name="pPattern" value="1"><label for="pPattern">밤</label>
	                                <input type="radio" id="pPattern2" name="pPattern" value="2"><label for="pPattern2">낮</label>
	                            </div>
	                        </td>
	                    </tr>
	                </table>
	            	<div class="btnBox">
	                	<input type="submit" class="btn" value="등록">
	        		</div>
	    		</form>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<link rel="stylesheet" href="/resources/css/admin/memberView.css">
<script type="text/javascript" src="/resources/js/admin/memberView.js"></script>
</html>